// Total tokens per week on OpenRouter (open + closed models), one bar per
// week. Data: openrouter.ai/api/frontend/v1/rankings/open-closed, the series
// behind the "open vs closed" chart on openrouter.ai/rankings, fetched
// 18 Oct 2026 (weeks starting 20 Oct 2025 to 12 Oct 2026).
#let openrouter-tokens(height: 6cm) = {
  let weeks = json("/figures/openrouter-weekly-tokens.json")
  let totals = weeks.map(w => (w.open + w.closed) / 1e12)
  let n = weeks.len()
  let bar-fill = rgb("#eb811b") // metropolis orange
  let k = (height - 0.6cm) / calc.max(..totals)
  // zero-width box so a label can overhang its narrow column
  let overhang(body, side: center) = box(width: 0pt, align(side, box(
    width: 2cm,
    align(side, body),
  )))
  // label the first and last weeks with their totals
  let bar(i, v) = stack(
    dir: ttb,
    spacing: 0.1cm,
    ..if i == 0 or i == n - 1 {
      // the last label hangs right, clear of the taller bar before it
      let side = if i == 0 { center } else { left }
      (overhang(text(size: 0.6em, weight: "bold")[#calc.round(v)T], side: side),)
    },
    box(width: 100%, height: v * k, fill: bar-fill),
  )
  // ticks: the first week of each quarter
  let tick(w) = {
    let (y, m, d) = w.week.split("-").map(int)
    if d <= 7 and calc.rem(m, 3) == 1 {
      let name = ("Jan", "Apr", "Jul", "Oct").at(calc.quo(m, 3))
      overhang(text(size: 0.5em, fill: luma(110))[#name #y])
    }
  }
  // gridlines every 10T, labelled majors every 50T; drawn first so the bars
  // sit on top
  box(width: 100%, {
    let steps = range(10, int(calc.max(..totals)) + 1, step: 10)
    let major(t) = calc.rem(t, 50) == 0
    for t in steps {
      place(top + left, dy: height - t * k, line(
        length: 100%,
        stroke: if major(t) { 0.6pt + luma(170) } else { 0.4pt + luma(220) },
      ))
    }
    // slide-coloured patch (metropolis neutral-lightest) hides the minor line
    // above each label
    for t in steps.filter(major) {
      place(top + left, dy: height - t * k - 0.4cm, box(
        fill: rgb("#fafafa"),
        outset: (x: 0.05cm, y: 0.03cm),
        text(size: 0.5em, fill: luma(110))[#(t)T],
      ))
    }
    grid(
      columns: (1fr,) * n,
      rows: (height, auto),
      column-gutter: 0.08cm,
      row-gutter: 0.1cm,
      align: center + bottom,
      ..totals.enumerate().map(((i, v)) => bar(i, v)),
      grid.hline(y: 1, stroke: 0.8pt + luma(40)),
      ..weeks.map(tick),
    )
  })
}
