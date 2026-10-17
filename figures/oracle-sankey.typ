// Where the risk sits: Oracle's promised revenue against what it owes.
// Oracle as a Sankey: band thickness = US$B, tail length = years promised
// (customers, left) or owed (suppliers, right), on a year grid from late 2026.
// All figures from Oracle's 10-Q for the quarter to 31 Aug 2026 unless noted.
//
// Customers: RPO US$664B; 13% in 12 months, 37% in months 13-36, 34% in
// months 37-60, the remainder (16%, ~US$106B) later, with no end given. OpenAI
// "exceeds $300 billion ... over the next five years" (OpenAI, Sep 2025), from
// 2027 (WSJ); S&P estimates it at roughly half of RPO. Oracle names Meta,
// NVIDIA, AMD, xAI and TikTok as customers but gives no sizes, so the rest is
// one band. The late 16% is drawn running 2 years past 2031, fading out.
//
// Landlords: US$288B of data-centre leases signed but not yet started,
// commencing Q2 FY27 to FY29, terms 15-19 years; drawn from 2028 for 17 years.
// Leases already running (US$63B undiscounted, partly offices) are left out.
// Rent split (ESTIMATE): build cost for an AI / liquid-cooled hall is about
// electrical 45%, cooling 30%, shell 10%, land 4% (Turner & Townsend 2025-26
// trade mix, Cushman & Wakefield 2026 land cost). Digital Realty builds at an
// 11.5% yield (Q2 2026) against a ~7.5% required return, so ~35% of rent is
// the landlord's financing + profit. Rent shares: electrical 33%, cooling 22%,
// building + land 10%, landlord's cut 35%.
//
// Electricity is not in the rent. Booked power minimums: US$13.3B (FY26 10-K,
// "primarily related to data center power arrangements"), drawn from now to
// 2043. The rest is an ESTIMATE if the >10 GW pipeline (Oracle, Mar 2026) runs:
// 10 GW x 80% x US$70/MWh ~ US$5B a year, ~US$75B over 15 years from 2028.
//
// Chips: FY27 capex guidance US$90-95B, of which not more than US$70B is net
// cash; the rest is customer prepayments and timing (CFO, Jun and Sep 2026
// calls). Drawn at US$95B as one year.
// Chips lines: servers are "primarily ... six years" useful life (10-Q), so
// chips bought now are written off by 2032. Fainter line: NVIDIA ships a new
// generation every year, and sceptics (Michael Burry: "2-3 yr product cycle")
// say chips are superseded in ~3 years; drawn at 2029.
#let oracle-sankey() = [
  #let earn = rgb("#2e7d32")
  #let owe = rgb("#e0a800")
  #let risk = rgb("#c62828")
  #let bg = rgb("#fafafa")
  // (name, detail, US$B total, years); thin bands are labelled in the gap
  // above; tails past 5 years fade out (end date not given)
  #let customers = (
    ([OpenAI], [\~\$300B, 2027--32], 300, 5),
    (
      [Other AI deals],
      [Meta, NVIDIA, AMD, xAI, TikTok: \~\$258B, sizes not disclosed],
      258,
      5,
    ),
    ([After 2031], [\~\$106B (16%), end not given], 106, 7),
  )
  // (name, detail, US$B total, start year, years, gap after, pale); auto gaps
  // stretch so the owed side is as tall as the promised side; pale = estimate
  #let suppliers = (
    ([Electrical gear], [\~\$95B], 95, 2, 17, 0.08cm, false),
    ([Cooling], [\~\$63B], 63, 2, 17, 0.08cm, false),
    ([Building + land], [\~\$29B], 29, 2, 17, 0.08cm, false),
    ([Landlord's cut], [financing + profit, \~\$101B], 101, 2, 17, auto, false),
    (none, none, 13, 0, 17, 0cm, false),
    (
      [Electricity],
      [\$13B contracted (solid) + \~\$62B if the pipeline runs],
      62,
      2,
      15,
      auto,
      true,
    ),
    ([Chips], [\$90--95B this year], 95, 0, 1, 0cm, false),
  )
  #let nw = 1.9cm
  #let cw = 2.4cm
  #let g = 0.45cm
  #let top0 = 0.9cm
  #block(width: 100%, height: 100%, align(top + left, layout(size => {
    let in-yrs = 5
    let left-yrs = calc.max(..customers.map(c => c.at(3)))
    let out-yrs = 19
    let yr = (size.width - 2 * cw - nw) / (left-yrs + out-yrs)
    let total-in = customers.map(c => c.at(2)).sum()
    let k = (size.height - top0 - (customers.len() - 1) * g - 1.5cm) / total-in
    let node-x = left-yrs * yr + cw
    let node-y = top0 + (customers.len() - 1) * g / 2
    let x0 = node-x + nw + cw // owed side starts here, at late 2026
    let ribbon(x0, y0, x1, y1, t, fill) = {
      let m = (x0 + x1) / 2
      place(curve(
        fill: fill,
        stroke: none,
        curve.move((x0, y0)),
        curve.cubic((m, y0), (m, y1), (x1, y1)),
        curve.line((x1, y1 + t)),
        curve.cubic((m, y1 + t), (m, y0 + t), (x0, y0 + t)),
        curve.close(mode: "straight"),
      ))
    }
    // label for a band whose solid part starts at x and is w wide
    let label(
      x,
      y,
      w,
      t,
      name,
      detail,
      ink: white,
      back: none,
      above: false,
    ) = {
      // back: a solid backing so labels stay legible over the hatching
      let bk(body) = box(fill: back, inset: (x: 2pt), outset: (y: 1pt), body)
      if name == none { return }
      if t > 0.95cm and w > 2cm {
        place(dx: x, dy: y, box(
          width: w,
          height: t,
          inset: (x: 0.2cm, y: 0.12cm),
          stack(
            spacing: 0.25em,
            bk(text(size: 0.75em, weight: "bold", fill: ink)[#name]),
            bk(text(size: 0.6em, fill: ink)[#detail]),
          ),
        ))
      } else if t > 0.4cm and w > 2cm {
        place(dx: x + 0.2cm, dy: y, box(height: t, align(horizon, bk(text(
          size: 0.6em,
          fill: ink,
        )[#text(weight: "bold")[#name] #detail]))))
      } else if above {
        place(dx: 0cm, dy: y - 0.38cm, text(size: 0.6em)[#text(
            weight: "bold",
          )[#name] #text(fill: luma(90))[#detail]])
      } else {
        place(dx: x + w + 0.2cm, dy: y, box(width: 8cm, height: t, align(
          horizon,
          text(size: 0.7em)[#text(weight: "bold")[#name] #text(
              fill: luma(90),
            )[#detail]],
        )))
      }
    }
    let vline(x, y, len, paint, thickness) = place(dx: x, dy: y, line(
      length: len,
      angle: 90deg,
      stroke: (paint: paint, thickness: thickness, dash: "dashed"),
    ))
    // the year 84% of the backlog has been paid, carried to the owed side
    let x5 = x0 + in-yrs * yr
    // year grid behind the owed side, starting now (late 2026)
    for i in range(out-yrs + 1) {
      let x = x0 + i * yr
      place(dx: x, dy: top0, line(
        length: size.height - top0 - 1.45cm,
        angle: 90deg,
        stroke: 0.5pt + luma(220),
      ))
      if calc.even(i) {
        place(dx: x - 0.5cm, dy: size.height - 1.2cm, box(
          width: 1cm,
          align(center, text(size: 0.55em, fill: luma(110))[#(2026 + i)]),
        ))
      }
    }
    place(dx: x5 + 0.15cm, dy: top0 - 0.55cm, text(
      size: 0.6em,
      fill: risk,
    )[2031: 84% of the backlog is in])
    // the year this year's chips are fully written off, and the sceptics'
    // view that next-gen chips make them obsolete sooner
    let x6 = x0 + 6 * yr
    let x3 = x0 + 3 * yr
    vline(x6, top0, size.height - top0 - 1.45cm, luma(60), 0.8pt)
    vline(x3, top0, size.height - top0 - 1.45cm, luma(150), 0.6pt)
    // customers: tails to the left, length = years they've promised to pay
    let y = top0
    let ny = node-y
    for (name, detail, total, years) in customers {
      let t = total * k
      let x = node-x - cw - years * yr
      place(dx: x, dy: y, box(width: years * yr, height: t, fill: earn))
      let late = calc.max(years - in-yrs, 0) * yr
      if late > 0pt {
        place(dx: x, dy: y, box(width: late, height: t, fill: gradient.linear(
          bg,
          bg.transparentize(100%),
        )))
      }
      label(x + late, y, years * yr - late, t, name, detail, above: true)
      ribbon(node-x - cw, y, node-x, ny, t, earn.transparentize(30%))
      y += t + g
      ny += t
    }
    // suppliers: tails to the right, length = years Oracle owes them
    let y = top0
    let ny = node-y
    let long-end = top0
    let fixed = suppliers.map(s => s.at(5)).filter(x => x != auto).sum()
    let stretch = (
      (
        (total-in - suppliers.map(s => s.at(2)).sum()) * k
          + (customers.len() - 1) * g
          - fixed
      )
        / suppliers.filter(s => s.at(5) == auto).len()
    )
    let ends = ()
    for (name, detail, total, start, years, gap, pale) in suppliers {
      let gap = if gap == auto { stretch } else { gap }
      let t = total * k
      let fill = if pale { owe.transparentize(65%) } else { owe }
      ribbon(node-x + nw, ny, x0, y, t, owe.transparentize(30%))
      // not started yet: pale until the start year
      if start > 0 {
        place(dx: x0, dy: y, box(
          width: start * yr,
          height: t,
          fill: owe.transparentize(75%),
        ))
      }
      let xs = x0 + start * yr
      place(dx: xs, dy: y, box(width: years * yr, height: t, fill: fill))
      let end = start + years
      if end > in-yrs {
        place(dx: x5, dy: y, box(
          width: (end - in-yrs) * yr,
          height: t,
          fill: tiling(size: (6pt, 6pt), place(line(
            start: (0pt, 6pt),
            end: (6pt, 0pt),
            stroke: 1pt + risk.transparentize(40%),
          ))),
        ))
        long-end = y + t
      }
      label(
        xs,
        y,
        years * yr,
        t,
        name,
        detail,
        ink: if pale { luma(30) } else { white },
        back: if pale { color.mix((owe, 35%), (bg, 65%)) } else { owe },
      )
      ends.push(y + t)
      y += t + gap
      ny += t
    }
    // depreciation labels, in the gap above the chips band
    let lab = (dx, dy, fill, body) => place(dx: dx + 0.15cm, dy: dy, text(
      size: 0.6em,
      fill: fill,
      body,
    ))
    lab(x3, ends.at(-2) + 0.2cm, luma(120))[2029: superseded]
    lab(
      x6,
      ends.at(-2) + 0.65cm,
      luma(60),
    )[2032: depreciated]
    vline(x5, top0 - 0.5cm, long-end - top0 + 0.5cm, risk, 0.8pt)
    place(dx: node-x, dy: node-y, box(
      width: nw,
      height: total-in * k,
      fill: luma(50),
      align(center + horizon, text(
        fill: white,
        weight: "bold",
        size: 0.8em,
      )[Oracle]),
    ))
    // headers and footnote
    place(dx: 0cm, dy: 0cm, text(size: 0.85em, weight: "bold")[you get])
    place(dx: x0, dy: 0cm, text(
      size: 0.85em,
      weight: "bold",
    )[you owe])
    place(dx: 0cm, dy: size.height - 0.5cm, box(width: size.width, text(
      size: 0.6em,
      fill: luma(90),
    )[band thickness = \$ #sym.dot tail length = years promised or owed #sym.dot pale = not started yet or not contracted #sym.dot rent split and uncontracted power are estimates]))
  })))
]
