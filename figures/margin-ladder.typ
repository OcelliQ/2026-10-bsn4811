#import "/common.typ": accent

// Gross vs net margin by business, left to right, margins improving
// rightwards. Each entry: name, gross (lo, hi), net (lo, hi), highlight.
// A range draws its midpoint and labels the range; net: none means "< 0".
#let margin-ladder(entries, width: 24cm, height: 10cm) = {
  let lo = -25
  let hi = 90
  let label-h = 1.1cm
  let plot-h = height - label-h
  let sy(m) = plot-h * (hi - m) / (hi - lo)
  let col-w = width / entries.len()
  let bar-w = col-w * 0.28
  let fmt(r) = if r.at(0) == r.at(1) { [#r.at(0)%] } else { [#r.at(0)--#r.at(1)%] }
  let loss = rgb("#c62828")

  box(width: width, height: height, {
    // zero line
    place(top + left, dy: sy(0), line(length: width, stroke: 0.6pt + luma(150)))
    for (i, e) in entries.enumerate() {
      let x0 = i * col-w + col-w / 2
      let hl = e.at("highlight", default: false)
      let gross-fill = if hl { accent } else { luma(150) }
      let net-fill = if hl { accent.darken(35%) } else { luma(70) }
      for (j, (r, fill)) in ((e.gross, gross-fill), (e.net, net-fill)).enumerate() {
        let x = x0 + (j - 1) * bar-w - (j - 0.5) * 0.1cm
        if r == none {
          // negative, no reliable figure: short red stub below zero
          place(top + left, dx: x, dy: sy(0), rect(width: bar-w, height: sy(-15) - sy(0), fill: loss))
          place(top + left, dx: x - 0.5cm, dy: sy(-15) + 0.1cm, box(width: bar-w + 1cm, align(
            center,
            text(size: 0.85em, fill: loss, weight: "bold")[< 0],
          )))
        } else {
          let m = (r.at(0) + r.at(1)) / 2
          let t = calc.max(m, 0)
          place(top + left, dx: x, dy: sy(t), rect(width: bar-w, height: calc.abs(sy(m) - sy(0)), fill: fill))
          place(top + left, dx: x - 0.6cm, dy: sy(t) - 0.65cm, box(width: bar-w + 1.2cm, align(
            center,
            text(size: 0.85em)[#fmt(r)],
          )))
        }
      }
      // business label
      place(top + left, dx: i * col-w, dy: plot-h + 0.2cm, box(width: col-w, align(
        center,
        text(size: 0.95em, weight: if hl { "bold" } else { "regular" }, fill: if hl { accent } else { black })[#e.name],
      )))
    }
  })
}

// Legend chips for the two bar shades.
#let margin-legend = {
  let chip(fill, body) = box(baseline: 0.15em, rect(width: 0.8em, height: 0.8em, fill: fill)) + h(0.3em) + body
  text(size: 0.8em)[#chip(luma(150))[Gross margin] #h(1.2em) #chip(luma(70))[Net margin]]
}
