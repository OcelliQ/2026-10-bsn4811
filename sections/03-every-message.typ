#import "/common.typ": *
#import "/citations.typ": cite-source

= Every message costs money

#section-quote[It's like a gym subscription: the flat fee only works because most members rarely show up.][the business model of every flat-rate AI plan]

== Your best customers are your worst customers

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    *SaaS*
    - Marginal cost \~0
    - Heavy users: *pure profit*
    - Chase engagement: more use, more value, more renewals
  ],
  [
    #pause
    *AI*
    - Every message has a token bill
    - Heavy users on a flat plan: *pure loss*
    - Engagement becomes a *cost*
    - Highly engaged users also bring *safety and legal exposure*
  ],
)

#pause
#v(0.6em)
#lblock[
  #align(
    center,
  )[The metric consumer apps chase is the one that bankrupts an AI app.]
]

== Character.AI: a beloved product

#grid(
  columns: (1fr, 12cm),
  column-gutter: 1.2em,
  align: top,
  [
    - *2021*: founded by ex-Google researchers Noam Shazeer and Daniel de Freitas
    - *Mar 2023*: valued at over \$1B
    - Millions of devoted users chatting with characters for hours a day
    - *Aug 2024*: Google pays \~\$2.7B to license the tech and rehire the founders. The company stays "independent".
  ],
  // PLACEHOLDER N02: news article on Google's ~$2.7B Character.AI licensing
  // deal and rehiring Shazeer and de Freitas (Aug 2024). Prefer WSJ,
  // Reuters, The Information or The Verge. Headline and date visible.
  shot("N02", [Google's \$2.7B Character.AI deal, Aug 2024], width: 12cm),
)

// VERIFY: founding year 2021; >$1B valuation Mar 2023 (a16z-led round);
// Google's ~$2.7B (Aug 2024; WSJ reported the figure).

== Aside: the talent is the asset

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    The *reverse acqui-hire*: Big Tech buys the people plus a licence, not the company.

    - *Inflection* → Microsoft (\~\$650M licence)
    - *Character.AI* → Google (\~\$2.7B)
    - *Adept, Covariant* → Amazon
    - *Windsurf* → Google (\$2.4B), then Cognition buys the rest
  ],
  [
    #pause
    #gblock[
      The founders get rich. \
      The remaining staff and the cap table get *the husk*.
    ]
    #v(0.5em)
    It also skips merger review.
  ],
)

// VERIFY: Inflection ~$650M (Mar 2024); Windsurf $2.4B (Jul 2025). The
// "skips merger review" line needs a cite (FTC 6(b) inquiry into these deals,
// or reporting that Covariant's deal was sized to stay under HSR).

== Character.AI: then the bills come

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    *Costs and risks pile up*
    - *Oct 2024*: Garcia sues over the suicide of 14-year-old Sewell Setzer. State suits follow.
    - *Nov 2025*: open-ended chat banned for under-18s; "companion" becomes "role-play platform"
    - Ads added mid-2025, in-app purchases early 2026
  ],
  [
    #pause
    *The unit economics (2026)*
    - Revenue: \$2.8M/month → \$5.3M/month
    - Operating losses: *\$8--9M every month*
    - Compute, Jan--Aug: *\$56M*
  ],
)

// VERIFY: Garcia v. Character Technologies filed Oct 2024; Kentucky and
// Pennsylvania state suits; settlement with Google in early 2026.
// VERIFY: under-18 ban effective 25 Nov 2025.
// VERIFY: all four monetization figures. Only source so far is Futurism,
// citing the bankruptcy filings; get them from the docket itself.

#speaker-note[
  The product worked. People loved it. Every hour of that love was a compute bill, and the users who loved it most were the most expensive and the most legally exposed.
]

== Character.AI: Chapter 11

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
  // PLACEHOLDER N03: news article on Character.AI's Chapter 11 filing in
  // Delaware (Oct 2026), ideally one mentioning Disney's stalking-horse bid.
  // Headline and date visible.
  shot(
    "N03",
    [Character.AI files for Chapter 11, Oct 2026],
    path: "/figures/news/N03-character-ai-chapter-11.png",
    url: "https://variety.com/2026/biz/news/disney-bids-on-character-ai-assets-chapter-11-bankruptcy-1236909984/",
    width: 12cm,
  ),
  [
    - *Oct 2026*: Chapter 11, Delaware
    - Stalking-horse bid: *Disney, \$20M* for a non-exclusive licence to the IP
    #pause
    - From \$1B+ to \$20M in three years, *while users loved it*
  ],
)

// VERIFY: filing date (12 or 13 Oct 2026), court (D. Del.), Disney's $20M
// stalking-horse bid and its terms. Get the docket.
// VERIFY: CEO name. Reports name Karandeep Anand (reportedly left for Disney);
// another source says "Colin Adams". Don't name the CEO until resolved.

== It's not just Character.AI

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.6em,
  align: top,
  // PLACEHOLDER N04: Sam Altman saying OpenAI is losing money on ChatGPT Pro
  // at $200/month (Jan 2025). His X post, or an article quoting it.
  shot("N04", [Altman: losing money on ChatGPT Pro], width: 7.8cm),
  // PLACEHOLDER N05: WSJ (Oct 2023) report that GitHub Copilot lost ~$20 per
  // user per month on a $10 plan, or a syndicated article citing it.
  shot("N05", [Copilot loses \~\$20/user/month (WSJ)], width: 7.8cm),
  // PLACEHOLDER N06: Anthropic adding weekly rate limits to Claude Code
  // (announced Jul 2025, from 28 Aug 2025). TechCrunch or The Verge.
  shot("N06", [Claude Code weekly limits], width: 7.8cm),
  [*ChatGPT Pro*: "losing money" at \$200/month],
  [*GitHub Copilot*: \~\$20/user/month lost on a \$10 plan (2023)],

  [*Claude Code*: weekly limits for the heaviest users],
)

#v(0.4em)
Also *Cursor* (credits, then an apology) and *Replika* (a companion app fined #sym.euro;5M by Italy's Garante).

// VERIFY: Altman's "losing money on Pro" post (5 Jan 2025); WSJ Copilot figure
// (Oct 2023, "more than $20 a month per user on average, some up to $80");
// Claude Code weekly limits; Replika EUR 5M Garante fine (2025).

== Discuss

#discuss[
  Which pricing model would you pick for the homework bot, \
  and what does it do to your heaviest users?
]
