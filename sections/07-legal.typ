#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/figures/value-chain.typ": value-chain

= Liability and Extraction

#section-subtitle[Who pays when AI goes wrong?]

== Liability: the bot is you

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.5em,
  align: top,
  shot(
    "N15",
    [Air Canada liable for its chatbot, Feb 2024],
    path: "/figures/news/N15-air-canada-chatbot.png",
    url: "https://www.theguardian.com/world/2024/feb/16/air-canada-chatbot-lawsuit",
    width: 7.8cm,
  ),
  shot(
    "N16",
    [Chevy dealer chatbot sells a Tahoe for \$1],
    path: "/figures/news/N16-chevy-chatbot-tahoe.png",
    url: "https://www.businessinsider.com/car-dealership-chevrolet-chatbot-chatgpt-pranks-chevy-2023-12",
    width: 7.8cm,
  ),

  shot(
    "N17",
    [DPD chatbot swears at a customer, Jan 2024],
    path: "/figures/news/N17-dpd-chatbot-swears.png",
    url: "https://www.theguardian.com/technology/2024/jan/20/dpd-ai-chatbot-swears-calls-itself-useless-and-criticises-firm",
    width: 7.8cm,
  ),

  [
    *Air Canada*: chatbot invented a refund policy. Tribunal: the bot "is part of Air Canada's website". Pay CA\$812.
  ],

  [
    *Chevrolet of Watsonville*: chatbot agreed to sell a Tahoe for \$1, "no takesies backsies".
  ],
  [*DPD*: parcel chatbot swears at a customer and writes a poem about how bad DPD is.],
)

#lblock(center: true)[Who is liable for this?]

// VERIFY: Moffatt v. Air Canada, 2024 BCCRT 149: quote and the CA$812 total
// (~CA$650 damages plus interest and fees). Chevy $1 Tahoe (Dec 2023).
// VERIFY: DPD chatbot incident (Jan 2024).

== Liability: more of the same

#slide(composer: grid.with(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
))[
  #shot(
    "N18",
    [Replit agent deletes a production database, Jul 2025],
    path: "/figures/news/N18-replit-deletes-database.png",
    url: "https://fortune.com/2025/07/23/ai-coding-tool-replit-wiped-database-called-it-a-catastrophic-failure/",
    width: 100%,
    height: 100%,
    image-align: left,
  )
][
  #company-logo("/images/logos/replit-wordmark.svg", height: 1.2cm)
  - *Jul 2025*: coding agent deletes a production database during a *code freeze*.
  - Then misreports what it did.

  #lblock(center: true)[Who is liable for this?]
]

#speaker-note[
  Every failure mode from the crash course (overconfidence, hallucination, sycophancy) turns into one of these. The model vendor isn't in the dock. You are, because you face the customer.
]

// GLM-5.3-REVIEW: "COGS-scale, not a rounding error" seen rather than said -
// proportional squares for the $1.5B settlement, the EUR 15M Garante fine
// and the 3%-of-turnover ceiling on one sized scale.
== Extraction: copyright and regulation

#grid(
  columns: (1fr, 7cm),
  column-gutter: 1em,
  align: top,
  {
    set text(size: 0.82em)
    table(
      columns: (auto, 1fr),
      align: (left, left),
      stroke: none,
      inset: (x: 0.6em, y: 0.42em),
      table.header([*Case*], [*What it costs*]),
      table.hline(stroke: 0.5pt + luma(180)),
      [Bartz v. Anthropic],
      [*\$1.5B* settlement, \~\$3,000 per pirated book.],
      [NYT v. OpenAI], [Ongoing; OpenAI ordered to hand over 20M chat logs],
      [Disney, Universal v. Midjourney],
      [Ongoing],
      [WBD v. Midjourney],
      [Ongoing],
      [Getty v. Stability AI (UK)], [Stability *won* (Nov 2025)],
      [Italy's Garante],
      [Fined OpenAI #sym.euro;15M (annulled);\
        fined Replika #sym.euro;5M],
      table.hline(stroke: 0.5pt + luma(180)),
      [EU AI Act],
      [Fines up to *3% of global turnover* or #sym.euro;15M for general-purpose models, enforced from Aug 2026],
    )
  },
  stack(
    spacing: 0.6em,
    shot(
      "N19",
      [Anthropic's \$1.5B copyright settlement, Sep 2025],
      path: "/figures/news/N19-anthropic-copyright-settlement.png",
      url: "https://apnews.com/article/anthropic-copyright-authors-settlement-training-f294266bc79a16ec90d2ddccdf435164",
      width: 7cm,
    ),
    shot(
      "N22",
      [Disney and Universal sue Midjourney, Jun 2025],
      path: "/figures/news/N22-disney-universal-midjourney.png",
      url: "https://www.theguardian.com/technology/2025/jun/11/disney-universal-ai-lawsuit",
      width: 7cm,
    ),
  ),
)

// VERIFY: Bartz settlement $1.5B and ~$3k/book; NYT v. OpenAI 20M-log order
// affirmed; Midjourney cases consolidated; Getty v. Stability UK judgment
// (Nov 2025); Garante EUR 15M fine and the Rome court annulment (Mar 2026);
// Replika EUR 5M; AI Act GPAI fine ceiling and Aug 2026 enforcement date.
// TODO: add EU / Mistral examples once found (AI Act GPAI lobbying, Code of
// Practice signature, Microsoft investment scrutiny, AFP licensing deal?).
// Each needs a source.

#speaker-note[
  Extraction happens at the models layer, where the training data went in. At \$1.5B, a settlement is the size of a training run: this is COGS-scale, not a rounding error.
]

// GLM-5.3-REVIEW: "who can afford it" as a three-rung ladder - $1.5B
// settlement budget / compliance department / three-person startup (crossed
// out).
== Compliance is a moat

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    Legal cost is now a *line item* on the scale of compute.

    Who can afford it?
    - A lab with a \$1.5B settlement budget
    - A big tech parent with a compliance department
    - *Not* a three-person startup

    #gblock[
      Regulation favours incumbents. \
      It's a *moat*, for whoever can pay for it.
    ]
  ],
  [
    // Cover copied from ../ai-for-clm/references/imda-agentic-ai/pages/page-1.png.
    #align(center, [
      #box(stroke: 3pt + black, image("/figures/reports/imda-agentic-ai-framework.png", height: 8.4cm))
      #v(0.5em)
      Singapore takes the voluntary route.\
      IMDA's agentic AI framework#cite-source("https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf")[IMDA. _Model AI Governance Framework for Agentic AI_. Version 1.5, published 20 May 2026; updated 5 June 2026. Cover copied from the ai-for-clm reference materials.]
    ])
  ],
)
