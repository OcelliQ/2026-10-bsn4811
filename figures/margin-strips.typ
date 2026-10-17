#import "/common.typ": accent
#import "/figures/profit-pool-data.typ": (
  data-note, gain, layer-colors, layers, loss,
)

// Logo strips: one operating-margin number line per layer, shared axis.
#let margin-strips(width: 25cm, height: 11.5cm) = {
  let lab-w = 2.1cm // layer-name column
  let nr-w = 3.6cm // "no reported margin" box
  let gap = 0.4cm
  let lo = -160
  let hi = 85
  let plot-w = width - lab-w - nr-w - gap
  let sx(m) = lab-w + (m - lo) / (hi - lo) * plot-w
  let strip-h = 2.4cm
  let n = layers.len()
  let top-pad = 0.1cm
  let axis-y = top-pad + n * strip-h
  // label overrides: (above?, shift) where shift -1 right-aligns, +1 left-aligns
  let place-ov = (
    CoreWeave: (true, -1),
    Oracle: (false, 0),
    "Google Cloud": (false, 1, 0.7),
    AWS: (true, -1),
    Azure: (true, 1, 0.5),
    AMD: (true, 0),
    Broadcom: (false, -1),
    TSMC: (true, 0),
    Nvidia: (false, 0),
  )
  let ticks = (-150, -100, -50, 0, 50, 80)
  let radius(rev) = calc.max(0.17cm, 0.036cm * calc.sqrt(rev)) // area ~ revenue
  let hatch = tiling(size: (6pt, 6pt), line(
    start: (0pt, 6pt),
    end: (6pt, 0pt),
    stroke: 0.6pt + luma(190),
  ))

  box(width: width, height: height, {
    // tints
    place(top + left, dx: sx(lo), dy: top-pad, rect(
      width: sx(0) - sx(lo),
      height: n * strip-h,
      fill: loss.transparentize(92%),
      stroke: none,
    ))
    place(top + left, dx: sx(0), dy: top-pad, rect(
      width: sx(hi) - sx(0),
      height: n * strip-h,
      fill: gain.transparentize(92%),
      stroke: none,
    ))
    // tick gridlines + labels
    for t in ticks {
      place(top + left, dx: sx(t), dy: top-pad, line(
        length: n * strip-h,
        angle: 90deg,
        stroke: 0.4pt + luma(210),
      ))
      place(top + left, dx: sx(t) - 1cm, dy: axis-y + 0.08cm, box(
        width: 2cm,
        align(center, text(
          0.7em,
          fill: luma(90),
        )[#if t > 0 [+]#if t < 0 [#sym.minus]#calc.abs(t)%]),
      ))
    }
    place(top + left, dx: sx(lo), dy: axis-y + 0.55cm, box(
      width: sx(hi) - sx(lo),
      align(center, text(
        0.65em,
        fill: luma(90),
      )[Operating margin #sym.dot.c marker area #sym.tilde revenue]),
    ))
    // zero line
    place(top + left, dx: sx(0) - 1.2pt, dy: top-pad, line(
      length: n * strip-h,
      angle: 90deg,
      stroke: 2.4pt + luma(40),
    ))

    for (i, layer) in layers.enumerate() {
      let col = layer-colors.at(layer.name)
      let mid = top-pad + i * strip-h + strip-h / 2
      if i > 0 {
        place(top + left, dy: top-pad + i * strip-h, line(
          length: width,
          stroke: 0.4pt + luma(200),
        ))
      }
      place(top + left, dy: mid - 0.4cm, box(width: lab-w, height: 0.8cm, align(
        left + horizon,
        text(1em, weight: "bold", fill: col, layer.name),
      )))
      place(top + left, dx: sx(lo) - 0.1cm, dy: mid - 0.5pt, line(
        length: sx(hi) - sx(lo) + 0.1cm,
        stroke: 1pt + col.lighten(40%),
      ))

      let reported = layer
        .companies
        .filter(c => c.margin != none)
        .sorted(key: c => c.margin)
      for (j, c) in reported.enumerate() {
        let r = radius(c.revenue)
        let ov = place-ov.at(c.name, default: (calc.even(j), 0))
        let above = ov.at(0)
        let lw = 4cm
        let lh = 0.5cm
        place(top + left, dx: sx(c.margin) - r, dy: mid - r, circle(
          radius: r,
          fill: col,
          stroke: 0.8pt + white,
        ))
        let y = if above { mid - r - lh - 0.02cm } else { mid + r + 0.02cm }
        place(
          top + left,
          dx: sx(c.margin)
            - lw / 2
            + ov.at(1) * (lw / 2 - 0.3cm)
            + ov.at(2, default: 0) * 1cm,
          dy: y,
          box(
            width: lw,
            height: lh,
            align(
              if ov.at(1) == 0 { center } else if ov.at(1) < 0 { right } else {
                left
              }
                + if above { bottom } else { top },
              text(
                0.7em,
                weight: "bold",
                fill: luma(30),
                c.name,
              ),
            ),
          ),
        )
      }

      let unrep = layer.companies.filter(c => c.margin == none)
      if unrep.len() > 0 {
        let bx = width - nr-w
        let bh = strip-h - 0.5cm
        place(top + left, dx: bx, dy: mid - bh / 2, rect(
          width: nr-w,
          height: bh,
          fill: hatch,
          stroke: 0.6pt + luma(150),
          inset: 0pt,
          {
            align(center + horizon, box(
              fill: white.transparentize(15%),
              inset: 3pt,
              radius: 2pt,
              text(
                0.65em,
                weight: "bold",
                fill: luma(40),
                unrep.map(c => c.name).join(linebreak()),
              ),
            ))
          },
        ))
      }
    }
    place(top + left, dx: width - nr-w, dy: axis-y + 0.08cm, box(
      width: nr-w,
      align(center, text(0.65em, fill: luma(90))[no reported margin]),
    ))
    place(bottom + left, text(0.55em, fill: luma(120), data-note))
  })
}
