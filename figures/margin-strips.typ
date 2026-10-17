#import "/common.typ": accent
#import "/figures/profit-pool-data.typ": (
  bedrock-layer, gain, layer-colors, layers, loss,
)
#import "/figures/layer-stack.typ": make-bedrock-cell, make-stack-cell, n-layers

// Logo strips: one operating-margin number line per layer, shared axis, beside
// the hook's layer stack (Apps at the top, bedrock at the bottom). Companies
// with no reported margin are left out.
#let margin-strips(width: 25cm, height: 13cm) = {
  let stack-w = 6.2cm
  let lab-w = stack-w + 0.5cm // plot starts here
  let lo = -160
  let hi = 85
  let plot-w = width - lab-w - 0.2cm
  let sx(m) = lab-w + (m - lo) / (hi - lo) * plot-w
  // Rows match the stack's grid: n-layers rows of 1fr, then bedrock at 0.5fr.
  let rows = layers.rev() + (bedrock-layer,)
  let gutter = 4pt
  let top-pad = 0.1cm
  let grid-h = height - 1.4cm
  let unit = (grid-h - n-layers * gutter) / (n-layers + 0.5)
  let row-top(i) = top-pad + i * (unit + gutter)
  let row-h(i) = if i < n-layers { unit } else { unit / 2 }
  let axis-y = top-pad + grid-h
  // label overrides: (above?, shift) where shift -1 right-aligns, +1 left-aligns
  let place-ov = (
    CoreWeave: (false, -1, -0.5),
    Oracle: (false, 0),
    "Google Cloud": (true, -1),
    AWS: (true, 0),
    Azure: (false, 0),
    AMD: (true, 0),
    Broadcom: (false, -1),
    TSMC: (true, 0),
    Nvidia: (false, 0),
    "Character.AI": (true, 1),
  )
  let ticks = (-150, -100, -50, 0, 50, 80)
  let radius(rev) = calc.max(0.17cm, 0.036cm * calc.sqrt(rev)) // area ~ revenue

  box(width: width, height: height, {
    place(top + left, dy: top-pad, block(width: stack-w, height: grid-h, grid(
      columns: (1fr,),
      rows: (1fr,) * n-layers + (0.5fr,),
      row-gutter: gutter,
      make-stack-cell(scale: 0.75),
      make-bedrock-cell(scale: 0.75),
    )))
    // tints
    place(top + left, dx: sx(lo), dy: top-pad, rect(
      width: sx(0) - sx(lo),
      height: grid-h,
      fill: loss.transparentize(92%),
      stroke: none,
    ))
    place(top + left, dx: sx(0), dy: top-pad, rect(
      width: sx(hi) - sx(0),
      height: grid-h,
      fill: gain.transparentize(92%),
      stroke: none,
    ))
    // tick gridlines + labels
    for t in ticks {
      place(top + left, dx: sx(t), dy: top-pad, line(
        length: grid-h,
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
    place(top + left, dx: sx(lo), dy: axis-y + 0.6cm, box(
      width: sx(hi) - sx(lo),
      align(center, text(
        0.65em,
        fill: luma(90),
      )[Operating margin #sym.dot.c marker area #sym.tilde revenue]),
    ))
    // zero line
    place(top + left, dx: sx(0) - 1.2pt, dy: top-pad, line(
      length: grid-h,
      angle: 90deg,
      stroke: 2.4pt + luma(40),
    ))

    for (i, layer) in rows.enumerate() {
      let col = layer-colors.at(layer.name)
      let mid = row-top(i) + row-h(i) / 2
      if i > 0 {
        place(top + left, dx: sx(lo), dy: row-top(i) - gutter / 2, line(
          length: sx(hi) - sx(lo),
          stroke: 0.4pt + luma(200),
        ))
      }
      place(top + left, dx: sx(lo) - 0.1cm, dy: mid - 0.5pt, line(
        length: sx(hi) - sx(lo) + 0.1cm,
        stroke: 1pt + col.lighten(40%),
      ))

      let reported = layer
        .companies
        .filter(c => c.margin != none)
        .sorted(key: c => c.margin)
      if layer.name == "Bedrock" {
        // Too close together to label one by one: one label beside the cluster.
        for c in reported {
          let r = radius(c.revenue)
          place(top + left, dx: sx(c.margin) - r, dy: mid - r, circle(
            radius: r,
            fill: col,
            stroke: 0.8pt + white,
          ))
        }
        let left-edge = reported
          .map(c => sx(c.margin) - radius(c.revenue))
          .fold(width, calc.min)
        place(
          top + right,
          dx: left-edge - 0.15cm - width,
          dy: mid - 0.25cm,
          box(
            height: 0.5cm,
            inset: (x: 3pt),
            fill: white.transparentize(15%),
            radius: 2pt,
            align(horizon, text(
              0.7em,
              weight: "bold",
              fill: luma(30),
              reported.map(c => c.name).join(", "),
            )),
          ),
        )
        continue
      }
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
    }
  })
}
