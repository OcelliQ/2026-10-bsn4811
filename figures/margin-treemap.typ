#import "/figures/profit-pool-data.typ": data-note, layers
#import "/common.typ": accent

// Treemap of AI revenue by layer. Area ~ revenue (with a floor, see note),
// colour = operating margin. Tiny companies get a minimum weight so every
// company in the data has a visible, labelled tile.
#let min-weight = 38 // US$B-equivalent floor for tile area
#let lo = -150
#let hi = 80
#let red = rgb("#c62828")
#let green = rgb("#2e7d32")
#let mid = luma(235)

#let margin-color(m) = {
  if m <= 0 {
    let t = calc.min(1, -m / -lo)
    color.mix((mid, 1 - t), (red, t), space: oklab)
  } else {
    let t = calc.min(1, m / hi)
    color.mix((mid, 1 - t), (green, t), space: oklab)
  }
}

#let fmt-margin(m) = if m == none { "n/a" } else if m < 0 {
  [#sym.minus;#calc.abs(m)%]
} else { [+#m%] }

#let hatch = tiling(size: (5pt, 5pt))[
  #rect(width: 100%, height: 100%, fill: luma(225), stroke: none)
  #place(line(start: (-1pt, 6pt), end: (6pt, -1pt), stroke: 1.5pt + luma(140)))
]

// Squarified layout. items: array of (w: weight, ..). Region in float pt.
// Returns array of (item, x, y, w, h) in pt floats.
#let squarify(items, x0, y0, w0, h0) = {
  let items = items.sorted(key: it => -it.w)
  let total = items.map(it => it.w).sum()
  let k = w0 * h0 / total
  let (x, y, w, h) = (x0, y0, w0, h0)
  let out = ()
  let rest = items
  while rest.len() > 0 {
    let side = calc.min(w, h)
    let worst(row) = {
      let s = row.map(it => it.w * k).sum()
      let mx = calc.max(..row.map(it => it.w * k))
      let mn = calc.min(..row.map(it => it.w * k))
      calc.max(side * side * mx / (s * s), s * s / (side * side * mn))
    }
    let n = 1
    while (
      n < rest.len() and worst(rest.slice(0, n + 1)) <= worst(rest.slice(0, n))
    ) {
      n += 1
    }
    let row = rest.slice(0, n)
    rest = rest.slice(n)
    let s = row.map(it => it.w * k).sum()
    let thick = s / side
    let pos = 0.0
    for it in row {
      let len = it.w * k / thick
      if w >= h {
        out.push((it, x, y + pos, thick, len))
      } else {
        out.push((it, x + pos, y, len, thick))
      }
      pos += len
    }
    if w >= h {
      x += thick
      w -= thick
    } else {
      y += thick
      h -= thick
    }
  }
  out
}

#let tile(c, w, h) = {
  let m = c.margin
  let fill = if m == none { hatch } else { margin-color(m) }
  let dark = m != none and (m <= -90 or m >= 45)
  let small = w < 100 or h < 38
  let sz = if calc.min(w, h) > 90 { 1em } else if small { 0.55em } else {
    0.7em
  }
  box(
    width: w * 1pt,
    height: h * 1pt,
    clip: true,
    fill: fill,
    inset: 3pt,
    align(
      left + top,
      text(
        fill: if dark { white } else { black },
        size: sz,
        {
          par(leading: 0.25em)[#text(weight: "bold", c.name) \ #fmt-margin(m)]
        },
      ),
    ),
  )
}

#let margin-treemap(width: 23.5cm, height: 11.2cm) = context {
  let W = width.to-absolute() / 1pt
  let H = height.to-absolute() / 1pt
  let leg-h = 18.0 // legend + note strip
  let note-h = 14.0
  let area-h = H - leg-h - note-h
  let gap = 4.0
  let head = 15.0

  let wt(c) = calc.max(c.revenue, min-weight)
  let gw(l) = l.companies.map(wt).sum()
  let by-name(n) = layers.find(l => l.name == n)
  let (chips, infra, models, apps) = ("Chips", "Infra", "Models", "Apps").map(
    by-name,
  )
  let tw = layers.map(gw).sum()
  let colw(ws) = ws.sum() / tw * (W - 2 * gap)
  let w3 = calc.max(colw((gw(models),)), 0.21 * W)
  let k12 = (W - 2 * gap - w3) / (gw(chips) + gw(infra))
  let w1 = gw(chips) * k12
  let w2 = gw(infra) * k12
  let hm = gw(models) / (gw(models) + gw(apps)) * area-h

  let group(l, x, y, w, h) = {
    place(left + top, dx: x * 1pt, dy: y * 1pt, rect(
      width: w * 1pt,
      height: head * 1pt,
      fill: white,
      stroke: none,
      inset: (x: 1pt),
      align(left + horizon, text(
        size: 0.65em,
        weight: "bold",
        fill: luma(60),
      )[#upper(l.name)]),
    ))
    let tiles = l.companies.map(c => (w: wt(c), c: c))
    for (it, tx, ty, tw_, th) in squarify(tiles, x, y + head, w, h - head) {
      place(left + top, dx: (tx + 0.75) * 1pt, dy: (ty + 0.75) * 1pt, tile(
        it.c,
        tw_ - 1.5,
        th - 1.5,
      ))
    }
  }

  box(width: width, height: height, {
    group(chips, 0, 0, w1, area-h)
    group(infra, w1 + gap, 0, w2, area-h)
    group(models, w1 + w2 + 2 * gap, 0, w3, hm - gap / 2)
    group(apps, w1 + w2 + 2 * gap, hm + gap / 2, w3, area-h - hm - gap / 2)
    // legend
    place(left + top, dx: 0pt, dy: (area-h + 4) * 1pt, {
      set text(size: 0.55em)
      stack(
        dir: ltr,
        spacing: 4pt,
        text(fill: luma(60))[Operating margin:],
        [#sym.minus;150%],
        rect(
          width: 3.5cm,
          height: 8pt,
          stroke: 0.4pt + luma(150),
          fill: gradient.linear(
            (red, 0%),
            (mid, 150 / 230 * 100%),
            (green, 100%),
          ),
        ),
        [+80%],
        h(10pt),
        box(width: 14pt, height: 8pt, fill: hatch, stroke: 0.4pt + luma(150)),
        [no reported margin (inside a profitable parent). Area = revenue; tiles under US\$#min-weight;B drawn at a minimum size.],
      )
    })
    place(left + bottom, text(size: 0.55em, fill: luma(110), data-note))
  })
}
