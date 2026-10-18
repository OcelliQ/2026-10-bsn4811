// Illustrative mismatch: revenue backlog (up) against disclosed commitments
// plus assumed future outflows (down). Annual buckets approximate fiscal years;
// the RPO timing starts 31 Aug 2026, three months after the fiscal-year boundary.
// These are not cash receipts versus a complete forecast of cash expenses.
// One bar per fiscal year (to 31 May),
// labelled by the year it ends; the first bar is the rest of FY27 (Sep 2026 -
// May 2027). US$B. Oracle 10-Q for the quarter to 31 Aug 2026 unless noted.
//
// Customers: RPO US$664B; 13% in 12 months, 37% in months 13-36, 34% in months
// 37-60, the remaining 16% later with no end given (drawn pale over 2 years).
// New leases: US$288B signed but not started, "generally expected to commence
// between the second quarter of fiscal 2027 and fiscal 2029 and for terms of
// fifteen to nineteen years"; no split by year, so drawn as three equal
// tranches starting FY27, FY28, FY29, each for 17 years.
// Leases already running: operating + finance lease maturity table (US$M):
// rest of FY27 3,839; FY28 4,987; FY29 5,020; FY30 5,056; FY31 5,060; FY32
// 5,026; thereafter 34,257 (spread over FY33-45).
// Supply + power contracts: unconditional purchase obligations (US$M): FY28
// 6,176; FY29 3,863; FY30 4,318; FY31 6,768; FY32 954; thereafter 6,622
// (spread over FY33-42). The rest of FY27 (5,449) is left out because it is
// inside this year's capex.
// Power if the >10 GW pipeline runs (Oracle, Mar 2026): ESTIMATE, 10 GW x 80%
// x US$70/MWh ~ US$5B a year, FY28-42.
// Interest: US$1,428M in the latest quarter, ~US$5.7B a year, assuming the
// US$125B of borrowings is refinanced as it matures.
// Chips: FY27 capex US$90-95B (CFO, Q1 FY27 call, 10 Sep 2026).
#let oracle-cliff() = [
  #let earn = rgb("#2e7d32")
  #let owe = rgb("#e0a800")
  #let risk = rgb("#c62828")
  #let chip = luma(120)
  #let first = 2027
  #let n = 19
  #let years = range(n)
  #let spread(head, tail, from, to) = years.map(i => if i < head.len() {
    head.at(i)
  } else if i >= from and i < to { tail / (to - from) } else { 0 })
  #let promised = spread((86, 123, 123, 113, 113, 53, 53), 0, 0, 0)
  #let pale-from = 5
  #let new-rent = years.map(i => (
    range(3).filter(j => i >= j and i < j + 17).len() * 288 / 3 / 17
  ))
  #let old-rent = spread((3.8, 5.0, 5.0, 5.1, 5.1, 5.0), 34.3, 6, n)
  #let supply = spread((0, 6.2, 3.9, 4.3, 6.8, 1.0), 6.6, 6, 16)
  #let power-est = years.map(i => if i >= 1 and i < 16 { 5 } else { 0 })
  #let interest = years.map(i => 5.7)
  #let chips = years.map(i => if i == 0 { 95 } else { 0 })
  // (series, fill), closest to the axis first
  #let owed = (
    (new-rent, owe),
    (old-rent, owe.darken(20%)),
    (supply, owe.darken(45%)),
    (power-est, owe.transparentize(65%)),
    (interest, risk),
    (chips, chip),
  )
  #let at(i) = owed.map(o => o.at(0).at(i)).sum()
  #block(width: 100%, height: 100%, align(top + left, layout(size => {
    let top = 0.9cm
    let bottom = 1.4cm
    let col = size.width / n
    let bw = col * 0.72
    let max-up = calc.max(..promised)
    let max-down = calc.max(..years.map(at))
    let k = (size.height - top - bottom) / (max-up + max-down)
    let axis = top + max-up * k
    let x(i) = i * col
    let bar(i, y, v, fill) = place(dx: x(i) + (col - bw) / 2, dy: y, box(
      width: bw,
      height: v * k,
      fill: fill,
    ))
    // the bet: everything after FY31, when 84% of the backlog is in
    let cliff = x(5)
    place(dx: cliff, dy: top - 0.5cm, box(
      width: size.width - cliff,
      height: size.height - top - bottom + 0.5cm,
      fill: risk.transparentize(93%),
    ))
    // promised to Oracle, up from the axis
    for i in years {
      let v = promised.at(i)
      if v > 0 {
        bar(i, axis - v * k, v, if i >= pale-from {
          earn.transparentize(65%)
        } else { earn })
      }
    }
    // owed by Oracle, down from the axis
    for i in years {
      let y = axis
      for (series, fill) in owed {
        let v = series.at(i)
        if v > 0 {
          bar(i, y, v, fill)
          y += v * k
        }
      }
    }
    place(dx: 0cm, dy: axis, line(
      length: size.width,
      stroke: 0.8pt + luma(40),
    ))
    for i in years {
      if calc.even(i) {
        place(dx: x(i), dy: size.height - bottom + 0.15cm, box(
          width: col,
          align(center, text(size: 0.55em, fill: luma(110))[#(first + i)]),
        ))
      }
    }
    // chips lines: superseded (sceptics) and written off (Oracle)
    let vline(i, paint, lab) = {
      place(dx: x(i), dy: top - 0.5cm, line(
        length: size.height - top - bottom + 0.5cm,
        angle: 90deg,
        stroke: (paint: paint, thickness: 0.7pt, dash: "dashed"),
      ))
      place(dx: x(i) + 0.1cm, dy: size.height - bottom - 0.75cm, text(
        size: 0.55em,
        fill: paint,
        lab,
      ))
    }
    vline(3, luma(150))[3-year \ scenario]
    vline(6, luma(60))[6-year \ depreciation]
    let note(dx, dy, fill, body) = place(dx: dx, dy: dy, text(
      size: 0.65em,
      fill: fill,
      body,
    ))
    note(
      x(0) + bw + (col - bw) / 2 + 0.15cm,
      axis + 95 * k / 2,
      chip,
    )[FY27 capex plan, \$90--95B]
    let tail = years.filter(i => i >= 5).map(at).sum()
    let tail-promised = promised.slice(5).sum()
    note(x(6) + 0.25cm, axis + 1.9cm, luma(40))[
      #box(width: 12cm)[
        Modelled outflows after 2031: #text(weight: "bold")[\~\$#calc.round(tail)B], including assumed power and interest, plus \$125B debt to repay or refinance. \
        Current revenue backlog allocated then: \~\$#tail-promised;B \
        Future contracts and replacement capex are not modelled.
      ]
    ]
    // mirrored headers, each carrying its own legend
    let key(fill, body) = box(inset: (left: 0.7em))[#box(
        width: 0.7em,
        height: 0.7em,
        fill: fill,
      ) #text(fill: luma(60), body)]
    let total-owed = years.map(at).sum()
    place(dx: 0cm, dy: 0cm, text(size: 0.65em)[
      #text(fill: earn, weight: "bold")[Oracle's current revenue backlog: \$664B]
      #key(earn)[contracted]
      #key(earn.transparentize(65%))[timing not given]
    ])
    place(dx: 0cm, dy: size.height - 0.5cm, text(size: 0.65em)[
      #text(
        weight: "bold",
      )[Illustrative outflows: \~\$#calc.round(total-owed)B (includes estimates)]
      #key(owe)[new leases]
      #key(owe.darken(20%))[old leases]
      #key(owe.darken(45%))[supply + power]
      #key(owe.transparentize(65%))[more power (est.)]
      #key(risk)[interest]
      #key(chip)[chips]
    ])
  })))
]
