#import "/common.typ": *
#import "/citations.typ": cite-source

= How AI businesses make money


== The pricing menu

#{
  set text(size: 0.85em)
  table(
    columns: (auto, 1fr, auto),
    align: (left, left, left),
    stroke: none,
    inset: (x: 0.6em, y: 0.45em),
    table.header([*Model*], [*How it works*], [*Example*]),
    table.hline(stroke: 0.5pt + luma(180)),
    [Per-token API], [Pay for exactly what you use], [OpenAI / Anthropic APIs],
    [Flat subscription],
    [Fixed monthly fee, "unlimited" use],
    [ChatGPT Plus, \$20],
    [Freemium + ads], [Free tier paid for by advertising], [ChatGPT free tier],
    [Per-seat], [Fee per user per month], [GitHub Copilot Business],
    [Usage credits],
    [Subscription buys a budget of usage],
    [Cursor, \$20 of credits],
    [Outcome-based], [Pay per job done], [Intercom Fin, \$0.99 per resolution],
  )
}

// VERIFY: ChatGPT Plus still $20/month; ads in the ChatGPT free tier (2026);
// Copilot Business per-seat price; Cursor Pro = $20 of credits (Jun 2025
// switch); Intercom Fin $0.99 per resolution.

#speaker-note[
  Keep this menu in mind for the exercise in two slides. The question is always: who carries the cost when a user uses a lot?
]


== SaaS vs AI unit economics

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  gblock[
    #align(center)[*Classic SaaS*]
    #align(center, text(size: 2.4em, weight: "bold")[80--90%])
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

// VERIFY: SaaS 80--90% vs AI 50--60% gross margin. Find a citable source
// (e.g. Bessemer State of the Cloud / a16z / ICONIQ AI reports) and cite it.

#speaker-note[
  Gross margin = (revenue - cost of serving it) / revenue. For SaaS that cost is hosting and support. For AI it includes every token you buy from a lab.
]

== Exercise: price my homework bot

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    *The product*
    - AI tutor, *\$10 / month*
    - Mid-tier model: *\$3* per million tokens in, *\$15* per million out
    - One question (with the chat so far): \~5,000 tokens in, \~1,000 out

    #v(0.5em)
    *Your job (2 minutes, with a neighbour)* \
    What does one question cost? \
    A month for a light user? A heavy one?
  ],
  [
    #pause
    #table(
      columns: (auto, auto, auto),
      align: (left, right, right),
      stroke: none,
      inset: (x: 0.6em, y: 0.45em),
      table.header([], [*Cost*], [*Margin*]),
      table.hline(stroke: 0.5pt + luma(180)),
      [One question], [\$0.03], [],
      [Light user (100/month)], [\$3], [70%],
      [Heavy user (3,000/month)],
      [\$90],
      text(fill: rgb("#c62828"))[*#sym.minus;800%*],
    )
    #pause
    #lblock[
      Make it an *agent*, \~50 model calls per task, and even the light user costs *\$150*.
    ]
  ],
)

#speaker-note[
  One question: 5,000 × \$3/M = \$0.015 in, 1,000 × \$15/M = \$0.015 out. \$0.03.

  Light user: 100 × \$0.03 = \$3 against \$10 of revenue. 70% margin, looks like SaaS.

  Heavy user: 3,000 × \$0.03 = \$90 against \$10. You lose \$80 on them, every month.

  Agent: 100 tasks × 50 calls × \$0.03 = \$150.
]

== Pick a pricing model that fixes this

#grid(
  columns: (1fr, 1.2fr),
  column-gutter: 1.5em,
  align: top,
  [
    Back to the menu:
    - Per-token
    - Flat subscription
    - Freemium + ads
    - Per-seat
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

// VERIFY: Cursor switch Jun 2025, apology and refunds 4 Jul 2025; Claude Code
// weekly limits announced Jul 2025, effective 28 Aug 2025; Replit
// effort-based pricing (Jun 2025) and the backlash. Cite each.

#speaker-note[
  Context accumulates and agent loops multiply cost. Every one of these companies hit the heavy-user problem from the exercise, and every fix made their most loyal users angry. That's lesson 1.
]
