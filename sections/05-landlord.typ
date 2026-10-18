#import "/common.typ": *
#import "/citations.typ": cite-source

= Your key supplier is your competitor and landlord

#section-subtitle[Ecosystem Cannibalization]

// GLM-5.3-REVIEW: the thesis is spatial - draw it: your app box resting on
// the lab's model, the lab's own app (Claude Code) on the same layer, arrows
// for "absorb as feature" and "raise rent / evict".
== Two risks one layer down

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [#gblock[
      *Competitor*

      Whatever sits one layer below you can *absorb your product as a feature*.

      And it sees your usage data first.
    ]
    _"Sherlocking"_, from when Apple copied a popular third-party app in 2002.
  ],
  [
    #gblock[
      *Landlord*

      If your product is someone else's model, they can *raise the rent*, *change the terms* or *evict you*.
    ]
  ],
)

#speaker-note[
  The landlord is the better business. 62% of McDonald's revenue is franchisees' rent and royalties, not burgers. Its own restaurants make about 15% at restaurant level; the company as a whole nets 32%. The labs are the landlord: every app built on them pays rent per token.
]

// McDonald's FY2025 10-K: franchised revenue $16.5B of $26.9B; net income
// $8.6B; company-operated restaurant margin ~14.7%.

// GLM-5.3-REVIEW: a five-dot horizontal timeline (talks -> eviction with
// <5 days' notice -> stall -> $2.4B Google -> Cognition days later) reads
// faster than bullets.
== Windsurf: evicted, then split up

#slide(composer: grid.with(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
))[
  #shot(
    "N07",
    [Anthropic cuts Windsurf's Claude access, Jun 2025],
    path: "/figures/news/N07-windsurf-claude-access.png",
    url: "https://techcrunch.com/2025/06/03/windsurf-says-anthropic-is-limiting-its-direct-access-to-claude-ai-models/",
    width: 100%,
    height: 100%,
  )
][
  #meanwhile
  #company-logo("/images/logos/windsurf-wordmark.svg", height: 1.03cm)
  - *Spring 2025*: OpenAI in talks to buy Windsurf for \~\$3B
  - *Jun 2025*: Anthropic cuts Windsurf's Claude access with *< 5 days' notice*
  - *Jul 2025*: the OpenAI deal stalls over Microsoft's IP rights
  - *11 Jul 2025*: Google pays *\$2.4B* for a licence plus the CEO and key researchers.#cite-source("https://www.investing.com/news/stock-market-news/google-hires-windsurf-ceo-and-researchers-to-advance-ai-ambitions-4132685")[Kenrick Cai, Krystal Hu and Kritika Lamba, Reuters. _Google hires Windsurf execs in \$2.4 billion deal to advance AI coding ambitions_. 11 July 2025. Reported non-exclusive technology licence and hiring of CEO Varun Mohan, co-founder Douglas Chen and R&D staff; Google takes no equity stake.]
  - *14 Jul 2025*: Cognition agrees to buy what's left.#cite-source("https://cognition.com/blog/windsurf")[Scott Wu, Cognition. _Cognition's acquisition of Windsurf_. 14 July 2025. Announces a definitive agreement to acquire Windsurf's IP, product, brand, business and remaining team.]
]

// VERIFY: OpenAI ~$3B talks; Anthropic's <5 days' notice (Jun 2025); the
// Microsoft IP-rights sticking point.

#speaker-note[
  This is landlord risk and the reverse acqui-hire on one slide. Your supplier was a rival's potential acquirer, so it turned off your supply.
]

// GLM-5.3-REVIEW: before/after gross-margin bars - negative with "huge
// Anthropic bills", slightly positive after Composer 2 on open-weight Kimi.
// One image bridging lesson 2 to lesson 5 (swappable models).
== Cursor: paying the landlord who competes with you

#slide(composer: grid.with(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
))[
  #shot(
    "N08",
    [Cursor's "huge Anthropic bills", Aug 2025],
    path: "/figures/news/N08-cursor-anthropic-bills.png",
    url: "https://www.newcomer.co/p/cursors-popularity-has-come-at-a",
    width: 100%,
    height: 100%,
  )
][
  #meanwhile
  #company-logo("/images/logos/cursor-wordmark-light.svg", height: 1.6cm)
  - Fastest company ever to \$100M ARR
  - Negative gross margins, with *huge Anthropic bills*
  - ...while Anthropic sold *Claude Code*, a direct competitor
  #pause
  - *Nov 2025*: builds its own *Composer 2* model at a fraction of the price
  - Margins reportedly turn slightly positive
  - *Aug 2026*: acquired by *SpaceX* in a *\$60B all-stock deal*.#cite-source("https://cursor.com/blog/joining-spacex")[Cursor Team. _Cursor is now a part of SpaceX_. 14 August 2026. Confirms the acquisition has completed; the company cites access to SpaceX's compute for model training.]#cite-source("https://www.investing.com/news/stock-market-news/spacex-to-buy-cursor-ai-coding-agent-operator-anysphere-for-60-billion-4744289")[Aditya Soni and Deborah Mary Sophia, Reuters. _SpaceX locks in \$60 billion Cursor deal to close gap with rivals in AI coding race_. 16 June 2026. US\$60B all-stock acquisition announced; xAI had joined SpaceX in February.]
]

// VERIFY: "fastest to $100M ARR"; Newcomer's ~$650M to Anthropic vs ~$500M
// revenue (single source; the Newcomer piece shown, 10 Aug 2025, has ~$500M
// ARR, negative gross margins and "huge Anthropic bills" but not $650M); Composer (Nov 2025); Composer 2 at $0.50/$1.50
// built on Kimi K2.5; margins turning positive. All are single-source so far.

#speaker-note[
  Cursor's answer to landlord risk: build your own model on open weights, so the landlord can't evict you. This is the "keep your models swappable" point from lesson 5.

  The SpaceX deal was announced on June 16, 2026 and completed on August 14, according to Cursor's own announcement. SpaceX already owned xAI; Cursor's announcement calls the earlier model-training partnership SpaceXAI. The acquirer is SpaceX, and Cursor highlighted access to its compute capacity.
]

// GLM-5.3-REVIEW: one-day SaaSpocalypse bars - Thomson Reuters -18%, RELX
// and Wolters Kluwer >-10%: the market pricing landlord risk in a session.
// GLM-5.3-REVIEW (optional case): Scale AI - Meta's $14.3B for 49%, then
// Google and OpenAI walked; "neutrality was the product". The best L1/L2
// case not in the deck.
== When the lab ships your feature

#slide(config: config-common(breakable: false), repeat: 2, self => [
  #let bottom-panels = (
    [
      #grid(
        columns: (1fr, 1fr, 1fr),
        column-gutter: 0.8em,
        align: top,
        [*Chat-with-PDF apps*: one ChatGPT update (late 2023)],
        [*Jasper*: \$1.5B valuation a month before ChatGPT launched],

        [
          *Feb 2026*: Claude Cowork's legal plugin; Thomson Reuters #sym.minus;18% in a day

          *Apr 2026*: Claude Design launches; Figma shares fall \~7%.#cite-source("https://www.anthropic.com/news/claude-design-anthropic-labs")[Anthropic. _Introducing Claude Design by Anthropic Labs_. 17 April 2026. Research preview for designs, prototypes, slides and other visual work.]#cite-source("https://www.techcentral.ie/figma-and-adobe-shares-fall-after-athropic-releases-design-tool/")[TechCentral.ie. _Figma and Adobe shares fall after Anthropic releases design tool_. 20 April 2026. Reports Figma down 6.9% on Friday, 17 April, alongside the Claude Design launch; a stock-market reaction.]
        ],
      )
    ],
    [
      #align(center)[
        #text(size: 1.5em)[
          What makes you hard to replace \
          the day the lab ships your feature?
        ]
      ]
    ],
  )
  #block(width: 100%, height: 100%, spacing: 0pt, grid(
    columns: (1fr, 1fr, 1fr),
    rows: (1fr, auto),
    column-gutter: 0.8em,
    row-gutter: 0.6em,
    align: top,
    shot(
      "N09",
      [ChatGPT file upload kills chat-with-PDF apps],
      path: "/figures/news/N09-chatgpt-pdf-upload.png",
      url: "https://techcrunch.com/2023/11/06/get-the-pdf-outta-here/",
      width: 100%,
      height: 100%,
    ),
    shot(
      "N10",
      [Jasper after ChatGPT],
      path: "/figures/news/N10-jasper-valuation.png",
      url: "https://www.theinformation.com/articles/jasper-an-early-generative-ai-winner-cuts-internal-valuation-as-growth-slows",
      width: 100%,
      height: 100%,
    ),
    shot(
      "N11",
      [SaaSpocalypse: Thomson Reuters #sym.minus;18%, Feb 2026],
      path: "/figures/news/N11-thomson-reuters-saaspocalypse.png",
      url: "https://finance.yahoo.com/news/anthropics-ai-tools-deepen-selloff-054551832.html",
      width: 100%,
      height: 100%,
    ),

    grid.cell(colspan: 3, layout(size => {
      let panel-height = calc.max(..bottom-panels.map(panel => {
        measure(panel, width: size.width).height
      }))
      block(width: size.width, height: panel-height, align(
        center + horizon,
        utils.alternatives(self: self, ..bottom-panels),
      ))
    })),
  ))
])

// VERIFY: ChatGPT file-upload date; Jasper's $125M Series A at $1.5B (Oct
// 2022) and the 2023 cuts; Thomson Reuters -18% on 3 Feb 2026 and RELX /
// Wolters Kluwer >10%. Pick one sourced figure for the total SaaS loss if
// you mention it (sources range $100B--$1T).

#speaker-note[
  Claude Design launched on April 17, 2026. TechCentral reports a 6.9% decline in Figma shares that Friday. Reuters' corrected April 17 market update, republished April 21, captured a 6.4% intraday fall; these snapshots should not be mixed into a single exact closing-price claim.

  This is evidence of investors repricing competitive risk. It does not establish that Claude Design took Figma's customers or revenue. Figma subsequently reported Q2 2026 revenue of \$370.1M, up 48% year-over-year, and raised its full-year revenue outlook.#cite-source("https://investor.figma.com/news-events/news/news-details/2026/Figma-Announces-Second-Quarter-2026-Financial-Results/default.aspx")[Figma. _Figma Announces Second Quarter 2026 Financial Results_. 5 August 2026. Revenue of US\$370.1M, up 48% year-over-year; full-year revenue guidance raised.]
]
