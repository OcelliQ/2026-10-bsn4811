#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/annotation-brace.typ": annotation-brace

#let tok-colors = (
  rgb("#FFD966"),
  rgb("#B6D7A8"),
  rgb("#9FC5E8"),
  rgb("#EA9999"),
)
#let tok(n, content, inset: (x: 0.2em, y: 0.15em)) = box(
  fill: tok-colors.at(calc.rem(n, tok-colors.len())),
  inset: inset,
  radius: 0.1em,
)[#content]

= What is an LLM?

== An LLM is fancy autocomplete

// Lifted from A* slide 11 (ai-for-clm 01-intro/chapter/02-ai-basics.typ).
#slide(align: top, config: config-common(breakable: false))[
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

// Lifted from A* slide 13, with its typo fixed ("we have *no* ability").
#grid(
  columns: (1fr, 1fr),
  align: top,
  gutter: 1em,
  [
    - Blocks of linear algebra
      - trained on every scrap of human media
      - with unimaginable amounts of computation
      - learn statistical patterns, not rules about the world

    - Behaviour *surprisingly* emerges at scale
      - strengths and weaknesses very different from humans
  ],
  [
    #pause
    *LLMs are black boxes*: we have no ability to fully predict or explain their behaviour.

    *LLMs are stochastic*: identical runs often produce different output.

    - `Sunny skies, 30C.`
    - `30C with plenty of sunshine.`
    - `It's sunny and 30C today.`
  ],
)

== Why a long conversation costs more

// New slide (gap in the A* crash course): the context window, and why cost
// grows during a conversation. Needed for the homework-bot exercise.
#grid(
  columns: (1.1fr, 1fr),
  column-gutter: 1.5em,
  align: horizon,
  [
    The model has no memory. *Every turn resends the whole conversation* as input.

    #v(0.4em)
    #table(
      columns: (auto, auto, auto),
      align: (left, right, right),
      stroke: none,
      inset: (x: 0.6em, y: 0.35em),
      table.header([*Turn*], [*Tokens in*], [*Tokens out*]),
      table.hline(stroke: 0.5pt + luma(180)),
      [1], [1,000], [500],
      [5], [7,000], [500],
      [10], [14,500], [500],
      table.hline(stroke: 0.5pt + luma(180)),
      [*Total*], [*77,500*], [*5,000*],
    )
  ],
  [
    #pause
    - Input grows every turn: the tenth turn sends \~15× the tokens of the first.
    - Agents are worse: one task can loop through *dozens of calls*.
    - Discounts exist: cached input and overnight batch jobs are cheaper.
  ],
)

#speaker-note[
  Illustrative numbers: a 1,000-token opening and 1,500 tokens added per turn (the user's message plus the previous reply). Total input over ten turns is the sum 1,000 + 2,500 + ... + 14,500 = 77,500. Cached-input and batch discounts are real (often 50--90% off input) but don't change the shape.
]

// VERIFY: typical cached-input and batch discounts (the speaker note says
// 50--90% off input). Check current OpenAI and Anthropic pricing pages.

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
    Frontier to budget in *\~4 months*.
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

== Training is capex, inference is opex

// One slide from BSE3713 38--39: training cost table and the model as a
// depreciating asset. The table is BSE3713's, with the old figures labelled.
#grid(
  columns: (1.25fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    #set text(size: 0.8em)
    #table(
      columns: (auto, auto, auto),
      align: (left, right, right),
      stroke: none,
      inset: (x: 0.5em, y: 0.35em),
      table.header([*Model*], [*Parameters*], [*Training cost*]),
      table.hline(stroke: 0.5pt + luma(180)),
      [AlexNet (2012)], [138M], [\$1,000],
      [ViT-B/16 (2021)], [86M], [\$50,000],
      [GPT-4o (2024)], [1.8T], [\$78M],
      [Gemini Ultra (2024)], [1.5T], [\$191M],
      [DeepSeek-R1 (2025)], [671B], [\$6M],
    )
    #text(
      size: 0.8em,
      fill: luma(110),
    )[Extremely rough numbers; 2024 figures are leaked or estimated.]
  ],
  [
    #pause
    A trained model is an *asset*, like a machine:
    - costly to build
    - earns money when you use it
    - *depreciates*, as the world moves on and rivals release better ones

    #pause
    #lblock[Every query costs money too. That is *inference*, and it never stops.]
  ],
)

// VERIFY: every row of the training-cost table. These come from BSE3713 slide
// 38 (GPT-4o "1.8T" is the leaked GPT-4 figure; Gemini Ultra $191M is the
// Stanford AI Index 2024 estimate; DeepSeek's $6M excludes R&D and earlier
// runs). Update to current sources (Epoch AI) or keep the "rough" label.

#speaker-note[
  This is the depreciating-asset point from BSE3713: the model you trained for \$100M is worth much less a year later when a rival releases a better one, or the open-weight version catches up.
]

== What makes AI agentic?

// Lifted from A* slide 19 (ai-for-clm 01-intro/chapter/03-agentic-ai.typ).
#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  row-gutter: 0.8em,
  align: top,
  [*Simple LLM*], [*Agentic AI*],
  include "/figures/simple-llm.typ", include "/figures/agentic-loop.typ",
  lblock[#align(center)[_"Given this question, what do I answer?"_]],
  lblock[#align(center)[_"Given this goal, what do I do next?"_]],
)
An *agent* is an LLM with a harness, which gives it *tools* to act on the world. #pause *Every loop is another paid call.*

== LLMs fail in common ways

// Lifted from A* slide 23 (ai-for-clm 01-intro/chapter/04-llm-limitations.typ).
// This is the bridge to liability in lesson 4.
#lblock[
  #align(
    center,
  )[LLMs fail in *common* ways that are a *foreseeable* source of business risk.]
]

#{
  let limitation(title, description) = [
    - #text(size: 1.1em)[*#title*] \
      #description
  ]
  grid(
    columns: (1fr, 70mm),
    rows: (2.9em,) * 5,
    column-gutter: 1em,
    row-gutter: 0.25em,
    align: top,
    grid.cell(x: 0, y: 0, limitation(
      [Overconfidence],
      [expresses certainty independent of correctness.#cite-source("https://aclanthology.org/2024.trustnlp-1.13/")[Tobias Groot and Matias Valdenegro-Toro. _Overconfidence is Key: Verbalized Uncertainty Evaluation in Large Language and Vision-Language Models_. TrustNLP 2024, pp. 145--171.]],
    )),
    grid.cell(x: 0, y: 1, limitation(
      [Hallucinations],
      [invents facts, citations, or details that sound plausible.],
    )),
    grid.cell(x: 0, y: 2, limitation(
      [Credulity / sycophancy],
      [accepts falsehoods or agrees with you despite contradictions.#cite-source("https://www.anthropic.com/research/towards-understanding-sycophancy-in-language-models")[Sharma et al. _Towards Understanding Sycophancy in Language Models_. 2023.]],
    )),
    grid.cell(x: 0, y: 3, limitation(
      [Theory-of-mind / world-model failure],
      [misjudges what people know or how actions affect the world.#cite-source("https://arxiv.org/abs/2305.14763")[Shapira et al. _Clever Hans or Neural Theory of Mind? Stress Testing Social Reasoning in Large Language Models_. arXiv:2305.14763, 2023.]],
    )),
    grid.cell(x: 0, y: 4, limitation(
      [Specification gaming / reward hacking],
      [exploits a rule or reward while missing the intended goal.#cite-source("https://www.anthropic.com/research/reward-tampering")[Anthropic. _Sycophancy to Subterfuge: Investigating Reward Tampering in Language Models_. 17 June 2024.]],
    )),
    grid.cell(x: 1, y: 2, rowspan: 3)[
      #block(width: 100%, height: 100%, spacing: 0pt)[
        #layout(size => grid(
          columns: (16pt, 1fr),
          column-gutter: 0.5em,
          align: horizon,
          annotation-brace(size.height, "#5a5a5a"),
          text(weight: "bold", fill: rgb("#5a5a5a"))[AI Alignment],
        ))
      ]
    ],
  )
}

#speaker-note[
  Keep this list in mind. In lesson 4, each of these becomes a line on someone's legal bill, and the someone is whoever faces the customer.
]
