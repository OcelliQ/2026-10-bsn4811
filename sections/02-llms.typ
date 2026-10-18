#import "/common.typ": *
#import "/citations.typ": cite-source

= Value Chain: Models

#section-subtitle[AI Value Chain]


== An LLM is fancy autocomplete

// Lifted from A* slide 11 (ai-for-clm 01-intro/chapter/02-ai-basics.typ).
#slide(align: horizon, config: config-common(breakable: false))[
  #let sentence-tokens = (
    [An],
    [ LLM],
    [ predicts],
    [ the],
    [ next],
    [ token],
    [ given],
    [ every],
    [thing],
    [ before],
    [.],
  )
  #let token-steps = (
    (5, [token / word / step]),
    (6, [given / using / from]),
    (7, [every / all / the]),
    (8, [thing / word / token]),
    (9, [before / so / in]),
    (10, ["." / "," / "and"]),
    (11, [(end) / It / This]),
  )
  #grid(
    columns: (1fr,),
    row-gutter: 9pt,
    align: left + horizon,
    ..token-steps.map(step => [
      #for (index, token) in sentence-tokens.slice(0, step.at(0)).enumerate() {
        tok(
          index,
          text(weight: if index == step.at(0) - 1 { "bold" } else {
            "regular"
          })[#token],
          inset: (
            left: if index == 8 { 0pt } else { 0.2em },
            right: if index == 7 { 0pt } else { 0.2em },
            y: 0.15em,
          ),
        )
      }#h(0.35em)#text(size: 18pt, fill: luma(130))[#step.at(1)]
    ]),
  )

  #pause

  1 token ≈ ¾ of an English word, a punctuation mark, or a digit.#cite-source("https://platform.openai.com/tokenizer")[OpenAI. _Tokenizer_. Interactive examples of tokenization.]

  *You pay per token*, in and out. The _context window_ is sized in tokens.
]

#speaker-note[
  "everything" splits into "every" + "thing"; punctuation is its own token. Different models tokenize differently.
]

== Black boxes, and stochastic

#grid(
  columns: (40%, 1fr),
  column-gutter: 2em,
  row-gutter: 0.8em,
  align: top,
  [*Simple LLM*],
  grid.cell(x: 1, y: 0, rowspan: 3)[
    - Blocks of linear algebra
      - trained on every scrap of human media
      - with unimaginable amounts of computation
      - learn statistical patterns, not rules about the world

    - Behaviour *surprisingly* emerges at scale
    #uncover("2-")[
      - Works differently from humans
        - Overconfidence
        - Hallucinations
        - Credulity / sycophancy
        - Theory-of-mind / world-model failure
        - Specification gaming / reward hacking
    ]
  ],
  include "/figures/simple-llm.typ",
  lblock[#align(center)[_"Given this question, what do I answer?"_]],
)



== Cost of AI

// D01: `cost-vs-aaii` chart (open vs closed) from
// OcelliQ/ai-models-chart, dist/svg-paths/. API price per task (log scale)
// against the Artificial Analysis Intelligence Index. Replaces A* slide 14.
// Annotate in-deck with a callout: "Prices span three orders of magnitude."
#slide(config: config-page(margin: (x: 0em)))[
  #align(center, image(
    "/figures/ai-models-chart/svg-paths/cost-vs-aaii.svg",
    height: 100%,
  ))
  #pause
  #place(top + left, dx: 48pt, dy: 8pt, lblock(width: 420pt)[
    Tremendous variety available! \
    Prices span *three orders of magnitude*.
  ])
]

== Cost of AI by lab

// D02: `cost-vs-aaii-by-lab` chart from OcelliQ/ai-models-chart.
// Callout: "OpenAI and Anthropic compete at the frontier." (Replaces A* 15.)
#slide(config: config-page(margin: (x: 0em)))[
  #align(center, image(
    "/figures/ai-models-chart/svg-paths/cost-vs-aaii-by-lab.svg",
    height: 100%,
  ))

  #place(top + left, dx: 48pt, dy: 8pt, lblock(width: 420pt)[
    OpenAI and Anthropic compete at the frontier.
  ])
]

== Cost of AI by launch date

// D03: `cost-vs-aaii-by-age` chart from OcelliQ/ai-models-chart.
// Callout: "Frontier to budget in ~4 months." Keep A* slide 16 instead if this
// chart doesn't show the 4-month claim clearly.
#slide(config: config-page(margin: (x: 0em)))[
  #align(center, image(
    "/figures/ai-models-chart/svg-paths/cost-vs-aaii-by-age.svg",
    height: 100%,
  ))

  #place(top + left, dx: 48pt, dy: 8pt, lblock(width: 420pt)[
    The AI revolution is ongoing, not complete. \
    Frontier to budget in *\~5 months*.
  ])
]

// VERIFY: "frontier to budget in ~4 months" against the by-age chart from the
// latest data, not the 30 September 2026 snapshot the A* deck used.

== What it costs to run your own

// D04: `cost-vs-aaii-by-hardware` chart from
// OcelliQ/ai-models-chart: models coloured by the minimum hardware budget
// needed to self-host them. (Replaces A* slide 17.)
#slide(config: config-page(margin: (x: 0em)))[
  #align(center, image(
    "/figures/ai-models-chart/svg-paths/cost-vs-aaii-by-hardware.svg",
    height: 100%,
  ))
]

#speaker-note[
  Open-weight models can run on hardware you buy. That is what keeps model prices honest, and what Cursor later uses (lesson 2).
]
== AI is Agentic, not just a chatbot

#align(center + horizon, grid(
  columns: (40%, 40%),
  column-gutter: 2em,
  row-gutter: 0.8em,
  align: center + top,
  [*Simple LLM*], [*AI Agent*],
  include "/figures/simple-llm.typ", include "/figures/agentic-loop.typ",

  lblock[#align(center)[_"Given this question, what do I answer?"_]],
  lblock[#align(center)[_"Given this goal, what do I do next?"_]],
))

== What makes AI agentic?

// Lifted from A* slide 19 (ai-for-clm 01-intro/chapter/03-agentic-ai.typ).
#grid(
  columns: (40%, 1fr),
  column-gutter: 2em,
  row-gutter: 0.8em,
  align: horizon,
  align(center)[*AI Agent*],
  grid.cell(x: 1, y: 0, rowspan: 3)[
    An *agent* is an LLM with a harness, which gives it *tools* to act on the world.

    Every loop is another paid call, sending the whole conversation as input.

    #table(
      columns: (auto, auto, auto, auto),
      align: (left, right, right, right),
      stroke: none,
      inset: (x: 0.6em, y: 0.2em),
      // Tokens in = previous tokens (last turn's input and reply) + new tokens.
      table.header([Turn], [Previous tokens], [New tokens], [Tokens out]),
      table.hline(stroke: 0.5pt + luma(180)),
      [1], [0], [1,000], [1,000],
      [2], [2,000], [1,000], [1,000],
      [3], [4,000], [1,000], [1,000],
      [4], [6,000], [1,000], [1,000],
      [5], [8,000], [1,000], [1,000],
      [...], [...], [...], [...],
      [10], [18,000], [1,000], [1,000],
      table.hline(stroke: 0.5pt + luma(180)),
      [Total], [*90,000*], [10,000], [10,000],
    )
    *100,000 tokens in*, 90% of it repeated.
  ],
  include "/figures/agentic-loop.typ",
  lblock(center: true)[_"Given this goal, what do I do next?"_],
)
