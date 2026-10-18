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


== Pick a pricing model that fixes this

#let dot = text(fill: accent)[●]

#table(
  columns: (auto, auto, 1fr, auto),
  align: (center, left, left, left),
  stroke: none,
  fill: (_, y) => if y > 0 and calc.even(y) { luma(240) },
  inset: (x: 0.5em, y: 0.4em),
  table.header([], [*Model*], [*How it works*], [*Example*]),
  table.hline(stroke: 0.5pt + luma(180)),
  dot, [Per-token API], [Pay for exactly what you use], [OpenAI / Anthropic APIs],
  [], [Flat / per-seat], [Fixed fee, "unlimited" use],
  [Microsoft 365 Premium, \$20 \ Claude Team, \$25 / \$125 per seat],
  [], [Freemium + ads], [Free tier paid for by advertising], [ChatGPT free tier],
  dot, [Usage credits], [Fee buys a usage budget], [Cursor, \$20 of credits],
  dot, [Outcome-based], [Pay per job done], [Zendesk, \$1.50 per resolution],
)

AI companies have been learning this:

- *Cursor* swapped 500 requests to \$20 credit. Backlash; the CEO apologised and refunded.
- *Anthropic* capped Claude Code's flat plans with weekly limits, on top of its 5-hour limits.
- *Replit* moved to "effort-based" pricing; users paid even when the agent failed.
- *GitHub Copilot* replaced per-message with per-token pricing.

// Sources: cursor.com/blog/june-2025-pricing (switch 16 Jun, apology and
// refunds 4 Jul 2025); Anthropic on X, 28 Jul 2025 (weekly limits from
// 28 Aug 2025); replit.com/blog/effort-based-pricing (18 Jun 2025) and
// replit.com/blog/effort-based-pricing-recap (12 Jul 2025).
// github.blog/changelog/2026/04/27/github-copilot-is-moving-to-usage-based-billing
// (from 1 Jun 2026: AI Credits at API token rates; Pro \$10 incl. \$10 credits,
// Pro+ \$39 incl. \$39; completions stay free).
// VERIFY: Cursor apology signed by the CEO; Replit charging for failed runs;
// Replit's old pricing was a flat \$0.25 per checkpoint.

#speaker-note[
  Context accumulates and agent loops multiply cost. Every one of these companies hit the heavy-user problem from the exercise, and every fix made their most loyal users angry. That's lesson 1.
]
