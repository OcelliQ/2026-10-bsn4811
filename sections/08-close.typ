#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/figures/sankey.typ": sankey
#import "/figures/margin-strips.typ": margin-strips

= Who makes the money?

== Follow the homework bot's money

// VERIFY: the Sankey's split below the lab is illustrative: lab gross margin
// ~50%, $60 of investor-funded training per heavy user per month, and the
// cloud's $105 split $50 Nvidia / $30 energy and datacentres / $25 margin.
// Downstream of the lab the user's slice is drawn pro rata, not traced.
#sankey()

#speaker-note[
  Use the numbers the class just worked out. The user pays \$10. The app pays the lab \$90. The \$80 gap is venture money. The lab is also burning investor money, so the infra layer and Nvidia receive more than the user ever paid. The flows are illustrative, not measured.
]

== Profit per \$1 of revenue, layer by layer

// D09 (logo strips) chosen over D08 (profit pool map, figures/profit-pool.typ)
// and D10 (treemap, figures/margin-treemap.typ). Those two stay in figures/
// unused, drawing on the same data.
// VERIFY: every figure in figures/profit-pool-data.typ is a dummy placeholder.
// Replace with cited TTM revenue and operating margin; the footnote on the
// chart says "Illustrative placeholder figures" until then.
#align(center, margin-strips())

== Who makes the money

#{
  set text(size: 0.8em)
  table(
    columns: (auto, auto, 1fr),
    align: (left, left, left),
    stroke: none,
    inset: (x: 0.6em, y: 0.5em),
    table.header([*Layer*], [*Verdict*], [*Evidence*]),
    table.hline(stroke: 0.5pt + luma(180)),
    [*Chips*],
    text(fill: rgb("#2e7d32"), weight: "bold")[Clearly winning],
    [Nvidia FY27 Q2: \$96.2B revenue, 75% gross margin],
    [*Infra*],
    [*Unclear*],
    [Record capex on GPUs that earn premium rent for 2--5 years; neoclouds like CoreWeave borrowing heavily against 10--15-year leases],
    [*Models*],
    text(fill: rgb("#c62828"), weight: "bold")[Standalone labs lose money],
    [OpenAI reportedly loses \~\$1.22 per \$1 of revenue. Labs inside profitable parents (Google, Meta) can afford to give models away: open weights.],
    [*Apps*],
    [*Varies wildly*],
    [Midjourney profitable · Cursor \~break-even · Character.AI bankrupt],
  )
}

#pause
#v(0.4em)
#lblock[
  #align(center)[Value flows to the *scarce* layer. Today, that's chips.]
]

// VERIFY: Nvidia FY27 Q2 $96.2B revenue and 75% gross margin (10-Q).
// VERIFY: OpenAI ~$1.22 lost per $1 of revenue (aggregator figure; check
// against the S-1). Use operating margin, not gross margin: labs run ~40--60%
// gross margin.
// VERIFY: hyperscaler capex and GPU depreciation schedules still to source.
// The 2--5 vs 10--15 years comes from Measured AI (next slide).
// VERIFY: Cursor ~break-even (single source).

#speaker-note[
  Operating margin, not gross margin: the labs have healthy-looking gross margins of 40--60%, but training and staff costs put them deep in the red.

  Open weights are the commoditize-your-complement play from BSE3713's Vercel / Next.js example: Meta gives models away because a cheap model layer helps its own business.
]

== Infra: the middle layer that owns almost nothing

#cite-source(
  "https://measuredai.substack.com/p/neoclouds-ai-middle-layer",
  display: false,
)[Trinetti, C. (2026). _Neoclouds: AI's \$150 Billion Middle Layer That Owns Almost Nothing_. Measured AI.]

#grid(
  columns: (1.15fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    *Neoclouds* (CoreWeave, Nebius, Lambda, Fluidstack) rent out GPUs:
    - *CoreWeave*: \$99B backlog; Microsoft was \~2/3 of 2025 revenue
    - Lease the buildings for *10--15 years*
    - A GPU earns premium rent for *2--5 years*
    #pause
    - So who carries the risk? *Nvidia* and *Google* guarantee the rent and take equity stakes
  ],
  [
    #pause
    #gblock[
      "Converted bitcoin miners own the buildings; NVIDIA and Google guarantee the rent --- Microsoft simply buys the compute."
      #align(right, text(
        size: 0.7em,
        fill: luma(110),
      )[--- Corey Trinetti, Measured AI, Jul 2026])
    ]
  ],
)

// VERIFY: all figures are from the Measured AI piece (28 Jul 2026), citing
// filings: CoreWeave $99.4B backlog (31 Mar 2026) and Microsoft ~67% of FY2025
// revenue (10-K); 10--15-year leases vs 2--5-year GPU premium life (author's
// framing); Nvidia rent-backs/guarantees/equity (CoreWeave $6.3B rent-back,
// Lambda $1.3B, Nscale $860M guarantee) and Google lease guarantees with
// warrants in TeraWulf and Cipher.

#speaker-note[
  This is why the Infra verdict is "unclear". The neoclouds sit between long leases and short-lived GPUs, and most of their revenue comes from a handful of customers. The interesting part is who backs them: the chip layer. Nvidia guarantees rent and buys equity in its own customers, so the scarce layer is underwriting the demand for its own product. Remember the Sankey: the money reaching Nvidia was mostly investor money. Some of that investor money is Nvidia's.
]

== Before you build on AI, ask

#{
  set text(size: 1.15em)
  set list(spacing: 1em)
  [
    + Do you *own the customer*?
    + Can you *swap models*?
    + Does a *heavy user* make you money, or lose it?
    + *Who is liable* when the model is wrong?
    + What happens when the model is *10× cheaper*?
  ]
}

#speaker-note[
  One question per lesson: landlord (2), moats (5), every message costs money (1), liability (4), LLMflation (5). Meat puppets (3) is the honesty check on question 3: if humans do the work, count them as cost.
]

== Questions?

#focus-slide[
  Questions?
]
