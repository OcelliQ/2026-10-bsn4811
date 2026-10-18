// The value-chain layer stack, shared by the hook's layer-grid slides and
// the margin strips in the close.

#let stack-ink = rgb("#23373b")
// (title, fill, ink, pressures and inputs, companies)
#let stack-layers = (
  (
    [Apps],
    rgb("#236c57"),
    white,
    [distribution · the customer],
    (
      "Cursor",
      "Windsurf",
      "Replit",
      "Jasper",
      "Character.AI",
      "Midjourney",
      "Perplexity",
    ),
  ),
  (
    [Models],
    rgb("#c5dace"),
    stack-ink,
    [model dev · data + copyright · research talent],
    (
      "OpenAI",
      "Anthropic",
      "DeepSeek",
      "Moonshot",
      "Z.ai",
      "MiniMax",
      "Xiaomi",
    ),
  ),
  (
    [Infra],
    rgb("#dce8e2"),
    stack-ink,
    [data centres · cooling],
    ("AWS", "Azure", "CoreWeave"),
  ),
  (
    [Chips],
    rgb("#e7edef"),
    stack-ink,
    [fabs · lithography · HBM],
    ("Nvidia", "AMD", "TSMC", "Samsung", "SK Hynix", "Micron"),
  ),
)
// Physical inputs under the whole stack, drawn as a row of tiles.
#let bedrock = ([energy], [water], [fab])

// The pieces of the layer stack, laid out by layer-grid: the stack sits in
// column 0, rows 0 to n - 1, with bedrock in row n; each layer shows its
// pressures and inputs under its title. Each slide supplies its own columns
// and annotation cells. `scale` shrinks the text for a narrower stack.
#let n-layers = stack-layers.len()
#let make-stack-cell(scale: 1) = grid.cell(x: 0, y: 0, rowspan: n-layers)[
  #block(
    width: 100%,
    height: 100%,
    spacing: 0pt,
    fill: luma(160),
    radius: 5pt,
    clip: true,
  )[
    #grid(
      columns: (1fr,),
      rows: (1fr,) * n-layers,
      row-gutter: 4pt,
      ..stack-layers.map(((title, fill, ink, inputs, _)) => grid.cell(
        fill: fill,
        inset: (x: 12pt * scale, y: 9pt * scale),
        align: left + horizon,
      )[
        #set par(spacing: 0.6em)
        #text(size: 24pt * scale, weight: "bold", fill: ink)[#title]

        #text(size: 14pt * scale, fill: ink)[#inputs]
      ]),
    )
  ]
]
#let stack-cell = make-stack-cell()
#let make-bedrock-cell(scale: 1) = grid.cell(x: 0, y: n-layers)[
  #block(
    width: 100%,
    height: 100%,
    spacing: 0pt,
    fill: luma(160),
    radius: 5pt,
    clip: true,
  )[
    #grid(
      columns: (1fr,) * bedrock.len(),
      rows: (1fr,),
      column-gutter: 4pt,
      ..bedrock.map(label => block(
        width: 100%,
        height: 100%,
        fill: luma(240),
        inset: 4pt,
      )[
        #set par(leading: 3pt, spacing: 0pt)
        #align(center + horizon, text(
          size: 16pt * scale,
          weight: "bold",
          fill: stack-ink,
        )[#label])
      ]),
    )
  ]
]
#let bedrock-cell = make-bedrock-cell()

// Slide layout with the stack in column 0 at full height. `columns`: the
// widths after the stack, which takes 30% of the slide.
#let layer-grid(columns, ..cells) = {
  set text(size: 18pt)
  v(10pt)
  grid(
    columns: (30%,) + columns,
    rows: (1fr,) * n-layers + (0.5fr,),
    column-gutter: 12pt,
    row-gutter: 4pt,
    align: top,
    stack-cell,
    bedrock-cell,
    ..cells,
  )
}
