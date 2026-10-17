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


= Chips

#section-subtitle[AI Value Chain]

== Here's an NVIDIA B200

#slide(config: config-common(breakable: false))[
  #grid(
    columns: (11cm, 1fr),
    rows: (1fr,),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "N01",
      [NVIDIA B200 product photo],
      path: "/figures/news/N01-nvidia-b200.png",
      url: "https://nvidianews.nvidia.com/news/nvidia-blackwell-platform-arrives-to-power-a-new-era-of-computing",
      width: 11cm,
      height: 100%,
    ),
    [
      To keep up with *one* B200, you'd need #blank(2)[*about a million Earths'*] people, each doing one sum per second.

      A large datacentre has #blank(2)[*220,000+* (Colossus 1, 300 MW)] of them.

      A frontier model trains on #blank(2)[*\~100,000*] of them for #blank(2)[*a few months*], continuously.
    ],
  )
]

// VERIFY: B200 throughput. The "million Earths" line assumes ~10^16 low-
// precision (FP4, dense) operations a second and 8.2 billion people. Check
// NVIDIA's B200 datasheet; FP8 dense is about half that (~500k Earths).
// VERIFY: Colossus 1 at >220,000 GPUs and >300 MW, per Anthropic's SpaceX
// compute announcement (anthropic.com/news/higher-limits-spacex, May 2026).
// Note that Colossus 1 is not all B200s.
// VERIFY: frontier training-run size and duration. Labs do not publish this;
// cite an Epoch AI estimate for a recent frontier run.
#speaker-note[
  Ask the room to guess each blank before revealing it.
  - 10^16 operations a second / 8.2 billion people at one sum a second each ≈ 1.2 million Earths.
  - Colossus 1: the Memphis site Anthropic now rents from SpaceX.
  - Training runs: estimates only, from Epoch AI.
]

== A rack of 72 costs \~\$3.5M

// VERIFY: rack price. NVIDIA publishes no list price; these are analyst
// estimates. Wing VC's piece now leads with GB300 NVL72 (just under $5.0M,
// ~$3.4M of it the 72 GPU modules), not GB200, so re-check which figure it
// backs. DeployBase gives $60--70K per GB200 superchip.
// VERIFY: photo source and whether it shows GB200 NVL72 racks.
#slide(config: config-common(breakable: false))[
  #let money(body) = text(weight: "bold")[#body]
  #grid(
    columns: (16cm, 1fr),
    rows: (1fr,),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "P01",
      [CoreWeave datacentre],
      path: "/figures/photos/coreweave-datacentre.jpg",
      width: 16cm,
      height: 100%,
    ),
    [
      *GB200 NVL72*: 72 Blackwell GPUs and 36 Grace CPUs in one liquid-cooled rack

      #v(0.4em)
      #table(
        columns: (1fr, auto),
        stroke: none,
        inset: (x: 0pt, y: 0.35em),
        align: (left, right),
        table.hline(stroke: 0.6pt + luma(160)),
        [36 × GB200 superchips#cite-source("https://deploybase.ai/articles/nvidia-gb200-nvl72")[DeployBase. _NVIDIA GB200 NVL72_. About US\$60--70K per GB200 superchip.]],
        [\~\$2.2--2.5M],
        [backplane, cooling, power, networking#cite-source("https://newsletter.semianalysis.com/p/gb200-hardware-architecture-and-component")[SemiAnalysis. _GB200 Hardware Architecture and Component Supply Chain & BOM_. July 2024.]],
        [\~\$0.4--0.8M],
        table.hline(stroke: 0.6pt + luma(160)),
        money[Rack total#cite-source("https://www.wing.vc/content/how-much-does-an-nvidia-nvl72-cost")[Wing VC. _How Much Does an NVIDIA NVL72 Cost?_]],
        money[\~\$3.0--3.5M],
      )
    ],
  )
]

#speaker-note[
  NVIDIA doesn't publish list prices; these are analyst estimates.
  - Compute is the bulk: each GB200 superchip (two Blackwell GPUs, one Grace CPU) is about \$60--70K.
  - Hyperscalers and neoclouds (CoreWeave, Microsoft, Meta) buy thousands of racks and pay near the low end.
  - The rack draws 120--132 kW, so it needs a liquid-cooled hall, InfiniBand or Ethernet to other racks, and storage. Deployed, it's often well above \$4M.
  - Renting: GMI Cloud lists GB200 from \$8 per GPU-hour, about \$420K a month for a full rack running continuously.
  #cite-source(
    "https://www.gmicloud.ai/en/blog/gb200-nvl72-rental-price-reserve-vs-on-demand",
    display: false,
  )[GMI Cloud. _GB200 NVL72 Rental Price: Reserve vs On-Demand_. From US\$8.00 per GPU-hour.]
]

== NVIDIA beats everyone else combined

// Latest quarter, as reported. Not like-for-like: NVIDIA's data centre and
// Broadcom's AI figures include networking; AMD's data centre segment includes
// EPYC CPUs; Marvell's data centre includes networking. Quarters end Jul 2026
// (NVIDIA), Aug 2026 (Broadcom, Marvell), Jun 2026 (AMD, Cerebras).
// VERIFY: Huawei is an estimate, a quarter of the FT's reported US$12B 2026
// figure (2 May 2026, unnamed sources). Cited via IndexBox; swap in the FT
// article link if you can get it.
#slide(config: config-common(breakable: false))[
  // Stacked bar, top to bottom. Labels sit beside their segment and get
  // pushed down (with a leader line) when a segment is too thin to hold one.
  #let companies = (
    (
      name: "Others",
      rev: "2.4",
      fill: luma(225),
      note: [Marvell \$2.2B (custom chips, networking); Cerebras \$0.2B.],
      src: [#cite-source(
          "https://investor.marvell.com/news-events/press-releases/detail/1031/marvell-technology-inc-reports-second-quarter-of-fiscal-year-2027-financial-results",
        )[Marvell. _Marvell Technology, Inc. Reports Second Quarter of Fiscal Year 2027 Financial Results_. Data Center revenue of US\$2,171.5 million, quarter ended 1 August 2026.]#super[,]#cite-source(
          "https://www.sec.gov/Archives/edgar/data/0002021728/000162828026056186/cbrsannouncesfinancialresu.htm",
        )[Cerebras. _Cerebras Announces Financial Results for Second Quarter 2026_. GAAP total revenue of US\$180.1 million, quarter ended 30 June 2026.]],
    ),
    (
      name: "Huawei",
      rev: "3.0",
      fill: luma(210),
      note: [Estimate: a quarter of the \$12B it expects for 2026.],
      src: cite-source(
        "https://www.indexbox.io/blog/huawei-expects-ai-chip-revenue-to-hit-12-billion-in-2026/",
      )[IndexBox, citing the Financial Times. Huawei expects about US\$12 billion of AI chip revenue in 2026, up from US\$7.5 billion in 2025. 2 May 2026.],
    ),
    (
      name: "AMD",
      rev: "6.7",
      fill: luma(195),
      note: [Whole data centre segment, including EPYC server CPUs.],
      src: cite-source(
        "https://ir.amd.com/news-events/press-releases/detail/1295/amd-reports-second-quarter-2026-financial-results",
      )[AMD. _AMD Reports Second Quarter 2026 Financial Results_. Data Center segment revenue of US\$6.7 billion.],
    ),
    (
      name: "Broadcom",
      rev: "16.7",
      fill: luma(150),
      note: [Custom chips for Google (TPU), Meta, OpenAI; plus networking.],
      src: cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001730168/000173016826000076/avgo-08022026x8kxex99.htm",
      )[Broadcom. _Broadcom Inc. Announces Third Quarter Fiscal Year 2026 Financial Results_. AI semiconductor revenue of US\$16.7 billion, quarter ended 2 August 2026.],
    ),
    (
      name: "NVIDIA",
      rev: "89.0",
      fill: accent,
      share-inside: true,
      note: [Data centre: GPUs and networking. Up 117% on a year ago.],
      src: cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001045810/000104581026000073/q2fy27pr.htm",
      )[NVIDIA. _NVIDIA Announces Financial Results for Second Quarter Fiscal 2027_. Data Center revenue of US\$89.0 billion, quarter ended 26 July 2026.],
    ),
  )
  #let bar-width = 2.2cm
  #let label-x = bar-width + 0.9cm
  #let total = companies.map(c => float(c.rev)).sum()
  // Fills whatever height the grid cell gives it.
  #let chart = layout(size => {
    let chart-height = size.height
    // Packed tight so the thin segments stack near the top and NVIDIA's
    // label can sit level with its segment.
    let label-height = 1.3cm
    let top = 0cm
    let label-top = 0cm
    for c in companies {
      let seg = chart-height * float(c.rev) / total
      let share = [#calc.round(float(c.rev) / total * 100)%]
      let mid = top + seg / 2
      let y = calc.max(mid - label-height / 2, label-top)
      place(dy: top, box(
        width: bar-width,
        height: seg,
        fill: c.fill,
        stroke: 1pt + white,
      ))
      place(line(
        start: (bar-width + 0.1cm, mid),
        end: (label-x - 0.15cm, y + label-height / 2),
        stroke: 0.6pt + luma(160),
      ))
      place(dx: label-x, dy: y, block(
        width: 100% - label-x,
        height: label-height,
        // Tight stack, centred in the label slot, so the slack falls
        // between labels rather than between a title and its note.
        align(horizon, stack(
          spacing: 0.25em,
          [
            *#c.name*#c.src #h(0.3em) *\$#(c.rev)B*
            #if not c.at("share-inside", default: false) [
              #h(0.2em)#text(fill: luma(110))[(#share)]
            ]
          ],
          text(size: 0.6em, fill: luma(110))[#c.note],
        )),
      ))
      if c.at("share-inside", default: false) {
        place(dy: mid - 0.5em, box(
          width: bar-width,
          align(center, text(fill: white, weight: "bold")[#share]),
        ))
      }
      top += seg
      label-top = y + label-height
    }
  })
  #grid(
    columns: (1.25fr, 1fr),
    rows: (1fr,),
    column-gutter: 1.4em,
    align: horizon,
    block(width: 100%, height: 100%, inset: (y: 0.4em), align(top + left, chart)),
    [
      *Big tech's own chips*
      - Google TPU, AWS Trainium, Microsoft Maia, Meta MTIA
      - Mostly used in-house; their makers are still NVIDIA's biggest customers

      *New Entrants*
      - Cerebras, Taalas
      - Huawei Ascend

      NVIDIA's biggest competitors are their own customers making custom chips.

    ],
  )
]

// VERIFY: the 75--80% share is analyst estimates (Silicon Analysts, IDC), not
// reported figures.
#speaker-note[
  Not like-for-like: NVIDIA and Broadcom include networking, AMD includes CPUs, and the quarters end in different months. The ratio survives every adjustment.
  - Analysts put NVIDIA at about 75--80% of AI accelerator revenue in 2026.
  - The threat isn't a rival GPU. It's NVIDIA's customers (Google, Amazon, Microsoft, Meta) designing their own chips, often with Broadcom.
  - Hold that thought for section 4: your supplier is your competitor.
  #cite-source(
    "https://siliconanalysts.com/analysis/nvidia-ai-accelerator-market-share-2024-2026",
    display: false,
  )[Silicon Analysts. _NVIDIA AI Accelerator Market Share 2024--2026_. Estimates NVIDIA at 75--81% of AI accelerator revenue in 2026.]
]

= Large Language Models

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
