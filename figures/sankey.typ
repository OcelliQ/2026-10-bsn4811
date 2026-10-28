#import "/common.typ": accent

// Sankey of one heavy user's month (illustrative). Band thickness is
// proportional to dollars: k cm per dollar.
#let sankey(width: 25cm, height: 10.8cm) = {
  let k = 0.045cm
  let nw = 2.6cm
  let gx = 3cm
  let col(i) = i * (nw + gx)
  let dark = luma(70)
  let usr = luma(35)
  let fsz = 0.6em
  let uf = 10 / 150 // user's share of every dollar once it enters the lab

  // ribbon between (x0, y0) and (x1, y1), top edges, thickness t
  let ribbon(x0, y0, x1, y1, t, fill) = {
    let m = (x0 + x1) / 2
    place(top + left, curve(
      fill: fill,
      stroke: none,
      curve.move((x0, y0)),
      curve.cubic((m, y0), (m, y1), (x1, y1)),
      curve.line((x1, y1 + t)),
      curve.cubic((m, y1 + t), (m, y0 + t), (x0, y0 + t)),
      curve.close(mode: "straight"),
    ))
  }
  let orange = accent.transparentize(15%)
  let user-c = usr.transparentize(10%)
  // flow of mixed origin: orange with the user's slice (fraction f) on top
  let flow(x0, y0, x1, y1, d, f, lbl: true) = {
    let t = d * k
    ribbon(x0, y0, x1, y1, t, orange)
    if f > 0 { ribbon(x0, y0, x1, y1, t * f, user-c) }
    if lbl {
      let xm = (x0 + x1) / 2
      let ym = (y0 + y1 + t) / 2
      place(top + left, dx: xm - 1cm, dy: ym - 0.3cm, box(
        width: 2cm,
        height: 0.6cm,
        align(center + horizon, text(size: fsz, weight: "bold", fill: if f
          == 1 { white } else { black })[\$#d]),
      ))
    }
  }
  let node(c, y, d, body, fill: dark, tc: white) = place(
    top + left,
    dx: col(c),
    dy: y,
    rect(
      width: nw,
      height: d * k,
      fill: fill,
      stroke: none,
      inset: 2pt,
      align(center + horizon, text(size: fsz, fill: tc, body)),
    ),
  )

  // vertical positions (cm); heavy diagram sits below a small top margin
  let top0 = 0.8cm
  let g = 0.3cm
  // col 0
  let y-inva = top0
  let y-user = y-inva + 80 * k + g
  let y-invl = y-user + 10 * k + g
  // col 1, 2
  let y-app = top0
  let y-lab = top0
  // col 3
  let y-cloud = top0
  let y-staff = y-cloud + 105 * k + g
  // col 4
  let y-nv = top0 + 0.3cm
  let y-en = y-nv + 50 * k + g
  let y-mg = y-en + 30 * k + g

  let r(c) = col(c) + nw
  let l(c) = col(c)

  box(width: width, height: height, {
    // ---- bands ----
    // into the app (inv, user) and app -> lab
    flow(r(0), y-inva, l(1), y-app, 80, 0)
    flow(r(0), y-user, l(1), y-app + 80 * k, 10, 1)
    flow(r(1), y-app, l(2), y-lab, 90, 10 / 90)
    flow(r(0), y-invl, l(2), y-lab + 90 * k, 60, 0)
    // lab -> cloud, staff
    flow(r(2), y-lab, l(3), y-cloud, 105, uf)
    flow(r(2), y-lab + 105 * k, l(3), y-staff, 45, uf)
    // cloud -> nvidia, energy, margin
    flow(r(3), y-cloud, l(4), y-nv, 50, uf)
    flow(r(3), y-cloud + 50 * k, l(4), y-en, 30, uf)
    flow(r(3), y-cloud + 80 * k, l(4), y-mg, 25, uf)

    // ---- nodes ----
    node(
      0,
      y-inva,
      80,
      [Investors (VC into the app) *\$80*],
      fill: accent,
      tc: black,
    )
    node(0, y-user, 10, [User *\$10*], fill: usr)
    node(
      0,
      y-invl,
      60,
      [Investors (VC into the lab) *\$60*],
      fill: accent,
      tc: black,
    )
    node(1, y-app, 90, [Homework bot app\ *\$90*])
    node(
      2,
      y-lab,
      150,
      [Model lab *\$150*],
    )
    node(
      3,
      y-cloud,
      105,
      [Cloud / infra *\$105*],
    )
    node(3, y-staff, 45, [Staff and other *\$45*])
    node(4, y-nv, 50, [NVIDIA (chips) *\$50*], fill: dark)
    node(4, y-en, 30, [Datacentre *\$30*])
    node(4, y-mg, 25, [Cloud margin *\$25*])

    // ---- user's slice marker on the right: dark outline on NVIDIA ----
    place(top + left, dx: col(4), dy: y-nv, rect(
      width: nw,
      height: 50 * k,
      fill: none,
      stroke: 2pt + black,
    ))

    // ---- punchline callout ----
    place(top + left, dx: col(4) - 0.4cm, dy: y-mg + 25 * k + 0.25cm, box(
      width: nw + 0.4cm,
      align(right, text(
        size: 0.65em,
        weight: "bold",
      )[NVIDIA gets #text(fill: accent.darken(10%))[5#sym.times;] what the user paid.]),
    ))

    // ---- tag, legend ----
    place(top + right, rect(
      stroke: 0.8pt + luma(120),
      radius: 3pt,
      inset: (x: 6pt, y: 3pt),
      text(size: 0.6em, fill: luma(80), style: "italic")[Illustrative],
    ))
    place(top + left, dx: 0cm, dy: 0cm, stack(
      dir: ltr,
      spacing: 0.25cm,
      box(width: 0.35cm, height: 0.35cm, fill: usr),
      text(size: fsz)[User's money],
      h(0.4cm),
      box(width: 0.35cm, height: 0.35cm, fill: accent),
      text(size: fsz)[Investor money],
    ))

    // ---- light-user inset (same scale) ----
    let iy = height - 1.25cm
    let ix = 0cm
    place(top + left, dx: ix, dy: iy - 1.1cm, text(
      size: fsz,
      weight: "bold",
    )[Light user, same scale])
    // user -> app -> lab / margin
    let ux = ix + 0.2cm
    let ax = ux + 4.2cm
    let lx = ax + 4.2cm
    let nwi = 0.3cm
    ribbon(ux + nwi, iy, ax, iy, 10 * k, user-c)
    ribbon(ax + nwi, iy, lx, iy, 3 * k, user-c)
    ribbon(ax + nwi, iy + 3 * k, lx, iy + 3 * k + 0.2cm, 7 * k, luma(200))
    for (x, d, lbl, y0) in (
      (ux, 10, [User \$10], iy),
      (ax, 10, [App \$10], iy),
      (lx, 3, [Lab \$3], iy),
    ) {
      place(top + left, dx: x, dy: y0, rect(
        width: nwi,
        height: d * k,
        fill: dark,
        stroke: none,
      ))
      place(top + left, dx: x - 0.1cm, dy: y0 - 0.55cm, text(size: fsz, lbl))
    }
    place(top + left, dx: lx, dy: iy + 3 * k + 0.2cm, rect(
      width: nwi,
      height: 7 * k,
      fill: luma(200),
      stroke: none,
    ))
    place(
      top + left,
      dx: lx + nwi + 0.15cm,
      dy: iy + 3 * k + 0.2cm - 0.05cm,
      text(size: fsz)[App margin \$7],
    )

    // ---- footnote ----
    place(bottom + right, text(
      size: 0.55em,
      fill: luma(90),
    )[Assumes training is funded by investors.])
  })
}
