#import "/common.typ": *
#import "/citations.typ": cite-source

= Your supplier is your competitor and your landlord

// GLM-5.3-REVIEW: the thesis is spatial - draw it: your app box resting on
// the lab's model, the lab's own app (Claude Code) on the same layer, arrows
// for "absorb as feature" and "raise rent / evict".
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

// GLM-5.3-REVIEW: a five-dot horizontal timeline (talks -> eviction with
// <5 days' notice -> stall -> $2.4B Google -> Cognition days later) reads
// faster than bullets.
== Windsurf: evicted, then split up

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
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

// GLM-5.3-REVIEW: before/after gross-margin bars - negative with "huge
// Anthropic bills", slightly positive after Composer 2 on open-weight Kimi.
// One image bridging lesson 2 to lesson 5 (swappable models).
== Cursor: paying the landlord who competes with you

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
  shot(
    "N08",
    [Cursor's "huge Anthropic bills", Aug 2025],
    path: "/figures/news/N08-cursor-anthropic-bills.png",
    url: "https://www.newcomer.co/p/cursors-popularity-has-come-at-a",
    width: 12cm,
  ),
  [
    - Fastest company ever to \$100M ARR
    - Negative gross margins, with *huge Anthropic bills*
    - ...while Anthropic sold *Claude Code*, a direct competitor
    #pause
    - *Nov 2025*: builds its own Composer model
    - *Composer 2*, reportedly on open-weight *Kimi*, at a fraction of the price
    - Margins reportedly turn slightly positive
  ],
)

// VERIFY: "fastest to $100M ARR"; Newcomer's ~$650M to Anthropic vs ~$500M
// revenue (single source; the Newcomer piece shown, 10 Aug 2025, has ~$500M
// ARR, negative gross margins and "huge Anthropic bills" but not $650M); Composer (Nov 2025); Composer 2 at $0.50/$1.50
// built on Kimi K2.5; margins turning positive. All are single-source so far.
// VERIFY: whether to mention the SpaceX $60B all-stock deal (announced 16 Jun
// 2026); confirm whether it has closed before mentioning it in the talk.

#speaker-note[
  Cursor's answer to landlord risk: build your own model on open weights, so the landlord can't evict you. This is the "keep your models swappable" point from lesson 5.
]

// GLM-5.3-REVIEW: one-day SaaSpocalypse bars - Thomson Reuters -18%, RELX
// and Wolters Kluwer >-10%: the market pricing landlord risk in a session.
// GLM-5.3-REVIEW (optional case): Scale AI - Meta's $14.3B for 49%, then
// Google and OpenAI walked; "neutrality was the product". The best L1/L2
// case not in the deck.
== When the lab ships your feature

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.6em,
  align: top,
  shot(
    "N09",
    [ChatGPT file upload kills chat-with-PDF apps],
    path: "/figures/news/N09-chatgpt-pdf-upload.png",
    url: "https://techcrunch.com/2023/11/06/get-the-pdf-outta-here/",
    width: 7.8cm,
  ),
  shot(
    "N10",
    [Jasper after ChatGPT],
    path: "/figures/news/N10-jasper-valuation.png",
    url: "https://www.theinformation.com/articles/jasper-an-early-generative-ai-winner-cuts-internal-valuation-as-growth-slows",
    width: 7.8cm,
  ),
  shot(
    "N11",
    [SaaSpocalypse: Thomson Reuters #sym.minus;18%, Feb 2026],
    path: "/figures/news/N11-thomson-reuters-saaspocalypse.png",
    url: "https://finance.yahoo.com/news/anthropics-ai-tools-deepen-selloff-054551832.html",
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
