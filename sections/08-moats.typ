#import "/common.typ": *
#import "/citations.typ": cite-source

= Moats: which evaporate, which hold

// GLM-5.3-REVIEW: the signature number deserves its own chart - GPT-3-level
// capability $60 -> $0.06 per million tokens (a16z), log scale, over three
// years. Needs a small custom chart; the ai-models-chart figures are
// cross-sections, not a time series.
// GLM-5.3-REVIEW: Jevons counterpoint beside it - price down 10x, enterprise
// spend $11.5B -> $37B: the argument's tension in one visual.
== LLMflation: today's premium is next year's commodity

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    - The price of a given capability falls *\~10× a year*
    - GPT-3-level: *\$60 → \$0.06* per million tokens in three years
    - Frontier reaches budget tier in *\~4 months*
    #pause
    - Yet total spend *rises*: tasks use far more tokens (Jevons)
    - Enterprise GenAI spend: \$11.5B → \$37B (2024 → 2025)
  ],
  [
    #pause
    #shot(
      "N20",
      [DeepSeek day: Nvidia #sym.minus;17%, 27 Jan 2025],
      path: "/figures/news/N20-deepseek-nvidia.png",
      url: "https://www.cnbc.com/2025/01/27/nvidia-sheds-almost-600-billion-in-market-cap-biggest-drop-ever.html",
      width: 12cm,
    )
  ],
)

// VERIFY: a16z "LLMflation" (Nov 2024): ~10x/year and $60 -> $0.06. Frontier
// to budget ~4 months (A* slide 16 / by-age chart). Menlo Ventures enterprise
// GenAI spend $11.5B -> $37B. Nvidia -17% / -$589B on 27 Jan 2025
// (the CNBC piece shown says "almost $600 billion").

#speaker-note[
  A\* slide 70's line: "expensive value-added services may be much cheaper or obsolete in months". If your premium is "we have access to a better model", it expires.
]

== Moats that hold

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    Own something the lab can't ship:
    - the *customer*
    - the *workflow*
    - the *data*
    - the *brand*

    #pause
    ...and keep your models *swappable*.
  ],
  [
    #pause
    - *Cursor*: its own models, on open weights
    - *Legal and health verticals*: the workflow and the trust
    - *Compliance* (lesson 4): expensive to copy
  ],
)

// GLM-5.3-REVIEW (single source): revenue-per-employee bar - Midjourney at
// ~$18M per staff against the labs - quantifies "the profitable one".
== Midjourney: the profitable one

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
  shot(
    "N21",
    [Meta licenses Midjourney's tech, Aug 2025],
    path: "/figures/news/N21-meta-midjourney-license.png",
    url: "https://techcrunch.com/2025/08/22/meta-partners-with-midjourney-on-ai-image-and-video-models/",
    width: 12cm,
  ),
  [
    - *No VC.* Subscription-only. Started on Discord.
    - \~\$200M revenue (2023) with *\~11 staff*
    - *Aug 2025*: licenses its tech *to Meta*, rather than being eaten by it
    #pause
    - Diversifying: video (Jun 2025), more since
    - Still sued by Disney, Universal and WBD
  ],
)

// VERIFY: ~$200M 2023 revenue and ~11 staff (single source); Meta licensing
// (Aug 2025, terms undisclosed); video model V1 (Jun 2025). Co-Star
// acquisition (Jul 2026) and the Harvard medical division (Jun 2026) are
// single-source; add them to "more since" only once verified.

#speaker-note[
  Midjourney owns the brand and the community, keeps costs tiny, and charges a subscription people actually pay. It sells to the giant instead of competing with it. The open legal risk is the asterisk.
]

== Discuss

#discuss[
  What happens to your product \
  when the model it runs on is *10× cheaper*?
]
