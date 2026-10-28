// NVIDIA as the hub of its own customers' funding: coloured spokes carry
// NVIDIA's money out (equity, capacity buy-backs, rent guarantees); grey
// arrows from the edges carry outside money in (equity rounds, debt).
// `step` reveals the layers: 1 hub, 2 equity, 3 buy-backs and guarantees,
// 4 the Ohio talks. Figures are cited on the slide (sections/09-close.typ).
#let money-hub(step: 4, width: 23cm, height: 9.2cm) = {
  let ink = rgb("#23373b")
  let kinds = (
    equity: (rgb("#eb811b"), [buys equity]),
    buyback: (rgb("#236c57"), [buys back unused capacity]),
    guarantee: (rgb("#6a4c93"), [guarantees the rent]),
  )
  let outside = luma(150)
  let (nw, nh) = (4.6cm, 1.5cm)
  // name: (x, y, w, h) centres; Lambda sits straight above NVIDIA
  let (xl, xr) = (5.6cm, width - 5.6cm)
  let nodes = (
    nvidia: (width / 2, height * 0.45, 4.6cm, 1.8cm),
    openai: (xl, height * 0.12, nw, nh),
    ssi: (xl, height * 0.45, nw, nh),
    nebius: (xl, height * 0.78, nw, nh),
    lambda: (width / 2, height * 0.12, nw, nh),
    coreweave: (xr, height * 0.12, nw, nh),
    nscale: (xr, height * 0.45, nw, nh),
    ohio: (xr, height * 0.78, nw, nh),
  )
  // distance along unit (ux, uy) from a box centre to just past its edge
  let exit(name, ux, uy) = {
    let (_, _, w, h) = nodes.at(name)
    calc.min(
      if ux == 0 { 1e9 } else { (w / 2 + 0.12cm) / 1cm / calc.abs(ux) },
      if uy == 0 { 1e9 } else { (h / 2 + 0.12cm) / 1cm / calc.abs(uy) },
    )
  }
  let arrow-line((x1, y1), (x2, y2), paint, dash: none, trim1: 0, trim2: 0) = {
    let (dx, dy) = ((x2 - x1) / 1cm, (y2 - y1) / 1cm)
    let n = calc.sqrt(dx * dx + dy * dy)
    let (ux, uy) = (dx / n, dy / n)
    let p(t) = (x1 + ux * t * 1cm, y1 + uy * t * 1cm)
    let (ex, ey) = p(n - trim2)
    place(top + left, line(
      start: p(trim1),
      end: p(n - trim2 - 0.2),
      stroke: (paint: paint, thickness: 2.2pt, dash: dash),
    ))
    let head(along, across) = (
      ex - ux * along - uy * across,
      ey - uy * along + ux * across,
    )
    place(top + left, polygon(
      fill: paint,
      (ex, ey),
      head(0.32cm, 0.16cm),
      head(0.32cm, -0.16cm),
    ))
  }
  let centre(name) = nodes.at(name).slice(0, 2)
  let unit(a, b) = {
    let ((x1, y1), (x2, y2)) = (centre(a), centre(b))
    let (dx, dy) = ((x2 - x1) / 1cm, (y2 - y1) / 1cm)
    let n = calc.sqrt(dx * dx + dy * dy)
    (dx / n, dy / n)
  }
  let node(name, body, fill: white, ink: ink, sub: none, sub-ink: luma(80)) = {
    let (x, y, w, h) = nodes.at(name)
    place(top + left, dx: x - w / 2, dy: y - h / 2, box(
      width: w,
      height: h,
      fill: fill,
      stroke: if fill == white { 1pt + luma(170) } else { none },
      radius: 4pt,
      align(center + horizon, {
        set par(leading: 0.3em)
        text(weight: "bold", fill: ink, body)
        if sub != none {
          linebreak()
          text(16pt, weight: "bold", fill: sub-ink, sub)
        }
      }),
    ))
  }
  // The point just outside a box facing (tx, ty): its nearest corner, or the
  // middle of an edge when the other box lies straight across from it
  let anchor(name, (tx, ty), gap: 0.1cm) = {
    let (x, y, w, h) = nodes.at(name)
    let sx = if calc.abs(tx - x) < w / 2 { 0 } else if tx > x { 1 } else { -1 }
    let sy = if calc.abs(ty - y) < h / 2 { 0 } else if ty > y { 1 } else { -1 }
    (x + sx * (w / 2 + gap), y + sy * (h / 2 + gap))
  }
  // NVIDIA's money out to a customer, to its nearest corner: the spoke, then the
  // customer's node with the amount under its name
  let spoke(to, name, kind, amount, dash: none) = {
    let paint = kinds.at(kind).at(0)
    // aimed from NVIDIA's centre, starting just outside its box
    let (x0, y0) = centre("nvidia")
    let (x1, y1) = anchor(to, centre("nvidia"))
    let (dx, dy) = ((x1 - x0) / 1cm, (y1 - y0) / 1cm)
    let n = calc.sqrt(dx * dx + dy * dy)
    arrow-line(
      (x0, y0),
      (x1, y1),
      paint,
      dash: dash,
      trim1: exit("nvidia", dx / n, dy / n),
    )
    node(to, name, sub: amount, sub-ink: paint.darken(10%))
  }
  // outside money into a customer, from the slide's outer edge; the label
  // sits under the arrow, or over it with `above`
  let inflow(to, label, above: false) = {
    let (x, y, w, h) = nodes.at(to)
    let side = if x < width / 2 { -1 } else { 1 }
    let x-edge = x + side * w / 2
    let x-out = if side < 0 { 0cm } else { width }
    arrow-line((x-out, y), (x-edge + side * 0.12cm, y), outside)
    let body = align(
      if side < 0 { left } else { right } + if above { bottom } else { top },
      text(16pt, fill: luma(90), {
        set par(leading: 0.3em)
        show strong: it => text(weight: "bold", fill: luma(60), it.body)
        label
      }),
    )
    let w-label = calc.abs(x-edge - x-out) - 0.1cm
    let dx = if side < 0 { 0cm } else { width - w-label }
    if above {
      place(top + left, dx: dx, dy: y - 2cm, box(
        width: w-label,
        height: 1.85cm,
        body,
      ))
    } else {
      place(top + left, dx: dx, dy: y + 0.15cm, box(width: w-label, body))
    }
  }

  box(width: width, height: height, {
    if step >= 2 {
      spoke("openai", [OpenAI], "equity", [\$30B stake])
      spoke("ssi", [SSI], "equity", [\$5B stake])
      spoke("nebius", [Nebius], "equity", [\$2B stake])
      inflow("openai", [Amazon,\ SoftBank\ *\$80B*])
    }
    if step >= 3 {
      spoke("coreweave", [CoreWeave], "buyback", [\$6.3B to 2032])
      spoke("lambda", [Lambda], "buyback", [\$1.3B])
      spoke("nscale", [Nscale], "guarantee", [\$0.86B])
      inflow("coreweave", [*\$35B* debt])
    }
    if step >= 4 {
      spoke("ohio", [OpenAI Ohio], "guarantee", [\$250B?], dash: "dashed")
      inflow("ohio", [lenders,\ *\$500B+* build], above: true)
    }
    node(
      "nvidia",
      [NVIDIA],
      fill: rgb("#76b900").darken(20%),
      ink: white,
      sub: [sells GPUs],
      sub-ink: white,
    )
    // legend along the bottom
    place(bottom + center, {
      let shown = (
        (step >= 2, "equity"),
        (step >= 3, "buyback"),
        (step >= 3, "guarantee"),
      ).filter(((s, _)) => s)
      stack(
        dir: ltr,
        spacing: 1.2em,
        ..shown.map(((_, k)) => {
          let (c, label) = kinds.at(k)
          box(baseline: -0.2em, line(length: 0.7cm, stroke: 2.2pt + c))
          h(0.3em)
          text(16pt, fill: luma(60), label)
        }),
        ..if step >= 2 {
          (
            {
              box(baseline: -0.2em, line(
                length: 0.7cm,
                stroke: 2.2pt + outside,
              ))
              h(0.3em)
              text(16pt, fill: luma(60))[outside money]
            },
          )
        },
      )
    })
  })
}
