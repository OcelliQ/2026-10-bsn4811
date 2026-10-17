#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/annotation-brace.typ": annotation-brace
#import "/figures/value-chain.typ": value-chain

= How AI businesses make money

== The AI value chain

// D05: two builds, the legal arrows arriving on the second.
// VERIFY: the example wordmarks under each layer are the ones to name.
#alternatives(
  align(center, value-chain(mode: "base")),
  align(center, value-chain(mode: "full")),
)

#speaker-note[
  Walk left to right. Each layer buys from the one to its left and sells to the one to its right. The inputs from below are where the physical world bites: fabs, power, water, data.

  Then the two legal arrows. Liability lands on the app, because the app faces the customer. Extraction leaves from the models layer, because that's where the training data went in. Both come back in lesson 4.
]

== Where you'll sit

// Lifted from the ai-for-clm "Who Controls What in AI" slide
// (01-intro/chapter/01-industry-landscape.typ), relabelled for this audience.
#slide(align: top, config: config-common(breakable: false))[
  #cite-source(
    "https://a16z.com/emerging-architectures-for-llm-applications/",
    display: false,
  )[Andreessen Horowitz. _Emerging Architectures for LLM Applications_.]
  #cite-source(
    "https://blogs.nvidia.com/blog/ai-5-layer-cake/",
    display: false,
  )[NVIDIA. _AI's five-layer cake_.]

  #set text(size: 18pt)
  #v(10pt)
  #let control-label(label) = grid.cell(align: right + horizon)[
    #text(size: 18pt, weight: "bold", fill: rgb("#5a5a5a"))[#label]
  ]
  #let control-brace = block(width: 100%, height: 100%, spacing: 0pt)[
    #layout(size => annotation-brace(size.height, "#5a5a5a", direction: "left"))
  ]
  #grid(
    columns: (1fr, 16pt, 2.2fr, 16pt, 1fr),
    rows: (1fr,) * 6,
    column-gutter: 12pt,
    row-gutter: 4pt,
    align: top,
    grid.cell(x: 0, y: 0, rowspan: 2, control-label([Your direct control])),
    grid.cell(x: 1, y: 0, rowspan: 2, control-brace),
    grid.cell(x: 0, y: 2, rowspan: 2, control-label(
      [Your technical team owns],
    )),
    grid.cell(x: 1, y: 2, rowspan: 2, control-brace),
    grid.cell(x: 0, y: 4, rowspan: 2, control-label([External providers])),
    grid.cell(x: 1, y: 4, rowspan: 2, control-brace),
    grid.cell(x: 2, y: 0, rowspan: 6)[
      #let value-layer(
        title,
        detail,
        fill: luma(240),
        ink: rgb("#23373b"),
      ) = grid.cell(
        fill: fill,
        inset: (x: 12pt, y: 9pt),
      )[
        #set par(leading: 3pt, spacing: 0pt)
        #stack(
          dir: ttb,
          spacing: 10pt,
          text(size: 24pt, weight: "bold", fill: ink)[#title],
          text(size: 18pt, fill: ink)[#detail],
        )
      ]
      #block(
        width: 100%,
        height: 100%,
        spacing: 0pt,
        fill: luma(160),
        radius: 5pt,
        clip: true,
      )[
        #grid(
          columns: (1fr,),
          rows: (1fr,) * 6,
          row-gutter: 4pt,
          value-layer(
            [1. Business need],
            [Customers · pricing · success metrics],
            fill: rgb("#236c57"),
            ink: white,
          ),
          value-layer(
            [2. Policy],
            [Rules · accountability · human oversight],
            fill: rgb("#c5dace"),
          ),
          value-layer(
            [3. Orchestration],
            [Workflows · integrations · approvals],
            fill: rgb("#dce8e2"),
          ),
          value-layer(
            [4. Engineering],
            [Tools · prompts · evaluation · deployment],
            fill: rgb("#e7edef"),
          ),
          value-layer(
            [5. Infrastructure],
            [Inference · latency · capacity · cost],
            fill: luma(240),
          ),
          grid.cell(fill: luma(160), inset: 0pt)[
            #grid(
              columns: (1fr,) * 5,
              rows: (1fr,),
              column-gutter: 4pt,
              ..([model dev], [chips], [power], [data centres], [network]).map(
                label => block(
                  width: 100%,
                  height: 100%,
                  fill: luma(240),
                  inset: 4pt,
                )[
                  #set par(leading: 3pt, spacing: 0pt)
                  #align(center + horizon, text(
                    size: 16pt,
                    weight: "bold",
                    fill: rgb("#23373b"),
                  )[#label])
                ],
              ),
            )
          ],
        )
      ]
    ],
    grid.cell(x: 3, y: 0, rowspan: 2)[#pause
      #block(width: 100%, height: 100%, spacing: 0pt)[
        #layout(size => annotation-brace(size.height, "#e87900"))
      ]
    ],
    grid.cell(x: 4, y: 0, rowspan: 2, align: left + horizon)[
      #text(size: 18pt, weight: "bold", fill: rgb("#e87900"))[This lecture.]
    ],
  )
]

#speaker-note[
  Same stack, seen from the app builder's chair. You control the top. Everything at the bottom is someone else's business, and their business model becomes your cost structure.
]

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
