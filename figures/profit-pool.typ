// Option 1: profit pool map (Bain / Gadiesh & Gilbert, HBR 1998).
// x = cumulative revenue share, bar height = operating margin.
#import "/common.typ": accent
#import "profit-pool-data.typ": data-note, gain, layer-colors, layers, loss

#let profit-pool(width: 25cm) = {
  // ---- geometry (cm), designed at 25cm wide then scaled to `width` ----
  let s = 0.0155 // cm per US$B in the main chart
  let min-w = 0.11 // minimum visible bar width (cm)
  let ymax = 108
  let ymin = -150
  let ph = 8.8 // plot height
  let k = ph / (ymax - ymin)
  let yy(v) = (ymax - v) * k * 1cm // v (%) -> offset from plot top
  let hatch-h = 22 // fixed height (in %) of no-margin bars
  let x0 = 1.3 // plot left (room for y axis)
  let pt = 0.2 // plot top within the box
  let main-w = 14.2
  let inset-x = x0 + main-w + 1.2
  let inset-w = 25 - inset-x - 0.1
  let tile = tiling(size: (5pt, 5pt))[
    #place(rect(width: 5pt, height: 5pt, fill: white))
    #place(line(start: (0pt, 5pt), end: (5pt, 0pt), stroke: 0.8pt + luma(90)))
  ]
  let short = (
    "Google DeepMind": "DeepMind",
    "Google Cloud": "G. Cloud",
    "Meta (Llama)": "Meta",
  )
  let lab(c) = short.at(c.name, default: c.name)
  let wm(body, fill: black) = text(
    size: 0.7em,
    weight: "bold",
    fill: fill,
    body,
  )

  // build main-chart bars
  let bars = ()
  let x = 0.0
  let spans = ()
  for l in layers {
    let lx = x
    for c in l.companies {
      let w = calc.max(c.revenue * s, min-w)
      bars.push((c: c, layer: l.name, x: x, w: w))
      x += w
    }
    spans.push((name: l.name, x: lx, w: x - lx))
  }
  let total-w = x
  // main chart is laid out in a box of width main-w; rescale to fit exactly
  let f = main-w / total-w
  bars = bars.map(b => (..b, x: b.x * f, w: b.w * f))
  spans = spans.map(b => (..b, x: b.x * f, w: b.w * f))

  let bar-rect(b, w, h-val, p) = {
    let c = b.c
    let col = layer-colors.at(b.layer)
    if c.margin == none {
      place(
        top + left,
        dx: p.dx,
        dy: yy(hatch-h),
        rect(
          width: w * 1cm,
          height: hatch-h * k * 1cm,
          fill: tile,
          stroke: 0.8pt + luma(90),
        ),
      )
    } else if c.margin >= 0 {
      place(
        top + left,
        dx: p.dx,
        dy: yy(c.margin),
        rect(width: w * 1cm, height: c.margin * k * 1cm, fill: col),
      )
    } else {
      place(
        top + left,
        dx: p.dx,
        dy: yy(0),
        rect(width: w * 1cm, height: -c.margin * k * 1cm, fill: col),
      )
    }
  }
  // vertical label box above (anchor bottom) or below (anchor top) a point
  let vlabel(cx, ytop, body, below: false, len: 3cm) = place(
    top + left,
    dx: (cx - 0.25) * 1cm,
    dy: if below { ytop } else { ytop - len },
    box(
      width: 0.5cm,
      height: len,
      align(
        if below { top + center } else { bottom + center },
        rotate(-90deg, reflow: true, body),
      ),
    ),
  )

  let plot-h = ph * 1cm
  let box-h = 11.35cm
  let ticks = (-150, -100, -50, 0, 50)

  let fig = box(width: 25cm, height: box-h, {
    // ---- gridlines + y axis ----
    for t in ticks {
      let ycm = pt * 1cm + yy(t)
      place(
        top + left,
        dx: x0 * 1cm,
        dy: ycm,
        line(
          length: (main-w + 1.2 + inset-w + 0.1) * 1cm,
          stroke: if t == 0 { 0pt } else { 0.4pt + luma(220) },
        ),
      )
      place(
        top + left,
        dx: 0cm,
        dy: ycm - 0.22cm,
        box(width: (x0 - 0.15) * 1cm, align(right, text(
          size: 0.6em,
          fill: luma(80),
        )[#t%])),
      )
    }
    place(
      top + left,
      dx: 0cm,
      dy: -0.45cm,
      text(size: 0.6em, fill: luma(80))[Operating margin],
    )

    // ---- main chart (plot-local coordinates) ----
    place(top + left, dx: x0 * 1cm, dy: pt * 1cm, box(
      width: main-w * 1cm,
      height: plot-h,
      {
        for b in bars {
          let c = b.c
          bar-rect(b, b.w, none, (dx: b.x * 1cm))
          let cx = b.x + b.w / 2
          let in-models = b.layer == "Models" or b.layer == "Apps"
          if not in-models {
            let hatched = c.margin == none
            if b.w >= 1.4 {
              place(
                top + left,
                dx: b.x * 1cm,
                dy: yy(c.margin) + 0.12cm,
                box(width: b.w * 1cm, align(center, wm(
                  fill: white,
                )[#c.name #c.margin%])),
              )
            } else if c.margin >= 0 and c.name != "AMD" {
              vlabel(cx, yy(c.margin) - 0.05cm, wm[#lab(c)])
            } else if c.margin >= 0 {
              // AMD: no room above; label hangs below the zero line
              vlabel(cx, yy(0) + 0.1cm, wm[#lab(c)], below: true, len: 1.6cm)
            } else {
              // CoreWeave: horizontal label to the left of the bar
              place(top + left, dx: (cx - 3.4) * 1cm, dy: yy(-12), box(
                width: 3.3cm,
                align(right, wm[#lab(c) #c.margin%]),
              ))
              place(top + left, dx: (cx - 0.1) * 1cm, dy: yy(-12) + 0.2cm, line(
                length: 0.1cm,
                stroke: 0.6pt + luma(120),
              ))
            }
          }
        }
        // heavy zero line
        place(top + left, dy: yy(0), line(
          length: main-w * 1cm,
          stroke: 1.6pt + black,
        ))
        // loss-maker note
        place(
          top + left,
          dx: 0.2cm,
          dy: yy(-45),
          text(
            size: 0.62em,
            fill: loss,
            weight: "bold",
          )[Below the line: losing money],
        )
      },
    ))

    // ---- layer labels under main chart ----
    let by = (pt + ph) * 1cm + 0.1cm
    for sp in spans {
      let col = layer-colors.at(sp.name)
      if sp.name != "Models" and sp.name != "Apps" {
        place(
          top + left,
          dx: (x0 + sp.x) * 1cm + 0.03cm,
          dy: by,
          rect(width: (sp.w - 0.06) * 1cm, height: 0.12cm, fill: col),
        )
        place(
          top + left,
          dx: (x0 + sp.x) * 1cm,
          dy: by + 0.2cm,
          box(width: sp.w * 1cm, align(center, text(
            size: 0.75em,
            weight: "bold",
            fill: col,
          )[#sp.name])),
        )
      }
    }
    // Models+Apps share one marker bracket
    let ma = spans.filter(sp => sp.name == "Models" or sp.name == "Apps")
    let mx = ma.first().x
    let mw = ma.last().x + ma.last().w - mx
    place(
      top + left,
      dx: (x0 + mx) * 1cm,
      dy: by,
      rect(width: mw * 1cm, height: 0.12cm, fill: layer-colors.Models),
    )
    // revenue share row
    let tot = layers.map(l => l.companies.map(c => c.revenue).sum()).sum()
    for (i, sp) in spans.enumerate() {
      if sp.name == "Chips" or sp.name == "Infra" {
        let r = layers.at(i).companies.map(c => c.revenue).sum()
        place(
          top + left,
          dx: (x0 + sp.x) * 1cm,
          dy: by + 0.75cm,
          box(width: sp.w * 1cm, align(center, text(
            size: 0.6em,
            fill: luma(90),
          )[#calc.round(r / tot * 100)% of revenue])),
        )
      }
    }

    // ---- zoom funnel + inset ----
    let ptop = pt * 1cm
    let pbot = (pt + ph) * 1cm
    let zl = (x0 + mx) * 1cm
    let zr = (x0 + mx + mw) * 1cm
    let il = inset-x * 1cm
    place(top + left, dx: il, dy: ptop, rect(
      width: inset-w * 1cm,
      height: plot-h,
      fill: luma(247),
      stroke: 0.6pt + luma(170),
    ))
    place(top + left, curve(
      stroke: (paint: luma(150), thickness: 0.6pt, dash: "dashed"),
      curve.move((zl, ptop)),
      curve.line((il, ptop)),
    ))
    place(top + left, curve(
      stroke: (paint: luma(150), thickness: 0.6pt, dash: "dashed"),
      curve.move((zr, pbot)),
      curve.line((il, pbot)),
    ))
    place(
      top + left,
      dx: il + 0.15cm,
      dy: -0.45cm,
      text(
        size: 0.6em,
        weight: "bold",
        fill: luma(60),
      )[Zoom on Models and Apps (bars equal width)],
    )

    // inset bars: equal widths (not to scale), same y scale as main chart
    let items = ()
    for l in layers.filter(l => l.name == "Models" or l.name == "Apps") {
      for c in l.companies { items.push((c: c, layer: l.name)) }
    }
    let n = items.len()
    let gap = 0.45
    let cw = (inset-w - 0.3 - gap) / n
    let bw = cw * 0.78
    let ix(i) = {
      let extra = if i >= layers.at(2).companies.len() { gap } else { 0 }
      0.15 + i * cw + extra + (cw - bw) / 2
    }
    place(top + left, dx: il, dy: ptop, box(
      width: inset-w * 1cm,
      height: plot-h,
      {
        for (i, it) in items.enumerate() {
          let c = it.c
          let b = (c: c, layer: it.layer)
          let col = layer-colors.at(it.layer)
          let px = ix(i) * 1cm
          bar-rect(b, bw, none, (dx: px))
          let cx = ix(i) + bw / 2
          if c.margin == none {
            vlabel(cx, yy(hatch-h) - 0.05cm, wm[#lab(c)], len: 2.6cm)
          } else if c.margin >= 0 {
            vlabel(cx, yy(c.margin) - 0.05cm, wm[#lab(c)], len: 2.6cm)
          } else {
            let h = -c.margin * k * 1cm
            place(top + left, dx: (cx - 0.25) * 1cm, dy: yy(0), box(
              width: 0.5cm,
              height: h,
              align(top + center, rotate(-90deg, reflow: true, wm(
                fill: white,
              )[#lab(c)])),
            ))
          }
        }
        place(top + left, dy: yy(0), line(
          length: inset-w * 1cm,
          stroke: 1.6pt + black,
        ))
      },
    ))
    // inset bottom rows: revenue
    for (i, it) in items.enumerate() {
      let r = it.c.revenue
      let txt = if r == 0 { [n/a] } else { [#r] }
      place(
        top + left,
        dx: (inset-x + ix(i) - 0.1) * 1cm,
        dy: pbot + 0.1cm,
        box(width: (bw + 0.2) * 1cm, align(center, text(
          size: 0.55em,
          fill: luma(90),
        )[#txt])),
      )
    }
    place(
      top + left,
      dx: (inset-x - 1.6) * 1cm,
      dy: pbot + 0.1cm,
      box(width: 1.5cm, align(right, text(
        size: 0.55em,
        fill: luma(90),
      )[\$B rev.])),
    )
    // layer bars in inset
    let nm = layers.at(2).companies.len()
    place(top + left, dx: (inset-x + 0.15) * 1cm, dy: pbot + 0.65cm, rect(
      width: nm * cw * 1cm - 0.05cm,
      height: 0.12cm,
      fill: layer-colors.Models,
    ))
    place(
      top + left,
      dx: (inset-x + 0.15 + nm * cw) * 1cm,
      dy: pbot + 0.65cm,
      rect(
        width: (n - nm) * cw * 1cm + gap * 1cm,
        height: 0.12cm,
        fill: layer-colors.Apps,
      ),
    )
    place(top + left, dx: (inset-x + 0.15) * 1cm, dy: pbot + 0.85cm, box(
      width: nm * cw * 1cm,
      align(center, text(
        size: 0.75em,
        weight: "bold",
        fill: layer-colors.Models,
      )[Models]),
    ))
    place(
      top + left,
      dx: (inset-x + 0.15 + nm * cw) * 1cm,
      dy: pbot + 0.85cm,
      box(width: (n - nm) * cw * 1cm + gap * 1cm, align(center, text(
        size: 0.75em,
        weight: "bold",
        fill: layer-colors.Apps,
      )[Apps])),
    )

    // legend for hatched
    place(
      top + left,
      dx: (x0 + 0.2) * 1cm,
      dy: (pt + ph) * 1cm - 1.9cm,
      grid(
        columns: (0.8cm, auto),
        column-gutter: 0.2cm,
        align: horizon,
        rect(
          width: 0.8cm,
          height: 0.45cm,
          fill: tile,
          stroke: 0.8pt + luma(90),
        ),
        text(
          size: 0.62em,
          fill: luma(60),
        )[no reported margin (fixed height, not an estimate)],
      ),
    )

    // footnote
    place(
      bottom + left,
      text(
        size: 0.55em,
        fill: luma(120),
      )[#data-note Bar width = share of revenue, with a minimum visible width on thin slivers; inset bars are equal width, not to scale.],
    )
  })
  scale(width / 25cm * 100%, reflow: true, fig)
}
