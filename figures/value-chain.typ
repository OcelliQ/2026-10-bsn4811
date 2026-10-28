#import "/common.typ": accent

#let legal-red = rgb("#c62828")

// Vertical arrow at x from y0 to y1 (head at y1).
#let varrow(x, y0, y1, paint, w, dash: none, head: 0.3cm) = {
  let d = if y1 > y0 { 1 } else { -1 }
  place(top + left, dx: x, dy: 0cm, line(
    start: (0cm, y0),
    end: (0cm, y1 - d * head * 0.8),
    stroke: (paint: paint, thickness: w, dash: dash),
  ))
  place(top + left, dx: x, dy: 0cm, polygon(
    fill: paint,
    (0cm, y1),
    (-head * 0.5, y1 - d * head),
    (head * 0.5, y1 - d * head),
  ))
}

// Fixed 25cm x 11.2cm canvas; identical geometry in every mode.
// mode: "base" (no legal arrows), "full" (everything), "legal" (D06).
#let value-chain(mode: "full") = {
  let legal = mode == "legal"
  let colw = 6.25cm
  let cw = 6.0cm // chevron width
  let tip = 0.6cm
  let cy = 2.7cm // chevron top
  let ch = 2.3cm // chevron height
  let fx = 0.4cm // feeder x offset within column

  let layers = (
    (
      "Chips",
      ("NVIDIA", "AMD", "TSMC"),
      "fabs, lithography, critical minerals, HBM memory",
    ),
    (
      "Infra",
      ("Amazon AWS", "Microsoft Azure", "CoreWeave"),
      "energy, land, cooling, water",
    ),
    (
      "Models",
      ("OpenAI", "Anthropic", "Google DeepMind", "Mistral", "DeepSeek"),
      "data and its copyright, research talent",
    ),
    (
      "Apps",
      ("Cursor", "Character.AI", "Midjourney", "Perplexity"),
      "distribution, the customer",
    ),
  )

  let fill-of(i) = if legal { luma(232) } else if i == 3 { accent } else if (
    i == 2
  ) { accent.lighten(65%) } else { luma(215) }
  let ink-of(i) = if legal { luma(160) } else if i == 3 { white } else {
    luma(
      40,
    )
  }
  let feeder = if legal { luma(208) } else { luma(140) }
  let wm-ink = if legal { luma(185) } else { luma(60) }
  let feeder-ink = if legal { luma(185) } else { luma(80) }

  let legal-arrow(x, from, to, label, note, side) = {
    let w = if legal { 3.2pt } else { 1.8pt }
    varrow(x, from, to, legal-red, w, dash: (8pt, 5pt), head: 0.5cm)
    place(
      top + left,
      dx: x + 0.3cm,
      dy: 0.2cm,
      box(width: 4.5cm, {
        text(
          if legal { 1em } else { 0.85em },
          weight: "bold",
          fill: legal-red,
          label,
        )
        if legal {
          linebreak()
          text(0.65em, fill: legal-red, style: "italic", note)
        }
      }),
    )
  }

  box(width: 25cm, height: 11.2cm, {
    for (i, (name, marks, inputs)) in layers.enumerate() {
      let x0 = i * colw
      place(
        top + left,
        dx: x0,
        dy: cy,
        polygon(
          fill: fill-of(i),
          (0cm, 0cm),
          (cw - tip, 0cm),
          (cw, ch / 2),
          (cw - tip, ch),
          (0cm, ch),
          (tip, ch / 2),
        ),
      )
      place(
        top + left,
        dx: x0 + tip,
        dy: cy,
        box(width: cw - 2 * tip, height: ch, align(center + horizon, stack(
          dir: ttb,
          spacing: 0.35em,
          text(1.25em, weight: "bold", fill: ink-of(i), name),
          ..if i == 3 {
            (
              box(
                fill: if legal { luma(246) } else { white },
                radius: 3pt,
                inset: (x: 0.5em, y: 0.25em),
                text(0.6em, weight: "bold", fill: if legal { luma(175) } else {
                  accent
                })[you are here],
              ),
            )
          },
        ))),
      )
      // wordmarks
      place(
        top + left,
        dx: x0 + 1.0cm,
        dy: cy + ch + 0.25cm,
        box(width: cw - 1.4cm, align(left, text(
          0.75em,
          weight: "bold",
          fill: wm-ink,
          marks.join(linebreak()),
        ))),
      )
      // feeder arrow + label
      varrow(x0 + fx, 8.7cm, cy + ch + 0.05cm, feeder, 1.2pt, head: 0.3cm)
      place(
        top + left,
        dx: x0,
        dy: 8.85cm,
        box(width: cw - 0.4cm, text(0.7em, fill: feeder-ink, inputs)),
      )
    }
    if mode != "base" {
      // Models centre = 2*colw + cw/2 ; Apps centre = 3*colw + cw/2
      let xm = 2 * colw + cw / 2 - 0.3cm
      let xa = 3 * colw + cw / 2 - 0.3cm
      legal-arrow(xa, 0.1cm, cy - 0.05cm, [Liability], "risk lands here", "r")
      legal-arrow(
        xm,
        cy - 0.05cm,
        0.1cm,
        [Extraction],
        "value leaves here",
        "r",
      )
    }
  })
}
