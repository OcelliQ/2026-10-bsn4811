#import "/common.typ": *
#import "/citations.typ": cite-source

= Liability and extraction: the legal line item

== Back to the value chain

// PLACEHOLDER D06: the value chain from D05 again, greyed out except the two
// legal arrows, which are now bold: "Liability" landing on Apps, and
// "Extraction" leaving Models. Small labels: "risk lands here" and "value
// leaves here".
#diagram-placeholder(
  "D06",
  [Value chain again, only the Liability (into Apps) and Extraction (out of Models) arrows highlighted],
)

== Liability: the bot is you

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.5em,
  align: top,
  // PLACEHOLDER N15: news article on Moffatt v. Air Canada (Feb 2024), the
  // tribunal ruling that Air Canada is responsible for its chatbot's
  // bereavement-fare answer. The Guardian, CBC or BBC.
  shot(
    "N15",
    [Air Canada liable for its chatbot, Feb 2024],
    path: "/figures/news/N15-air-canada-chatbot.png",
    url: "https://www.theguardian.com/world/2024/feb/16/air-canada-chatbot-lawsuit",
    width: 11.5cm,
  ),
  // PLACEHOLDER N16: news article on the Chevrolet of Watsonville chatbot
  // agreeing to sell a Tahoe for $1 (Dec 2023). Business Insider or similar.
  shot(
    "N16",
    [Chevy dealer chatbot sells a Tahoe for \$1],
    path: "/figures/news/N16-chevy-chatbot-tahoe.png",
    url: "https://www.businessinsider.com/car-dealership-chevrolet-chatbot-chatgpt-pranks-chevy-2023-12",
    width: 11.5cm,
  ),
  [
    *Air Canada*: chatbot invented a refund policy. Tribunal: the bot "is part of Air Canada's website". Pay CA\$812.
  ],

  [
    *Chevrolet of Watsonville*: chatbot agreed to sell a Tahoe for \$1, "no takesies backsies".
  ],
)

// VERIFY: Moffatt v. Air Canada, 2024 BCCRT 149: quote and the CA$812 total
// (~CA$650 damages plus interest and fees). Chevy $1 Tahoe (Dec 2023).

== Liability: more of the same

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  row-gutter: 0.5em,
  align: top,
  // PLACEHOLDER N17: news article on DPD's chatbot swearing at a customer and
  // writing a poem criticising DPD (Jan 2024). BBC or The Guardian.
  shot(
    "N17",
    [DPD chatbot swears at a customer, Jan 2024],
    path: "/figures/news/N17-dpd-chatbot-swears.png",
    url: "https://www.theguardian.com/technology/2024/jan/20/dpd-ai-chatbot-swears-calls-itself-useless-and-criticises-firm",
    width: 11.5cm,
  ),
  // PLACEHOLDER N18: news article on Replit's AI agent deleting SaaStr's
  // production database during a code freeze (Jul 2025). Fortune, The
  // Register or Tom's Hardware.
  shot(
    "N18",
    [Replit agent deletes a production database, Jul 2025],
    path: "/figures/news/N18-replit-deletes-database.png",
    url: "https://fortune.com/2025/07/23/ai-coding-tool-replit-wiped-database-called-it-a-catastrophic-failure/",
    width: 11.5cm,
  ),
  [*DPD*: parcel chatbot swears at a customer and writes a poem about how bad DPD is.],

  [*Replit*: coding agent deletes a production database during a code freeze, then misreports it.],
)

#speaker-note[
  Every failure mode from the crash course (overconfidence, hallucination, sycophancy) turns into one of these. The model vendor isn't in the dock. You are, because you face the customer.
]

// VERIFY: DPD (Jan 2024); Replit / SaaStr database deletion (Jul 2025, A*
// slide 45) and the agent's misreporting of what it did.

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
      [*\$1.5B* settlement, \~\$3,000 per pirated book. Training on bought books was fair use; piracy wasn't.],
      [NYT v. OpenAI], [Ongoing; OpenAI ordered to hand over 20M chat logs],
      [Disney, Universal, WBD v. Midjourney],
      [Ongoing; consolidated and in discovery],
      [Getty v. Stability AI (UK)], [Stability *won* (Nov 2025)],
      [Italy's Garante],
      [Fined OpenAI #sym.euro;15M (annulled on appeal, Mar 2026); fined Replika #sym.euro;5M],
      [EU AI Act],
      [Fines up to *3% of global turnover* or #sym.euro;15M for general-purpose models, enforced from Aug 2026],
    )
  },
  // PLACEHOLDER N19: news article on the $1.5B Bartz v. Anthropic settlement
  // (Sep 2025). Reuters, NYT or AP. Headline and date visible.
  shot(
    "N19",
    [Anthropic's \$1.5B copyright settlement, Sep 2025],
    path: "/figures/news/N19-anthropic-copyright-settlement.png",
    url: "https://www.theguardian.com/technology/2025/sep/05/anthropic-settlement-ai-book-lawsuit",
    width: 7cm,
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

== Compliance is a moat

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    Legal cost is now a *line item* on the scale of compute.

    #pause
    Who can afford it?
    - A lab with a \$1.5B settlement budget
    - A big tech parent with a compliance department
    - *Not* a three-person startup
  ],
  [
    #pause
    #gblock[
      Regulation favours incumbents. \
      It's a *moat*, for whoever can pay for it.
    ]
    #v(0.5em)
    Singapore takes the voluntary route: IMDA's agentic AI framework, AI Verify.
  ],
)

// VERIFY: IMDA Model AI Governance Framework for Agentic AI (Jan 2026; v1.5
// May 2026) and AI Verify.

== Discuss

#discuss[
  Is this extraction, or the cost of doing business? \
  #text(size: 0.7em, fill: luma(110))[(Moffatt rightly got their refund.)]
]
