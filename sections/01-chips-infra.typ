#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/annotation-brace.typ": annotation-brace
#import "/figures/oracle-cliff.typ": oracle-cliff

= Value Chain: Chips

#section-subtitle[AI Value Chain]

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
      At peak low-precision throughput, *one* B200 matches #blank(2)[*about a million Earths'*] people doing one operation per second.#cite-source("https://www.nvidia.com/en-us/data-center/hgx/")[NVIDIA. _HGX B200 specifications_. Eight GPUs provide 72 PFLOPS dense FP4; 9 × 10^15 operations/s per GPU divided by 8.2B people is about 1.1M Earth populations. Theoretical arithmetic, not sustained application throughput.]

      Colossus 1 has #blank(2)[*220,000+ NVIDIA GPUs*] across GPU generations, and over *300 MW* of capacity.#cite-source("https://www.anthropic.com/news/higher-limits-spacex")[Anthropic. _Higher usage limits and a SpaceX compute deal_. May 2026. Colossus 1: more than 220,000 NVIDIA GPUs and 300 MW; not all B200s.]

      Example: Grok 3's cluster had #blank(2)[*\~100,000 H100s*]; its training run took an estimated #blank(2)[*\~3 months*].#cite-source("https://epoch.ai/data-insights/longest-training-run")[Epoch AI. _Frontier LLM training runs can't get much longer_. 25 July 2025. Grok-3 training duration estimated at 2.96 months; cluster capacity is not continuous occupied capacity.]
    ],
  )
]

#speaker-note[
  Ask the room to guess each blank before revealing it.
  - The HGX B200 dense FP4 figure is 72 PFLOPS for eight GPUs: 9 PFLOPS per GPU, about 1.1 million Earth populations at one operation/s each. FP8 dense is half that. These are theoretical arithmetic rates at specific precision.
  - Colossus 1: the Memphis site Anthropic now rents from SpaceX.
  - Grok 3 is a historical example, not a universal frontier training recipe.
  #cite-source("https://epoch.ai/gradient-updates/compute-scaling-will-slow-down-due-to-increasing-lead-times", display: false)[Epoch AI. _Compute scaling will slow down due to increasing lead times_. Grok 3 required building Colossus with over 100,000 H100 GPUs.]
]

== A rack of 72 costs \~\$3M (estimate)

// Illustrative existing datacentre photo; rack models and operator are not
// independently identified. GB200 prices are external estimates, not NVIDIA
// list prices. Wing's newer ~US$5M GB300 estimate must not be applied to GB200.
#slide(config: config-common(breakable: false))[
  #let money(body) = text(weight: "bold")[#body]
  #grid(
    columns: (16cm, 1fr),
    rows: (1fr,),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "P01",
      [Illustrative datacentre photo; rack models unidentified],
      path: "/figures/photos/coreweave-datacentre.jpg",
      width: 16cm,
      height: 100%,
    ),
    [
      *GB200 NVL72*: 72 Blackwell GPUs and 36 Grace CPUs in one liquid-cooled rack

      #v(0.4em)
      #table(
        columns: (1fr, auto),
        stroke: none,
        inset: (x: 0pt, y: 0.35em),
        align: (left, right),
        table.hline(stroke: 0.6pt + luma(160)),
        [Compute#cite-source("https://www.nvidia.com/en-us/data-center/gb200-nvl72/")[NVIDIA. _GB200 NVL72_. 36 Grace CPUs and 72 Blackwell GPUs; 36 superchips with two GPUs and one CPU each.]],
        [36 GB200 superchips],
        [Cooling, power, interconnect],
        [Integrated rack hardware],
        table.hline(stroke: 0.6pt + luma(160)),
        money[Rack total#cite-source("https://www.wing.vc/content/how-much-does-an-nvidia-nvl72-cost")[Wing VC. _How Much Does an NVIDIA NVL72 Cost?_]],
        money[\~\$2.8--3.4M],
      )
    ],
  )
]

#speaker-note[
  NVIDIA doesn't publish list prices; these are analyst estimates.
  - Each GB200 superchip contains two Blackwell GPUs and one Grace CPU. The slide uses an estimated whole-rack price, not an unverified component-price breakdown.
  - Facility construction, external networking, storage, power and operating costs are additional. The photograph is illustrative; it does not establish a particular rack model or operator.
  - Renting: GMI Cloud lists GB200 from \$8 per GPU-hour, about \$420K a month for a full rack running continuously.
  #cite-source(
    "https://www.gmicloud.ai/en/blog/gb200-nvl72-rental-price-reserve-vs-on-demand",
    display: false,
  )[GMI Cloud. _GB200 NVL72 Rental Price: Reserve vs On-Demand_. From US\$8.00 per GPU-hour.]
]

== NVIDIA's data centre sales dwarf these rivals

// Latest quarter, as reported. Not like-for-like: NVIDIA's data centre and
// Broadcom's AI figures include networking; AMD's data centre segment includes
// EPYC CPUs; Marvell's data centre includes networking. Quarters end Jul 2026
// (NVIDIA), Aug 2026 (Broadcom, Marvell), Jun 2026 (AMD, Cerebras).
// Huawei is a reported annual forecast divided by four, not quarterly sales.
// This selection is not a complete or like-for-like accelerator market.
#slide(config: config-common(breakable: false))[
  // Stacked bar, top to bottom. Labels sit beside their segment and get
  // pushed down (with a leader line) when a segment is too thin to hold one.
  #let companies = (
    (
      name: "Others",
      rev: "2.4",
      fill: luma(225),
      note: [Marvell \$2.2B (custom chips, networking); Cerebras \$0.2B.],
      src: [#cite-source(
          "https://investor.marvell.com/news-events/press-releases/detail/1031/marvell-technology-inc-reports-second-quarter-of-fiscal-year-2027-financial-results",
        )[Marvell. _Marvell Technology, Inc. Reports Second Quarter of Fiscal Year 2027 Financial Results_. Data Center revenue of US\$2,171.5 million, quarter ended 1 August 2026.]#super[,]#cite-source(
          "https://www.sec.gov/Archives/edgar/data/0002021728/000162828026056186/cbrsannouncesfinancialresu.htm",
        )[Cerebras. _Cerebras Announces Financial Results for Second Quarter 2026_. GAAP total revenue of US\$180.1 million, quarter ended 30 June 2026.]],
    ),
    (
      name: "Huawei",
      rev: "3.0",
      fill: luma(210),
      note: [Estimate: a quarter of the \$12B it expects for 2026.],
      src: cite-source(
        "https://www.indexbox.io/blog/huawei-expects-ai-chip-revenue-to-hit-12-billion-in-2026/",
      )[IndexBox, citing the Financial Times. Huawei expects about US\$12 billion of AI chip revenue in 2026, up from US\$7.5 billion in 2025. 2 May 2026.],
    ),
    (
      name: "AMD",
      rev: "6.7",
      fill: luma(195),
      note: [Whole data centre segment, including EPYC server CPUs.],
      src: cite-source(
        "https://ir.amd.com/news-events/press-releases/detail/1295/amd-reports-second-quarter-2026-financial-results",
      )[AMD. _AMD Reports Second Quarter 2026 Financial Results_. Data Center segment revenue of US\$6.7 billion.],
    ),
    (
      name: "Broadcom",
      rev: "16.7",
      fill: luma(150),
      note: [Custom chips for Google (TPU), Meta, OpenAI; plus networking.],
      src: cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001730168/000173016826000076/avgo-08022026x8kxex99.htm",
      )[Broadcom. _Broadcom Inc. Announces Third Quarter Fiscal Year 2026 Financial Results_. AI semiconductor revenue of US\$16.7 billion, quarter ended 2 August 2026.],
    ),
    (
      name: "NVIDIA",
      rev: "89.0",
      fill: accent,
      share-inside: true,
      note: [Data centre: GPUs and networking. Up 117% on a year ago.],
      src: cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001045810/000104581026000073/q2fy27pr.htm",
      )[NVIDIA. _NVIDIA Announces Financial Results for Second Quarter Fiscal 2027_. Data Center revenue of US\$89.0 billion, quarter ended 26 July 2026.],
    ),
  )
  #let bar-width = 2.2cm
  #let label-x = bar-width + 0.9cm
  #let total = companies.map(c => float(c.rev)).sum()
  // Fills whatever height the grid cell gives it.
  #let chart = layout(size => {
    let chart-height = size.height
    // Packed tight so the thin segments stack near the top and NVIDIA's
    // label can sit level with its segment.
    let label-height = 1.3cm
    let top = 0cm
    let label-top = 0cm
    for c in companies {
      let seg = chart-height * float(c.rev) / total
      let share = [#calc.round(float(c.rev) / total * 100)%]
      let mid = top + seg / 2
      let y = calc.max(mid - label-height / 2, label-top)
      place(dy: top, box(
        width: bar-width,
        height: seg,
        fill: c.fill,
        stroke: 1pt + white,
      ))
      place(line(
        start: (bar-width + 0.1cm, mid),
        end: (label-x - 0.15cm, y + label-height / 2),
        stroke: 0.6pt + luma(160),
      ))
      place(dx: label-x, dy: y, block(
        width: 100% - label-x,
        height: label-height,
        // Tight stack, centred in the label slot, so the slack falls
        // between labels rather than between a title and its note.
        align(horizon, stack(
          spacing: 0.25em,
          [
            *#c.name*#c.src #h(0.3em) *\$#(c.rev)B*
            #if not c.at("share-inside", default: false) [
              #h(0.2em)#text(fill: luma(110))[(#share)]
            ]
          ],
          text(size: 0.6em, fill: luma(110))[#c.note],
        )),
      ))
      if c.at("share-inside", default: false) {
        place(dy: mid - 0.5em, box(
          width: bar-width,
          align(center, text(fill: white, weight: "bold")[#share]),
        ))
      }
      top += seg
      label-top = y + label-height
    }
  })
  #grid(
    columns: (1.25fr, 1fr),
    rows: (1fr,),
    column-gutter: 1.4em,
    align: horizon,
    block(width: 100%, height: 100%, inset: (y: 0.4em), align(
      top + left,
      chart,
    )),
    [
      *Big tech's own chips*
      - Google TPU, AWS Trainium, Microsoft Maia, Meta MTIA
      - Mostly used in-house; their makers are still NVIDIA's biggest customers

      *New Entrants*
      - Cerebras, Taalas
      - Huawei Ascend

      NVIDIA's biggest competitors are their own customers making custom chips.

    ],
  )
]

#speaker-note[
  Not like-for-like: NVIDIA and Broadcom include networking, AMD includes CPUs, and the quarters end in different months.
  - The figures are selected reported segments plus a Huawei forecast proxy, not measured market share. Do not infer a 75--80% accelerator share from this chart.
  - The threat isn't a rival GPU. It's NVIDIA's customers (Google, Amazon, Microsoft, Meta) designing their own chips, often with Broadcom.
  - Hold that thought for section 4: your supplier is your competitor.
]

= Value Chain: Infrastructure

#section-subtitle[AI Value Chain]


// Photos are company press images; see figures/photos/SOURCES.md. Power:
// Abilene 1.2 GW (Epoch AI); Hyperion 2 GW by 2030, 5 GW later (Meta);
// Fairwater's power is not disclosed. Rainier's photograph does not establish
// the capacity of a particular building or the whole project.
// Amazon's Rainier article supplies the generically captioned exterior photo.
// It is an illustration, not proof of a particular building's identity.
#slide(config: config-common(breakable: false))[
  #let site(path, name, note) = block(
    width: 100%,
    height: 100%,
    spacing: 0pt,
    grid(
      rows: (1fr, auto),
      row-gutter: 0.25em,
      block(
        width: 100%,
        height: 100%,
        clip: true,
        radius: 3pt,
        image(path, width: 100%, height: 100%, fit: "cover"),
      ),
      text(size: 0.7em)[*#name* #h(0.3em) #text(fill: luma(100))[#note]],
    ),
  )
  #grid(
    columns: (1fr, 1fr),
    rows: (1fr, 1fr),
    column-gutter: 0.8em,
    row-gutter: 0.6em,
    site(
      "/figures/photos/stargate-abilene-aerial.jpg",
      [Stargate, Abilene TX],
      [OpenAI on Oracle; 1.2 GW#cite-source("https://epoch.ai/blog/openai-stargate-where-the-us-sites-stand")[Epoch AI. _OpenAI's Stargate: where the US sites stand_. 17 April 2026. Abilene: 1.2 GW across eight buildings. Photo: Oracle, Abilene Campus Media Kit.]],
    ),
    site(
      "/figures/photos/meta-hyperion-richland-parish-rendering.jpg",
      [Hyperion, Louisiana],
      [Meta (rendering); 2 GW, then 5#cite-source("https://investor.atmeta.com/investor-news/press-release-details/2025/Meta-Announces-Joint-Venture-with-Funds-Managed-by-Blue-Owl-Capital-to-Develop-Hyperion-Data-Center/default.aspx")[Meta. _Meta Announces Joint Venture with Funds Managed by Blue Owl Capital to Develop Hyperion Data Center_. Rendering: Meta, datacenters.atmeta.com.]],
    ),

    site(
      "/figures/photos/amazon-project-rainier-new-carlisle.jpg",
      [Project Rainier, Indiana],
      [Amazon for Anthropic; illustrative AWS exterior#cite-source("https://www.aboutamazon.com/news/aws/aws-project-rainier-ai-trainium-chips-compute-cluster")[Amazon. _AWS Project Rainier_. AWS datacentre exterior published with the Rainier article; caption alone does not identify a specific building.]],
    ),
    site(
      "/figures/photos/microsoft-fairwater-mount-pleasant-aerial.jpg",
      [Fairwater, Wisconsin],
      [Microsoft; power undisclosed#cite-source("https://blogs.microsoft.com/blog/2025/09/18/inside-the-worlds-most-powerful-ai-datacenter/")[Microsoft. _Inside the world's most powerful AI datacenter_. 18 September 2025. Photo: Microsoft.]],
    ),
  )
]

#speaker-note[
  A gigawatt is roughly the output of one large power station. Each of these campuses needs its own.
  - The projects require substantial power-generation and grid investment. The quoted capacities are plans or design capacities, not measurements of present electricity use.
  - Several separate the model provider from the infrastructure owner or financing partner: Oracle capacity for OpenAI, Blue Owl's joint venture with Meta, and AWS capacity for Anthropic. Microsoft's own campus is a different case.
]


== Here's xAI's Colossus

// Photo: Steve Jones for SELC; copyrighted, no reuse licence stated (see
// figures/photos/SOURCES.md). The generators along the right are on-site power.
// Colossus 1 + 2 "approximately 1.0 gigawatt" and the Anthropic terms are from
// the SpaceX S-1/A (xAI merged into SpaceX on 2 Feb 2026). 122 days for
// Colossus 1 is xAI's own claim, widely reported.
#slide(config: config-common(breakable: false))[
  #grid(
    columns: (14cm, 1fr),
    rows: (1fr,),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "P02",
      [xAI Colossus, Memphis],
      path: "/figures/photos/xai-colossus-memphis-aerial.jpg",
      url: "https://www.selc.org/news/inside-memphis-fight-against-xai/",
      width: 14cm,
      height: 100%,
    ),
    [
      Colossus 1 went from empty factory to running in *122 days*, according to xAI.#cite-source("https://x.ai/colossus")[xAI. _Colossus_. Company account of the initial 122-day build and later expansion to 200,000 GPUs.]

      Colossus 1 + 2 provide *\~1 GW of compute capacity*:\
      as much as all homes in Singapore#cite-source("https://www.ema.gov.sg/singapore-energy-statistics/Ch03/index3")[Energy Market Authority. _Singapore Energy Statistics_, chapter 3. Households used about 8 TWh in 2024, 14.6% of total electricity consumption; about 0.9 GW on average.].

      Anthropic's capacity deal costs *\$1.25B a month*, scheduled through May 2029#cite-source("https://legrandcontinent.eu/fr/wp-content/uploads/sites/2/2026/06/Prospectus-SpaceX-compresse.pdf")[SpaceX. _Form S-1_, May 2026, prospectus copy. Colossus I and II provide about 1 GW compute capacity; Anthropic agreements charge US\$1.25B/month through May 2029, with reduced ramp-up fees.], but either side can terminate on *90 days' notice* after an initial three-month period.#cite-source("https://www.theinformation.com/briefings/spacex-discloses-updated-details-anthropic-deal-flags-data-center-water-risks")[Theo Wayt, The Information. _SpaceX Discloses Updated Details of Anthropic Deal, Flags Data Center Water Risks_. 1 June 2026. Amended filing's initial three-month period and subsequent mutual 90-day termination right.]
    ],
  )
]

#speaker-note[
  - Singapore's households used about 8 TWh in 2024, an average of 0.9 GW. The whole country averages about 6.6 GW, with a record peak of 8.2 GW (July 2025).
  - xAI is now part of SpaceX. Its AI business made \$3.2B in 2025, so this one contract is worth about five times that.
  - The last line is the whole section: a building that lasts decades, rented on terms that can end in months.
  - The site runs partly on gas turbines; local groups have sued over turbines running without permits.
]


== Four hyperscalers plan \~\$730B of capex in 2026

// Capex guidance for calendar 2026 as of the June-quarter results (Sep-quarter
// results are due late Oct 2026). Microsoft's ~$175B is after an accounting
// change (buildings 15 -> 25 years) that moves leases off the capex line.
// Capex / operating cash flow is our arithmetic from each filing: latest
// quarter, except Amazon (trailing twelve months). Oracle's capex is its
// fiscal year to May 2027 (Reuters, not an Oracle document).
// Checked 18 Oct 2026, before September-quarter results. The headline sums
// Amazon, Alphabet, Microsoft and Meta using range midpoints; Oracle is extra
// and has a different fiscal-year horizon. Plans cover all company capex,
// including non-AI spending, not just data-centre construction.
#slide(config: config-common(breakable: false))[
  #let row(name, capex, ocf, src) = (
    [*#name*#src],
    capex,
    if ocf >= 100 {
      text(fill: rgb("#c62828"), weight: "bold")[#ocf%]
    } else [#ocf%],
  )
  #grid(
    columns: (1.15fr, 1fr),
    column-gutter: 1.6em,
    align: horizon,
    table(
      columns: (1fr, auto, auto),
      stroke: none,
      inset: (x: 0.3em, y: 0.4em),
      align: (left, right, right),
      table.hline(stroke: 0.6pt + luma(160)),
      [],
      text(size: 0.75em)[*capex plan*],
      text(size: 0.75em)[*capex ÷ cash \ from operations*],
      table.hline(stroke: 0.6pt + luma(160)),
      ..row("Amazon", [\~\$220B], 105, cite-source(
        "https://ir.aboutamazon.com/news-release/news-release-details/2026/Amazon-com-Announces-Second-Quarter-Results/default.aspx?mode=light",
      )[Amazon. _Second Quarter 2026 Results_ (8-K). Q2 purchases of property and equipment US\$54.2B; trailing-twelve-month operating cash flow US\$161.4B.]),
      ..row("Alphabet", [\$195--205B], 115, cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001652044/000165204426000066/googexhibit991q22026.htm",
      )[Alphabet. _Second Quarter 2026 Results_ (8-K). Q2 capex US\$44.9B; operating cash flow US\$39.1B.]),
      ..row("Microsoft", [\~\$175B], 75, cite-source(
        "https://www.microsoft.com/en-us/investor/events/fy-2026/earnings-fy-2026-q4",
      )[Microsoft. _FY26 Q4 earnings call_. 29 July 2026. US\$35.8B cash PP&E plus US\$5.6B finance leases versus US\$55.4B operating cash flow, about 75%. Calendar-2026 capex expectation US\$175B after lease classification changes.]),
      ..row("Meta", [\$130--145B], 98, cite-source(
        "https://investor.atmeta.com/investor-news/press-release-details/2026/Meta-Reports-Second-Quarter-2026-Results/",
      )[Meta. _Meta Reports Second Quarter 2026 Results_. Q2 capex US\$31.1B including finance leases; 2026 guidance US\$130--145B.]),
      ..row("Oracle", [up to \$95B], 123, cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001341439/000119312526389274/orcl-20260831.htm",
      )[Oracle. _Form 10-Q_, quarter ended 31 August 2026. Capex US\$28.5B; operating cash flow US\$23.1B.]),
      table.hline(stroke: 0.6pt + luma(160)),
    ),
    [
      Three of the five spent *more than their operating cash flow* on capex in the periods shown.

      They can borrow and sell shares: Alphabet raised *\$49.6B net* from equity in June, and established a further stock-sale programme.#cite-source("https://www.sec.gov/Archives/edgar/data/0001652044/000165204426000066/googexhibit991q22026.htm")[Alphabet. _Second Quarter 2026 Results_. June equity issues raised US\$49.6B net; a separate at-the-market programme permits up to US\$40B of sales. The earlier US\$80B announcement was proposed financing, not a completed sale.]
    ],
  )
]

#speaker-note[
  The four calendar-2026 plans sum to US\$732.5B at midpoints: 220 + 200 + 175 + 137.5. Oracle's up-to-US\$95B plan is for FY2027 and is additional. Capex includes data centres and other investments; it is not all AI construction.

  Ratios use the latest reported quarter except Amazon, which uses trailing twelve months: about US\$169B net PP&E purchases / US\$161.4B operating cash flow = 105%. Alphabet: 44.924 / 39.1 ≈ 115%; Microsoft including finance-lease additions: 41.4 / 55.4 ≈ 75%; Meta including finance-lease principal: 31.08 / 31.86 ≈ 98%; Oracle: 28.5 / 23.1 ≈ 123%. Definitions differ, so this is a financing-pressure comparison, not a standardized accounting ratio.
  #cite-source("https://www.investing.com/news/stock-market-news/amazon-beats-estimates-for-quarterly-cloud-revenue-growth-4826048", display: false)[Reuters. _Amazon lifts investment plans after strong cloud sales; shares jump_. 30 July 2026. CEO raises calendar-2026 capital spending plan to US\$220B.]
  #cite-source("https://www.spglobal.com/market-intelligence/en/news-insights/research/2026/07/alphabet-postq-ai-growth-accelerates-as-spending-weighs-on-cash-flow", display: false)[S&P Global Market Intelligence. _Alphabet postQ: AI growth accelerates as spending weighs on cash flow_. July 2026. FY2026 capex guidance raised to US\$195--205B.]
  Oracle's figure is for its fiscal year to May 2027. Microsoft's is lower partly because of an accounting change, not less spending.
  - Every one of them says demand still exceeds capacity: Microsoft "customer demand continues to exceed available capacity"; Amazon says it will still be short in 2027.
  - Most of this money buys GPUs that are written off over five or six years.
]

== Where the risk sits

#slide(config: config-common(breakable: false))[
  #oracle-cliff()
]

#speaker-note[
  Up: Oracle's disclosed remaining performance obligations. Down: disclosed lease and purchase commitments plus scenario assumptions for power, future interest, and one year's planned capex. The \$658B total is a modelled outflow scenario, not a disclosed total of contractual obligations. It is not directly comparable with \$664B of future revenue.
  - Oracle expects to recognize 84% of this backlog as revenue within five years of August 2026. The new leases start in FY2027--29 and run 15--19 years. Recognition is not cash collection, and future contracts can replenish the backlog. The chart approximates these periods with annual buckets; it is not a cash-flow forecast.
  - The 2027--31 bars look comfortable, but that is revenue, not profit: it also has to pay for the chips, staff and power to deliver it.
  - FY2027 capex guidance is \$90--95B, not exclusively chips or cash already spent. Oracle has \$125.3B of borrowings. Servers and networking equipment are depreciated over six years; the chart's three-year replacement marker is a scenario, not a verified obsolescence date. On its earnings call Oracle said renewed GPU capacity attracted a 20% premium; that does not establish every old GPU remains economically competitive.
  - About half the backlog is one customer, OpenAI, which is still losing money. Oracle names Meta, NVIDIA, AMD, xAI and TikTok as the others but not how much each owes.
  - Meta's Hyperion joint venture has an initial four-year lease and a residual-value guarantee covering the first sixteen years. A short lease does not mean Meta has no longer-term exposure.
  - Seen it before: WeWork signed 15-year leases and rented desks by the month. It filed for bankruptcy in 2023.
  - The bull case is that demand and future contracts continue growing. The risk illustrated here is the mismatch in timing, refinancing and renewal assumptions, not a prediction that demand must disappear.
  #cite-source(
    "https://www.sec.gov/Archives/edgar/data/1341439/000119312526389274/orcl-20260831.htm",
    display: false,
  )[Oracle. _Form 10-Q, quarter ended 31 August 2026_. RPO US\$664B (13% in 12 months, 37% in months 13--36, 34% in months 37--60); US\$288B of lease commitments not yet commenced, terms 15--19 years; lease and purchase-obligation maturity tables; borrowings US\$125.3B; interest expense US\$1.4B in the quarter; servers depreciated over six years.]
  #cite-source(
    "https://www.spglobal.com/ratings/en/regulatory/article/-/view/sourceId/101695609",
    display: false,
  )[S&P Global Ratings. Oracle lowered to BBB- from BBB, 9 July 2026; OpenAI estimated at roughly half of US\$638B RPO.]
  #cite-source(
    "https://openai.com/index/five-new-stargate-sites/",
    display: false,
  )[OpenAI. _Five new Stargate sites_. 23 September 2025. Oracle partnership "exceeds \$300 billion ... over the next five years".]
  #cite-source(
    "https://www.fool.com/earnings/call-transcripts/2026/09/11/oracle-orcl-q1-2027-earnings-call-transcript/",
    display: false,
  )[Oracle. _Q1 FY2027 earnings call_. 10 September 2026. FY27 capex US\$90--95B, net cash capex not more than US\$70B; GPUs up for renewal re-rented at a 20% premium.]
  #cite-source(
    "https://www.sec.gov/Archives/edgar/data/1326801/000162828025047240/meta-20250930.htm",
    display: false,
  )[Meta. _Form 10-Q_, quarter ended 30 September 2025. Hyperion joint venture: 4-year initial lease term; residual value guarantee for the first 16 years.]
]
