#import "/common.typ": *
#import "/citations.typ": cite-source

= Unit Economics: \ Every message costs money

#section-quote[It's like a gym subscription: the flat fee only works because most members rarely show up.][the business model of every flat-rate AI plan]




== SaaS vs AI unit economics

#let margins = (
  (name: [Car maker], gross: [\~10%], net: [\~1%]),
  (name: [Airline], gross: [\~25%], net: [\~2.5%]),
  (name: [Fast food], gross: [\~32%], net: [\~9%]),
  (name: [AI app], gross: [\~50%], net: [???], hl: true),
  (name: [SaaS], gross: [\~75%], net: [\~25%]),
)
#let margin-fill(m) = if m.at("hl", default: false) { accent } else { black }

#v(1cm)
#grid(
  columns: (5cm,) + (1fr,) * margins.len(),
  column-gutter: 1em,
  row-gutter: 1.2em,
  align: horizon,
  [], ..margins.map(m => align(center, text(weight: "bold", fill: margin-fill(m), m.name))),
  ..(
    (field: "gross", label: [Gross margin], q: [Does the _product_ pay for itself?]),
    (field: "net", label: [Net margin], q: [Does the _company_?]),
  )
    .map(r => (
      [#text(weight: "bold", r.label) \ #r.q],
      ..margins.map(m => gblock(center: true, outset: (x: 0em, y: 1em), text(
        size: 1.6em,
        weight: "bold",
        fill: margin-fill(m),
        m.at(r.field),
      ))),
    ))
    .flatten(),
)
#v(1fr)
#grid(
  columns: (1fr, auto, 1fr),
  column-gutter: 1em,
  align: top,
  [
    #text(weight: "bold")[Inputs are most of the price]
    - Steel in every car, food in every meal
    - AI: every message is a paid model call
    - Heavy users *drag you down*.
  ],
  grid.cell(align: horizon, text(size: 1em, fill: luma(50), sym.arrow.l.r.long)),
  [
    #text(weight: "bold")[Inputs are almost free]
    - Code written once, copied for free
    - Serving one more user costs nothing
    - Heavy users are *pure profit*
  ],
)
#v(1cm)

// Sources: Damodaran margin dataset, Jan 2026 (aggregates: Auto & Truck
// 10.4% / 1.3%; Air Transport 24.8% / 2.5%; Restaurant/Dining 32.2% / 9.4%;
// Software (System & Application) net 25.5%). SaaS gross 75-85%
// and AI 50-60%: Lazard, "Deep Diving on AI Commercialization" (2024); a16z,
// "The New Business of AI" (2020); ICONIQ State of AI 2026 (AI ~52%). AI net
// below zero: Apollo (Slok, Aug 2026), AI models & apps operating margin ~-59%.
// AI-app net margin is shown as ??? on purpose; the distribution is revealed
// at the end of the deck.
// VERIFY: a sourced range for SaaS net margin, to replace ~25%.
// "Fast food" is Damodaran's Restaurant/Dining (64 US firms, indname.xls Jan
// 2026): mostly quick-service chains (Starbucks, McDonald's, Chipotle, Yum,
// RBI), but also casual dining (Darden, Texas Roadhouse), Aramark and DoorDash.

#speaker-note[
  Gross margin = (revenue - cost of serving each unit) / revenue. For a car maker that cost is steel and labour; for an airline, fuel and planes; for fast food, ingredients and staff; for SaaS, hosting and support. For AI it includes every token you buy from a lab.

  Net margin takes out everything else too: R&D, salaries, marketing, interest, tax. A car maker keeps a tenth of revenue after paying for parts, and about one cent per dollar once everything is paid.

  Left to right, both margins improve, except the AI app. In an AI app cost scales with use, not users, and heavy users can be pure loss. Software-like gross margins, but most AI companies lose money overall.

  Tokens are ingredients. A flat plan is an all-you-can-eat buffet: it works only because most diners eat a normal amount.
]


== Character.AI: a beloved product

#slide(composer: grid.with(
  columns: (1fr, 12cm),
  column-gutter: 1.2em,
  align: top,
))[
  - *2021*: founded by ex-Google researchers Noam Shazeer and Daniel de Freitas
  - *Mar 2023*: valued at over \$1B. Millions of devoted users chatting for hours a day.
  - *Aug 2024*: Google rehires both founders and licenses the tech for a reported \$2.7B. Character.AI stays independent.
  - *Oct 2026*: files for *Chapter 11 bankruptcy* and seeks a buyer.#cite-source("https://blog.character.ai/an-update-on-character-ai/")[Character.AI. _An Update on Character.ai_. 12 October 2026.]

  #pause
  *The unit economics (2026)*
  - Revenue: \$2.8M/month → \$5.3M/month
  - Operating losses: *\$8--9M every month*
  - Compute, Jan--Aug: *\$56M*

][
  #meanwhile
  #block(height: 100%, width: 100%, spacing: 0pt, grid(
    rows: (1fr, auto),
    row-gutter: 0.2em,
    layout(size => {
      // Source: 728 × 829. Keep its full height and middle 60% of the width.
      let full-width = size.height * 728 / 829
      align(center, block(
        width: full-width,
        height: size.height,
        clip: true,
        place(center + top, image(
          "/figures/news/N02-character-ai-google-deal.png",
          width: full-width,
          height: size.height,
        )),
      ))
    }),
    attribution-style(link("https://www.wsj.com/tech/ai/noam-shazeer-google-ai-deal-d3605697")),
  ))
]

== Character.AI: then the bills come

#slide(composer: grid.with(
  columns: (1fr, 12cm),
  column-gutter: 1.2em,
  align: top,
))[
  - *Oct 2024*: Sued over the suicide of 14-year-old Sewell Setzer. State suits follow.
  - *May 2025*: begins testing in-app ads.#cite-source("https://www.reddit.com/r/CharacterAI/comments/1kkz2qm/announcement_updates_to_keep_cai_running_smoothly/")[Character.AI. _Updates to keep C.AI running smoothly_. Official community announcement, 12 May 2025.]
  - *Nov 2025*: open-ended chat banned for under-18s;
  - *Jan 2026*: In-app purchases.#cite-source("https://www.reddit.com/r/CharacterAI/comments/1qklo2i/called_it_you_can_now_buy_charms_on_cai_mobile/")[r/CharacterAI. _Called it. You can now buy charms on C.AI mobile._ User reports and bundle prices, 23 January 2026. Establishes availability by January, rather than an official launch date.]

  - *Oct 2026*: Chapter 11 bankruptcy
    - Stalking-horse bid: *Disney, \$20M* for a non-exclusive licence to the IP

  #pause
  #lblock(center: true)[
    From \$1B+ to \$20M in three years\
    *while users loved it*
  ]
][
  #meanwhile
  #block(height: 100%, width: 100%, spacing: 0pt, grid(
    rows: (1fr, auto),
    row-gutter: 0.2em,
    layout(size => block(
      width: size.width,
      height: size.height,
      clip: true,
      // Keep the article headline inside the crop; its column is left of centre.
      place(center + top, dx: size.height * 0.19, image(
        "/figures/news/N03-character-ai-chapter-11.png",
        width: size.height * 1600 / 1000,
        height: size.height,
      )),
    )),
    attribution-style(
      link("https://variety.com/2026/biz/news/disney-bids-on-character-ai-assets-chapter-11-bankruptcy-1236909984/"),
    ),
  ))
]

// VERIFY: Garcia v. Character Technologies filed Oct 2024; Kentucky and
// Pennsylvania state suits; settlement with Google in early 2026.
// VERIFY: under-18 ban effective 25 Nov 2025.
// VERIFY: all four monetization figures. Only source so far is Futurism,
// citing the bankruptcy filings; get them from the docket itself.

#speaker-note[
  The product worked. People loved it. Every hour of that love was a compute bill, and the users who loved it most were the most expensive and the most legally exposed.
]

// GLM-5.3-REVIEW: valuation collapse as three falling bars: $1B+ (Mar 2023)
// -> $2.7B licence (Aug 2024) -> $20M stalking-horse (Oct 2026).
// VERIFY: filing date (12 or 13 Oct 2026), court (D. Del.), Disney's $20M
// stalking-horse bid and its terms. Get the docket. (The Variety piece shown
// confirms the filing and Disney's $20M bid but doesn't name Delaware.)
// VERIFY: CEO name. Reports name Karandeep Anand (reportedly left for Disney);
// another source says "Colin Adams". Don't name the CEO until resolved.

== It's not just Character.AI

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.6em,
  align: top,
  shot(
    "N04",
    [Altman: losing money on ChatGPT Pro],
    path: "/figures/news/N04-chatgpt-pro-losing-money.png",
    url: "https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/",
    width: 7.8cm,
  ),
  shot(
    "N05",
    [Copilot loses \~\$20/user/month (WSJ)],
    path: "/figures/news/N05-copilot-20-per-user.png",
    url: "https://www.wsj.com/tech/ai/ais-costly-buildup-could-make-early-products-a-hard-sell-bdd29b9f",
    width: 7.8cm,
  ),
  shot(
    "N06",
    [Claude Code weekly limits],
    path: "/figures/news/N06-claude-code-weekly-limits.png",
    url: "https://techcrunch.com/2025/07/28/anthropic-unveils-new-rate-limits-to-curb-claude-code-power-users/",
    width: 7.8cm,
  ),

  [*ChatGPT Pro*: "losing money" at \$200/month], [*GitHub Copilot*: \~\$20/user/month lost on a \$10 plan (2023)],

  [*Claude Code*: weekly limits for the heaviest users],
)

#v(0.4em)
Also *Cursor* (credits, then an apology) and *Replika* (a companion app fined #sym.euro;5M by Italy's Garante).

// VERIFY: Altman's "losing money on Pro" post (5 Jan 2025); WSJ Copilot figure
// (Oct 2023, "more than $20 a month per user on average, some up to $80");
// Replika EUR 5M Garante fine (2025).
// Claude Code weekly limits: announced 28 Jul 2025, from 28 Aug 2025 (Anthropic
// on X). Cursor: cursor.com/blog/june-2025-pricing (apology 4 Jul 2025).

== Discuss

#discuss[
  Which pricing model would you pick for the homework bot, \
  and what does it do to your heaviest users?
]
