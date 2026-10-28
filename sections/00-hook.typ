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
// China: Reuters' September 2009 report gives Three Gorges including
// resettlement at US$37.23B; x1.50 (2009 -> 2025 CPI-U) = about US$56B.
// Big Fund III CNY 344B ($47.5B) is
// registered capital, not money spent; x1.026 (2024) = $48.7B.
// CPI-U annual averages (1944 17.6, 1975 53.8, 2002 179.9, 2009 214.5, 2024
// 313.7, 2025 321.9) are from the Minneapolis Fed's CPI 1913- table; BLS has
// no October 2025 value (government shutdown), so the 2025 average covers 11
// months.
// Reuters syndications are identified as such. Big Fund III is registered
// capital; GDP is an annual flow. Neither is a completed construction cost.
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
      [2\u{bd} days],
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
      [12 days],
      [China's chip fund (Big Fund III)#cite-source("https://investing.com/news/stock-market-news/china-sets-up-475-billion-state-fund-to-boost-semiconductor-industry-3457524")[Reuters. _China sets up third fund with \$47.5 billion to boost semiconductor sector_. 26 May 2024. Registered capital of 344 billion yuan (US\$47.5 billion).]],
      [49B],
    ),
    ..row(
      [14 days],
      [Three Gorges Dam#cite-source("https://www.thestar.com.my/news/world/2009/09/14/china-says-three-gorges-dam-cost-37-billion")[Reuters, syndicated by The Star. _China says Three Gorges Dam cost \$37 billion_. 14 September 2009. US\$37.23B including resettlement, citing Xinhua; about US\$56B at 2025 US CPI-U.]],
      [56B],
    ),
    ..row(
      [2\u{bd} months],
      [Apollo missions#cite-source("https://www.planetary.org/space-policy/cost-of-apollo")[The Planetary Society. _The Cost of Apollo_. US\$25.8 billion, 1960--1973; about US\$309 billion in 2025 dollars.]],
      [309B],
    ),
    ..row(
      [5 months],
      [Singapore's GDP#cite-source("https://www.singstat.gov.sg/find-data/get-latest-data")[Singapore Department of Statistics. _Latest Data_. GDP at current market prices: S\$789,529.2 million in 2025, checked 18 October 2026; about US\$607B at the illustrative S\$1.30/US\$ exchange rate.]],
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

  These are spending-equivalent comparisons, not like-for-like investments. The chip fund is subscribed capital, Singapore GDP is one year's output, and Changi T5 is a trade-press estimate that includes Changi East works. The interstate conversion uses a representative 1975 CPI year for multi-decade spending; it is a rough scale comparison rather than a year-by-year inflation reconstruction.
  #cite-source(
    "https://www.minneapolisfed.org/about-us/monetary-policy/inflation-calculator/consumer-price-index-1913-",
    display: false,
  )[Federal Reserve Bank of Minneapolis. _Consumer Price Index, 1913--_. Annual US CPI-U values used for approximate 2025-dollar conversions.]
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
// Participation includes in-house chip design and owned or contracted
// compute capacity; it does not mean each company sells a public cloud.
#let integrated = (
  // Companies participating across the value chain.
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
      "OpenAI",
      "SpaceXSI",
    ),
  ),
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
    (33%,) + (16pt, auto) * integrated.len() + (1fr,),
    ..company-cells,
    grid.cell(
      x: 2 + 2 * integrated.len(),
      y: 0,
      rowspan: n-layers,
      align: left + horizon,
    )[
      #pause
      #pad(left: 16pt)[
        #text(size: 22pt, weight: "bold", fill: accent)[Why do so many companies compete across multiple layers?]
      ]
    ],
  )
]

#speaker-note[
  The braces show participation across layers, including in-house hardware and leased capacity, not ownership of every input or a public cloud business. OpenAI's announced Broadcom programme includes accelerator design, with deployment targeted from the second half of 2026 through 2029; this is not proof its own chips are already operating at scale.
  #cite-source(
    "https://openai.com/index/openai-and-broadcom-announce-strategic-collaboration/",
    display: false,
  )[OpenAI and Broadcom. _Strategic collaboration to deploy 10 gigawatts of OpenAI-designed AI accelerators_. 13 October 2025. Announced programme; deployment targeted from H2 2026 through 2029.]
]
