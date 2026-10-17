#import "/common.typ": *
#import "/citations.typ": cite-source

= The Gold Rush

== Gold Rush of our age

// Headline lifted from ai-for-clm 01-intro/chapter/01-industry-landscape.typ.
// Each comparison is its cost (2025 US$) over 2026 AI infrastructure spending
// of US$1.48T a year, about US$4.05B a day.
// Only Apollo's source states 2025 dollars. The US figures are inflated with
// CPI-U at a mid-programme year: Hoover Dam $108.8M dam + powerplant (x21.2,
// 1931); Manhattan $1.89B (x18.3, 1944); Interstate $128.9B total (x5.98,
// 1975). Singapore figures use S$1.30/US$: Changi T5 S$12.96B (trade-press
// estimate, incl. Changi East works), TEL "over S$25B" (2020 estimate), GDP S$789.5B (2025, nominal).
// CPI-U annual averages (1931 15.2, 1944 17.6, 1975 53.8, 2025 321.9) are
// from the Minneapolis Fed's CPI 1913- table; BLS has no October 2025 value
// (government shutdown), so the 2025 average covers 11 months.
#slide(align: top, config: config-common(breakable: false))[
  #let row(time, project, cost) = (
    text(size: 20pt, weight: "bold")[#blank(2, time)],
    text(size: 20pt)[#project],
    text(size: 16pt, fill: luma(110))[US\$#cost],
  )
  #v(1fr)
  #grid(
    columns: (0.8fr, 1.2fr),
    column-gutter: 1.5em,
    align: (left + horizon, left + horizon),
    [
      *Global AI infrastructure spending forecast for 2026*#cite-source("https://www.gartner.com/en/newsroom/press-releases/2026-09-16-gartner-forecasts-worldwide-ai-spending-to-grow-49-point-5-percent-in-2026")[Gartner. _Worldwide AI Spending Forecast_. 16 September 2026. AI infrastructure: US\$1.484 trillion forecast for 2026.]

      #text(size: 72pt, weight: "bold")[US\$1.48T]

      #text(size: 36pt)[≈ US\$4 billion/day]
    ],
    [
      AI spends the cost of …
      #v(0.3em)
      #grid(
        columns: (5em, auto, auto),
        column-gutter: 0.8em,
        row-gutter: 0.5em,
        align: (right + horizon, left + horizon, right + horizon),
        ..row(
          [14 hours],
          [Hoover Dam#cite-source("https://www.usbr.gov/lc/hooverdam/faqs/damfaqs.html")[US Bureau of Reclamation. _Hoover Dam FAQs_. Boulder Canyon Project authorised at up to US\$165 million, of which dam and reservoir US\$70.6 million and power US\$38.2 million.]],
          [2.3B],
        ),
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
      )
    ],
  )

  #v(1fr)
  #align(right)[\*All rough estimates, in 2025 US dollars]
]

#speaker-note[
  Gartner's figure is all AI infrastructure (servers, devices, datacentres), not datacentre construction alone. Each comparison is a whole-programme total; the AI figure is one year. Scale, not precision.
]

== Here's an NVIDIA B200

#slide(config: config-common(breakable: false))[
  #grid(
    columns: (11cm, 1fr),
    rows: (1fr,),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "N01",
      [NVIDIA B200 product photo],
      path: "/figures/news/N01-nvidia-b200.png",
      url: "https://nvidianews.nvidia.com/news/nvidia-blackwell-platform-arrives-to-power-a-new-era-of-computing",
      width: 11cm,
      height: 100%,
    ),
    [
      To keep up with *one* B200, you'd need #blank(2)[*about a million Earths*] of people, each doing one sum per second.

      A large datacentre has #blank(2)[*220,000+* (Colossus 1, 300 MW)] of them.

      A frontier model trains on #blank(2)[*\~100,000*] of them for #blank(2)[*a few months*], continuously.
    ],
  )
]

// VERIFY: B200 throughput. The "million Earths" line assumes ~10^16 low-
// precision (FP4, dense) operations a second and 8.2 billion people. Check
// NVIDIA's B200 datasheet; FP8 dense is about half that (~500k Earths).
// VERIFY: Colossus 1 at >220,000 GPUs and >300 MW, per Anthropic's SpaceX
// compute announcement (anthropic.com/news/higher-limits-spacex, May 2026).
// Note that Colossus 1 is not all B200s.
// VERIFY: frontier training-run size and duration. Labs do not publish this;
// cite an Epoch AI estimate for a recent frontier run.
#speaker-note[
  Ask the room to guess each blank before revealing it.
  - 10^16 operations a second / 8.2 billion people at one sum a second each ≈ 1.2 million Earths.
  - Colossus 1: the Memphis site Anthropic now rents from SpaceX.
  - Training runs: estimates only, from Epoch AI.
]

== A rack of 72 costs \~\$3M

// VERIFY: rack price. NVIDIA publishes no list price; these are analyst
// estimates. Wing VC's piece now leads with GB300 NVL72 (just under $5.0M,
// ~$3.4M of it the 72 GPU modules), not GB200, so re-check which figure it
// backs. DeployBase gives $60--70K per GB200 superchip.
// VERIFY: photo source and whether it shows GB200 NVL72 racks.
#slide(config: config-common(breakable: false))[
  #let money(body) = text(weight: "bold")[#body]
  #grid(
    columns: (13cm, 1fr),
    rows: (1fr,),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "P01",
      [CoreWeave datacentre],
      path: "/figures/photos/coreweave-datacentre.jpg",
      width: 13cm,
      height: 100%,
    ),
    [
      *GB200 NVL72*: 72 Blackwell GPUs and 36 Grace CPUs in one liquid-cooled rack

      #v(0.4em)
      #set text(size: 18pt)
      #table(
        columns: (1fr, auto),
        stroke: none,
        inset: (x: 0pt, y: 0.35em),
        align: (left, right),
        table.hline(stroke: 0.6pt + luma(160)),
        [36 × GB200 superchips#cite-source("https://deploybase.ai/articles/nvidia-gb200-nvl72")[DeployBase. _NVIDIA GB200 NVL72_. About US\$60--70K per GB200 superchip.]],
        [\~\$2.2--2.5M],
        [NVLink switches, backplane, cooling, power, networking#cite-source("https://newsletter.semianalysis.com/p/gb200-hardware-architecture-and-component")[SemiAnalysis. _GB200 Hardware Architecture and Component Supply Chain & BOM_. July 2024.]],
        [\~\$0.4--0.8M],
        table.hline(stroke: 0.6pt + luma(160)),
        money[Rack total#cite-source("https://www.wing.vc/content/how-much-does-an-nvidia-nvl72-cost")[Wing VC. _How Much Does an NVIDIA NVL72 Cost?_]],
        money[\~\$3.0--3.5M],
        text(fill: luma(110))[Smaller buyers], text(fill: luma(110))[up to \~\$3.9M],
        text(fill: luma(110))[Deployed, with datacentre], text(fill: luma(110))[\$4M+],
      )
    ],
  )
]

#speaker-note[
  NVIDIA doesn't publish list prices; these are analyst estimates.
  - Compute is the bulk: each GB200 superchip (two Blackwell GPUs, one Grace CPU) is about \$60--70K.
  - Hyperscalers and neoclouds (CoreWeave, Microsoft, Meta) buy thousands of racks and pay near the low end.
  - The rack draws 120--132 kW, so it needs a liquid-cooled hall, InfiniBand or Ethernet to other racks, and storage. Deployed, it's often well above \$4M.
  - Renting: GMI Cloud lists GB200 from \$8 per GPU-hour, about \$420K a month for a full rack running continuously.
  #cite-source(
    "https://www.gmicloud.ai/en/blog/gb200-nvl72-rental-price-reserve-vs-on-demand",
    display: false,
  )[GMI Cloud. _GB200 NVL72 Rental Price: Reserve vs On-Demand_. From US\$8.00 per GPU-hour.]
]

== The question for today

#focus-slide[
  Who earns back \
  *US\$1.48 trillion* a year?
]

#speaker-note[
  Leave this open. We answer it at the end, layer by layer.
]
