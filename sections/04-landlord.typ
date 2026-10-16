#import "/common.typ": *
#import "/citations.typ": cite-source

= Your supplier is your competitor and your landlord

== Two risks one layer down

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  gblock[
    *Competitor* ("Sherlocking")

    Whatever sits one layer below you can *absorb your product as a feature*.

    And it sees your usage data first.
  ],
  [
    #pause
    #gblock[
      *Landlord*

      If your product is someone else's model, they can *raise the rent*, *change the terms* or *evict you*.
    ]
  ],
)

#speaker-note[
  "Sherlocking" comes from Apple's Sherlock search tool, which absorbed a popular third-party app's features in 2002. Now it's labs absorbing the apps built on them.
]

== Windsurf: evicted, then split up

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
  // PLACEHOLDER N07: news article on Anthropic cutting Windsurf's direct
  // access to Claude models (Jun 2025), with Varun Mohan's comment.
  // TechCrunch broke it. Headline and date visible.
  shot(
    "N07",
    [Anthropic cuts Windsurf's Claude access, Jun 2025],
    path: "/figures/news/N07-windsurf-claude-access.png",
    url: "https://techcrunch.com/2025/06/03/windsurf-says-anthropic-is-limiting-its-direct-access-to-claude-ai-models/",
    width: 12cm,
  ),
  [
    - *Spring 2025*: OpenAI in talks to buy Windsurf for \~\$3B
    - *Jun 2025*: Anthropic cuts Windsurf's Claude access with *< 5 days' notice*
    - *Jul 2025*: the OpenAI deal stalls over Microsoft's IP rights
    #pause
    - Google pays *\$2.4B* for a licence plus the CEO and key researchers
    - Days later, Cognition buys what's left
  ],
)

// VERIFY: OpenAI ~$3B talks; Anthropic's <5 days' notice (Jun 2025); the
// Microsoft IP-rights sticking point; Google $2.4B (Jul 2025); Cognition
// acquisition days later.

#speaker-note[
  This is landlord risk and the reverse acqui-hire on one slide. Your supplier was a rival's potential acquirer, so it turned off your supply.
]

== Cursor: paying the landlord who competes with you

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
  // PLACEHOLDER N08: Newcomer (or other) report that Cursor was paying
  // Anthropic more than it earned (~$650M/year to Anthropic against ~$500M
  // revenue). Headline and date visible.
  shot("N08", [Cursor pays Anthropic more than it earns], width: 12cm),
  [
    - Fastest company ever to \$100M ARR
    - Reportedly paid Anthropic *more than it earned*
    - ...while Anthropic sold *Claude Code*, a direct competitor
    #pause
    - *Nov 2025*: builds its own Composer model
    - *Composer 2*, reportedly on open-weight *Kimi*, at a fraction of the price
    - Margins reportedly turn slightly positive
  ],
)

// VERIFY: "fastest to $100M ARR"; Newcomer's ~$650M to Anthropic vs ~$500M
// revenue (single source); Composer (Nov 2025); Composer 2 at $0.50/$1.50
// built on Kimi K2.5; margins turning positive. All are single-source so far.
// VERIFY: whether to mention the SpaceX $60B all-stock deal (announced 16 Jun
// 2026); confirm whether it has closed before mentioning it in the talk.

#speaker-note[
  Cursor's answer to landlord risk: build your own model on open weights, so the landlord can't evict you. This is the "keep your models swappable" point from lesson 5.
]

== When the lab ships your feature

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.6em,
  align: top,
  // PLACEHOLDER N09: article on ChatGPT adding PDF/file upload (Oct/Nov 2023)
  // and what it meant for "chat with your PDF" startups.
  shot(
    "N09",
    [ChatGPT file upload kills chat-with-PDF apps],
    path: "/figures/news/N09-chatgpt-pdf-upload.png",
    url: "https://techcrunch.com/2023/11/06/get-the-pdf-outta-here/",
    width: 7.8cm,
  ),
  // PLACEHOLDER N10: Jasper cutting its valuation / revenue forecast or its
  // founders stepping down after ChatGPT (2023). The Information or Forbes.
  shot("N10", [Jasper after ChatGPT], width: 7.8cm),
  // PLACEHOLDER N11: the Feb 2026 "SaaSpocalypse": Thomson Reuters falling
  // ~18% in a day after Anthropic's Claude Cowork legal plugin. Reuters,
  // Bloomberg or FT. Headline and date visible.
  shot(
    "N11",
    [SaaSpocalypse: Thomson Reuters #sym.minus;18%, Feb 2026],
    path: "/figures/news/N11-thomson-reuters-saaspocalypse.png",
    url: "https://www.theguardian.com/technology/2026/feb/03/anthropic-ai-legal-tool-shares-data-services-pearson",
    width: 7.8cm,
  ),
  [*Chat-with-PDF apps*: one ChatGPT update (late 2023)],
  [*Jasper*: \$1.5B valuation a month before ChatGPT launched],

  [*Feb 2026*: Claude Cowork's legal plugin; Thomson Reuters #sym.minus;18% in a day],
)

// VERIFY: ChatGPT file-upload date; Jasper's $125M Series A at $1.5B (Oct
// 2022) and the 2023 cuts; Thomson Reuters -18% on 3 Feb 2026 and RELX /
// Wolters Kluwer >10%. Pick one sourced figure for the total SaaS loss if
// you mention it (sources range $100B--$1T).

== Discuss

#discuss[
  You're building on a frontier model's API. \
  What would make you hard to replace \
  the day the lab ships your feature?
]
