#import "/common.typ": *
#import "/citations.typ": cite-source

= Who makes the money?

== Follow the homework bot's money

// PLACEHOLDER D07: Sankey diagram of ONE HEAVY USER of the homework bot for
// one month, using the exercise's numbers. Flows left to right:
//   User $10 + Investors (VC into the app) ~$80 -> Homework bot app $90
//   App $90 -> Model lab $90
//   Lab $90 + Investors (VC into the lab) -> Cloud / infra
//   Infra -> Nvidia (chips) and energy
// Point to make visually: more money reaches Nvidia than the user paid, and
// most of it is investor money. Label the whole diagram "Illustrative" and
// keep the investor bands a distinct colour (e.g. hatched or accent).
// Optional: a smaller light-user Sankey beside it ($10 in, $3 to the lab,
// $7 margin) for contrast.
#diagram-placeholder(
  "D07",
  [Sankey: one heavy user, one month. User \$10 + VC \$80 -> app -> lab -> infra -> Nvidia. Illustrative.],
)

#speaker-note[
  Use the numbers the class just worked out. The user pays \$10. The app pays the lab \$90. The \$80 gap is venture money. The lab is also burning investor money, so the infra layer and Nvidia receive more than the user ever paid. The flows are illustrative, not measured.
]

== Profit per \$1 of revenue, layer by layer

// PLACEHOLDER D08 (option 1, profit pool map; Bain / Gadiesh & Gilbert, HBR
// 1998): one bar per layer, width = share of revenue, height = operating
// margin. Loss-making layers sit below zero. Each bar is split into
// companies with logos. Apps is thin, so give it a call-out or a minimum
// width. Labs inside profitable parents (DeepMind, Meta) are hatched, not
// estimated. Private figures carry a citation. TTM throughout. Footnote:
// revenue double-counts down the stack.
#diagram-placeholder(
  "D08",
  [Option 1: profit pool map. Width = revenue share, height = operating margin, per layer],
)

== Profit per \$1 of revenue, layer by layer

// PLACEHOLDER D09 (option 2, logo strips): four stacked number lines, one
// per layer (Chips, Infra, Models, Apps), on a shared operating-margin axis
// from about -150% to +80% with a heavy zero line. Logos on each line,
// optionally sized by revenue. Best for showing the spread in Apps (Midjourney
// profitable, Cursor ~break-even, Character.AI deep negative). Same data
// caveats as D08.
#diagram-placeholder(
  "D09",
  [Option 2: logo strips on a shared operating-margin axis, one line per layer],
)

== Profit per \$1 of revenue, layer by layer

// PLACEHOLDER D10 (option 3, ETF-style treemap): area = revenue, colour =
// operating margin on a diverging red/green scale, grouped by layer. Same
// data caveats as D08. Keep only one of D08 / D09 / D10 in the final deck.
#diagram-placeholder(
  "D10",
  [Option 3: treemap. Area = revenue, colour = operating margin],
)

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
    text(fill: rgb("#2e7d32"))[*Clearly winning*],
    [Nvidia FY27 Q2: \$96.2B revenue, 75% gross margin],
    [*Infra*],
    [*Unclear*],
    [Record capex on GPUs that lose value in a few years; neoclouds like CoreWeave borrowing heavily],
    [*Models*],
    text(fill: rgb("#c62828"))[*Standalone labs lose money*],
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
// VERIFY: infra figures still to source: hyperscaler capex and GPU
// depreciation schedules; CoreWeave's debt load.
// VERIFY: Cursor ~break-even (single source).

#speaker-note[
  Operating margin, not gross margin: the labs have healthy-looking gross margins of 40--60%, but training and staff costs put them deep in the red.

  Open weights are the commoditize-your-complement play from BSE3713's Vercel / Next.js example: Meta gives models away because a cheap model layer helps its own business.
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
