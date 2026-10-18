#import "/common.typ": *
#import "/citations.typ": cite-source

= How to make money with AI

#section-subtitle[The application layer]


#focus-slide[
  Exercise

  #text(size: 72pt, weight: "bold")[
    *Set prices for your homework bot.*
  ]
]


== Exercise: price my homework bot

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    *The product*: an AI homework tutor that answers questions and draws graphs and diagrams.
    Competitors charge *\$10 / month*.

    #v(0.6em)
    #table(
      columns: (1fr, auto),
      align: (left, right),
      stroke: none,
      inset: (x: 0.5em, y: 0.35em),
      [Input price], [\$2 / M tokens],
      [Output price], [\$10 / M tokens],
      [One question], [10k in, 1k out],
      [Light user], [100 qn / month],
      [Heavy user], [3,000 qn / month],
    )
    #text(size: 0.8em, fill: luma(90))[Mid-tier pricing: Claude Sonnet 5.5, GPT-6.1 Sol, Gemini 4 Argon]
  ],
  [
    *Your job (2 minutes, with a neighbour)*
    - What does one question cost?
    - What does a light user cost per month?
    - What about a heavy user?
    - At \$10 / month, how many questions before you lose money?
    - What margin do you make on each user?
    #pause
    #v(0.5em)
    *Heavy users*
    - How many light users do you need to subsidize one heavy user?
    - How do you stop them sinking you?
  ],
)

// Prices: Anthropic, OpenAI and Google API pricing pages, 18 Oct 2026.

#speaker-note[
  The three labs price their mid-tier models identically. Which one students pick doesn't change the answer.

  One question: 10,000 × \$2/M = \$0.02 in, 1,000 × \$10/M = \$0.01 out. \$0.03.

  Light user: 100 × \$0.03 = \$3 against \$10 of revenue. 70% margin, looks like SaaS.

  Heavy user: 3,000 × \$0.03 = \$90 against \$10. You lose \$80 on them, every month: a #sym.minus;800% margin.

  Break-even: \$10 / \$0.03 ≈ 330 questions a month.

  Agent: 100 tasks × 50 calls × \$0.03 = \$150.
]


// GLM-5.3-REVIEW: add a third column, "who eats the heavy user?", so the
// speaker-note question is answered per row: per-token -> user, flat -> you,
// credits -> capped you, outcome -> you unless scoped.
== The pricing menu

#let tied = uncover("2-", text(fill: accent)[●])

#table(
  columns: (auto, auto, 1fr, auto),
  align: (center, left, left, left),
  stroke: none,
  fill: (_, y) => if y > 0 and calc.even(y) { luma(240) },
  inset: (x: 0.5em, y: 0.4em),
  table.header([], [*Model*], [*How it works*], [*Example*]),
  table.hline(stroke: 0.5pt + luma(180)),
  tied, [Per-token API], [Pay for exactly what you use], [OpenAI / Anthropic APIs],
  [], [Flat / per-seat], [Fixed fee, "unlimited" use],
  [Microsoft 365 Premium, \$20 \ Claude Team, \$25 / \$125 per seat],
  [], [Freemium + ads], [Free tier paid for by advertising], [ChatGPT free tier],
  tied, [Usage credits], [Fee buys a usage budget], [Cursor, \$20 of credits],
  tied, [Outcome-based], [Pay per job done], [Zendesk, \$1.50 per resolution],
)

#v(0.3em)
#uncover("2-")[
  #lblock[
    #grid(
      columns: (1em, 1fr),
      row-gutter: 0.5em,
      text(fill: accent)[●], [*Tie price to usage:* heavy users pay for what they use.],
      [],
      [*Flat rates are subsidies:* a \$125 Claude seat burns up to \~\$3,700 of API a month. That only works as a loss leader.],

      [], [*Price to value:* outcome pricing charges for results, so the vendor pays for every failed attempt.],
    )
  ]
]

// Sources (checked 18 Oct 2026): microsoft.com/copilot/pricing/individuals;
// claude.com/pricing; openai.com/index/testing-ads-in-chatgpt (Free and Go
// tiers); cursor.com/blog/june-2025-pricing; zendesk.com/pricing ($1.50
// committed, $2.00 pay-as-you-go).
// Claude Team Premium ~$3,700/month API-equivalent: wokey.ai/claude-usage-limits
// (measured on real accounts, 12 Oct 2026; Pro ~$736/month). Premium seats get
// 6.25x Pro's per-session usage (support.claude.com, Team plan article).

#speaker-note[
  Keep this menu in mind for the exercise in two slides. The question is always: who carries the cost when a user uses a lot?

  Microsoft folded Copilot Pro into Microsoft 365 Premium. It doesn't promise unlimited, it promises "extensive usage": a flat fee with a fuzzy cap.

  Claude Team sells two seat tiers, \$25 and \$125. Even per-seat pricing ends up charging heavy users more.

  First show the table and ask: which of these protect the company from heavy users? Then reveal.

  The orange dots mark models where price tracks usage. The rest are flat, so someone is subsidising heavy users: other customers, another product, or the company's own cost of compute. Claude Team Premium at \$125 is worth about \$3,700 a month at API prices if you use it fully. Anthropic can do that because it pays cost, not list price, for its own models. Microsoft can bundle Copilot because it is selling Office and runs Azure. ChatGPT free is paid for by ads.

  Outcome pricing ties price to the value the customer gets, not to your cost. Zendesk charges \$1.50 per resolution, but still pays the model bill on tickets the bot fails to resolve. The customer pays for success, you pay for failure.
]



// GLM-5.3-REVIEW: a cited paired bar chart (SaaS 75-85% vs AI 50-60% gross
// margin) instead of two big numbers. Optional garnish: Replit's gross margin
// swinging between +36% and -14% month to month (single source) as a
// dumbbell.
== SaaS vs AI unit economics

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  gblock[
    #align(center)[*Classic SaaS*]
    #align(center, text(size: 2.4em, weight: "bold")[75--85%])
    #align(center)[gross margin]
    - Code written once, copied for free
    - Serving one more user costs \~nothing
    - Heavy users are *pure profit*
  ],
  gblock[
    #align(center)[*AI app*]
    #align(center, text(size: 2.4em, weight: "bold", fill: accent)[50--60%])
    #align(center)[gross margin]
    - Every message is a paid model call
    - Cost scales with *use*, not users
    - Heavy users can be *pure loss*
  ],
)

// Sources: Lazard, "Deep Diving on AI Commercialization" (2024): AI software
// ~50-60% vs SaaS ~75-85%; ICONIQ State of AI 2026: AI-native ~52%; a16z,
// "The New Business of AI" (2020): AI 50-60% vs SaaS 60-80%+.

#speaker-note[
  Gross margin = (revenue - cost of serving it) / revenue. For SaaS that cost is hosting and support. For AI it includes every token you buy from a lab.
]

// GLM-5.3-REVIEW: the reveal could be a mini-timeline of pricing pivots -
// Cursor credits -> 4 Jul apology, Claude Code weekly limits, Replit
// effort-based: three companies flailing in sequence.
== Pick a pricing model that fixes this

#grid(
  columns: (1fr, 1.2fr),
  column-gutter: 1.5em,
  align: top,
  [
    Back to the menu:
    - Per-token
    - Flat / per-seat
    - Freemium + ads
    - Usage credits
    - Outcome-based

    #v(0.4em)
    What does your choice do to your *heaviest* users?
  ],
  [
    #pause
    *What they actually did*
    - *Cursor* swapped 500 requests for \$20 of credits. Backlash; the CEO apologised and refunded.
    - *Anthropic* added weekly limits to Claude Code on top of its 5-hour limits.
    - *Replit* moved to "effort-based" pricing, and users paid even when the agent failed.
  ],
)

// Sources: cursor.com/blog/june-2025-pricing (switch 16 Jun, apology and
// refunds 4 Jul 2025); Anthropic on X, 28 Jul 2025 (weekly limits from
// 28 Aug 2025); replit.com/blog/effort-based-pricing (18 Jun 2025) and
// replit.com/blog/effort-based-pricing-recap (12 Jul 2025).
// VERIFY: Cursor apology signed by the CEO; Replit charging for failed runs.

#speaker-note[
  Context accumulates and agent loops multiply cost. Every one of these companies hit the heavy-user problem from the exercise, and every fix made their most loyal users angry. That's lesson 1.
]
