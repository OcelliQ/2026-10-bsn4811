#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/annotation-brace.typ": annotation-brace
#import "/figures/layer-stack.typ": *

= The Gold Rush

== Global AI infrastructure spending forecast for 2026#cite-source("https://www.gartner.com/en/newsroom/press-releases/2026-09-16-gartner-forecasts-worldwide-ai-spending-to-grow-49-point-5-percent-in-2026")[Gartner. _Worldwide AI Spending Forecast_. 16 September 2026. AI infrastructure: US\$1.484 trillion forecast for 2026.]

// Headline lifted from ai-for-clm 01-intro/chapter/01-industry-landscape.typ.
// Each comparison is its cost (2025 US$) over 2026 AI infrastructure spending
// of US$1.48T a year, about US$4.05B a day.
// Only Apollo's source states 2025 dollars. The US figures are inflated with
// CPI-U at a mid-programme year: Manhattan $1.89B (x18.3, 1944); Interstate
// $128.9B total (x5.98, 1975). Singapore figures use S$1.30/US$: Changi T5
// S$12.96B (trade-press estimate, incl. Changi East works), TEL "over S$25B"
// (2020 estimate), GDP S$789.5B (2025, nominal).
// China: Three Gorges CNY 184.9B official final cost (Xinhua, Sept 2009) at
// the 2002 peg of 8.28/US$ = $22.3B, x1.79 (2002) = $39.9B; cross-check,
// Xinhua's own $27.19B x1.50 (2009) = $40.8B. Critics put the true cost far
// higher (Dai Qing: up to CNY 600B). Big Fund III CNY 344B ($47.5B) is
// registered capital, not money spent; x1.026 (2024) = $48.7B.
// CPI-U annual averages (1944 17.6, 1975 53.8, 2002 179.9, 2009 214.5, 2024
// 313.7, 2025 321.9) are from the Minneapolis Fed's CPI 1913- table; BLS has
// no October 2025 value (government shutdown), so the 2025 average covers 11
// months.
// VERIFY: Three Gorges is cited via Probe International; the Xinhua/China
// Daily original (chinadaily.com.cn .../2009-09/14/content_8687672.htm) 404s.
// Big Fund III cites Reuters via Investing.com; reuters.com URL unknown.
#slide(align: top, config: config-common(breakable: false))[
  #let row(time, project, cost) = (
    text(size: 20pt, weight: "bold")[#blank(2, time)],
    text(size: 20pt)[#project],
    text(size: 16pt, fill: luma(110))[US\$#cost],
  )
  #v(1fr)
  #lblock(center: true)[
    #text(size: 72pt, weight: "bold")[US\$1.48T]
    #text(size: 36pt)[≈ US\$4 billion/day]
  ]
  #v(1fr)
  #align(center, grid(
    columns: (5em, auto, auto),
    column-gutter: 0.8em,
    row-gutter: 0.5em,
    align: (right + horizon, left + horizon, right + horizon),
    ..row(
      [2½ days],
      [Changi Terminal 5#cite-source("https://www.airport-technology.com/projects/terminal-5-changi-international-airport/")[Airport Technology. _Terminal 5, Changi International Airport, Singapore_. About S\$12.96 billion (US\$10 billion), including Changi East works; trade-press estimate.]],
      [10B],
    ),
    ..row(
      [5 days],
      [Thomson--East Coast Line#cite-source("https://www.mot.gov.sg/news-resources/newsroom/speech-by-minister-khaw-boon-wan-at-the-thomson-east-coast-line-stage-1-open-house/")[Ministry of Transport, Singapore. _Speech by Minister Khaw Boon Wan at the Thomson-East Coast Line Stage 1 Open House_. 11 January 2020. "Over \$25 billion to construct."]],
      [19B],
    ),
    ..row(
      [9 days],
      [Manhattan Project#cite-source("https://www.brookings.edu/the-costs-of-the-manhattan-project/")[Brookings Institution. _The Costs of the Manhattan Project_. US\$1.89 billion through 1945.]],
      [35B],
    ),
    ..row(
      [10 days],
      [Three Gorges Dam#cite-source("https://journal.probeinternational.org/2009/09/18/the-chinese-government-is-not-telling-the-whole-truth-about-the-cost-of-the-three-gorges-dam")[Probe International. _The Chinese government is not telling the whole truth about the cost of the Three Gorges dam_. 18 September 2009. Reports Xinhua's official figure: 184.9 billion yuan (US\$27.19 billion).]],
      [40B],
    ),
    ..row(
      [12 days],
      [China's chip fund (Big Fund III)#cite-source("https://investing.com/news/stock-market-news/china-sets-up-475-billion-state-fund-to-boost-semiconductor-industry-3457524")[Reuters. _China sets up third fund with \$47.5 billion to boost semiconductor sector_. 26 May 2024. Registered capital of 344 billion yuan (US\$47.5 billion).]],
      [49B],
    ),
    ..row(
      [2½ months],
      [Apollo missions#cite-source("https://www.planetary.org/space-policy/cost-of-apollo")[The Planetary Society. _The Cost of Apollo_. US\$25.8 billion, 1960--1973; about US\$309 billion in 2025 dollars.]],
      [309B],
    ),
    ..row(
      [5 months],
      [Singapore's GDP#cite-source("https://isomer-user-content.by.gov.sg/166/b0da590f-0637-47b2-85a7-583a6135c72c/FullReport_AES2025.pdf")[Ministry of Trade and Industry, Singapore. _Economic Survey of Singapore 2025_. GDP at current market prices: S\$789.5 billion in 2025.]],
      [607B],
    ),
    ..row(
      [6 months],
      [US Interstate highways#cite-source("https://www.fhwa.dot.gov/infrastructure/50estimate.cfm")[Federal Highway Administration. _Interstate System Final Cost Estimate_. 1991: US\$128.9 billion total, US\$114.3 billion federal share.]],
      [770B],
    ),
  ))

  #v(1fr)
  #align(right)[\*All rough estimates, in 2025 US dollars]
]

#speaker-note[
  Gartner's figure is all AI infrastructure (servers, devices, datacentres), not datacentre construction alone. Each comparison is a whole-programme total; the AI figure is one year. Scale, not precision.
]


== The question for today

#focus-slide[
  #text(size: 72pt, weight: "bold")[
    Who earns that \
    *US\$1.48 trillion*?
  ]
]

#speaker-note[
  Leave this open. We answer it at the end, layer by layer.
]


// Lifted from the ai-for-clm "Who Controls What in AI" slide
// (01-intro/chapter/01-industry-landscape.typ), redrawn on the value-chain
// layers over two slides: legal pressure and physical inputs on the left, then
// the companies in each layer on the right.
#let legal-red = rgb("#c62828")
#let brace = block(width: 100%, height: 100%, spacing: 0pt)[
  #layout(size => annotation-brace(size.height, "#5a5a5a"))
]
// Vertically integrated companies, one brace per span of layers (row 0 is
// Apps, row 3 is Chips): (top row, bottom row, companies).
// VERIFY: each company's span before the lecture; this moves fast.
#let integrated = (
  // Chips to Apps: own accelerators, cloud, models and consumer apps.
  (
    0,
    3,
    (
      "Google",
      "Amazon",
      "Microsoft",
      "Meta",
      "Apple",
      "Alibaba",
      "Huawei",
      "Baidu",
    ),
  ),
  // Infra to Apps: own data centres; OpenAI's Broadcom chip isn't out yet.
  (0, 2, ("OpenAI", "xAI")),
)

// Companies beside each layer in column 1, then one brace and name list per
// integrated span in columns 2 onwards.
#let company-cells = (
  ..stack-layers
    .enumerate()
    .map(((i, (.., marks))) => grid.cell(
      x: 1,
      y: i,
      align: left + horizon,
    )[
      #set par(spacing: 0pt)
      #text(size: 16pt, fill: black)[#marks.map(box).join(" · ")]
    ]),
  // Beside bedrock: fab equipment makers; ASML is the sole maker of EUV
  // lithography scanners.
  grid.cell(x: 1, y: n-layers, align: left + horizon)[
    #text(size: 16pt, fill: black)[#(
      ("ASML", "Applied Materials", "Tokyo Electron", "Lam Research")
        .map(box)
        .join(" · ")
    )]
  ],
  ..integrated
    .enumerate()
    .map(((k, (top, bottom, names))) => (
      grid.cell(x: 2 + 2 * k, y: top, rowspan: bottom - top + 1, brace),
      grid.cell(
        x: 3 + 2 * k,
        y: top,
        rowspan: bottom - top + 1,
        align: left + horizon,
      )[
        #set par(spacing: 0pt)
        #text(size: 16pt, fill: black)[#names.map(box).join(linebreak())]
      ],
    ))
    .flatten(),
)

// columns: the widths after the stack, which takes 30% of the slide.
#let layer-grid(columns, ..cells) = {
  set text(size: 18pt)
  v(10pt)
  grid(
    columns: (30%,) + columns,
    rows: (1fr,) * n-layers + (0.5fr,),
    column-gutter: 12pt,
    row-gutter: 4pt,
    align: top,
    stack-cell,
    bedrock-cell,
    ..cells,
  )
}

== The AI Value Chain

#slide(align: top, config: config-common(breakable: false))[
  #cite-source(
    "https://a16z.com/emerging-architectures-for-llm-applications/",
    display: false,
  )[Andreessen Horowitz. _Emerging Architectures for LLM Applications_.]
  #cite-source(
    "https://blogs.nvidia.com/blog/ai-5-layer-cake/",
    display: false,
  )[NVIDIA. _AI's five-layer cake_.]

  #layer-grid(
    (1fr,),
    grid.cell(x: 1, y: 0, align: left + horizon)[
      #text(size: 24pt)[*#sym.arrow.l You are here*]
    ],
  )
]

#speaker-note[
  Same stack, seen from the app builder's chair. You control the top. Everything at the bottom is someone else's business, and their business model becomes your cost structure.
]

== The AI Value Chain

#slide(align: top, config: config-common(breakable: false))[
  #layer-grid(
    (33%,) + (16pt, auto) * integrated.len(),
    ..company-cells,
  )
]
