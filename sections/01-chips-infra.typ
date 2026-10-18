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
      To keep up with *one* B200, you'd need #blank(2)[*about a million Earths'*] people, each doing one sum per second.

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

== A rack of 72 costs \~\$3.5M

// VERIFY: rack price. NVIDIA publishes no list price; these are analyst
// estimates. Wing VC's piece now leads with GB300 NVL72 (just under $5.0M,
// ~$3.4M of it the 72 GPU modules), not GB200, so re-check which figure it
// backs. DeployBase gives $60--70K per GB200 superchip.
// VERIFY: photo source and whether it shows GB200 NVL72 racks.
#slide(config: config-common(breakable: false))[
  #let money(body) = text(weight: "bold")[#body]
  #grid(
    columns: (16cm, 1fr),
    rows: (1fr,),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "P01",
      [CoreWeave datacentre],
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
        [36 × GB200 superchips#cite-source("https://deploybase.ai/articles/nvidia-gb200-nvl72")[DeployBase. _NVIDIA GB200 NVL72_. About US\$60--70K per GB200 superchip.]],
        [\~\$2.2--2.5M],
        [backplane, cooling, power, networking#cite-source("https://newsletter.semianalysis.com/p/gb200-hardware-architecture-and-component")[SemiAnalysis. _GB200 Hardware Architecture and Component Supply Chain & BOM_. July 2024.]],
        [\~\$0.4--0.8M],
        table.hline(stroke: 0.6pt + luma(160)),
        money[Rack total#cite-source("https://www.wing.vc/content/how-much-does-an-nvidia-nvl72-cost")[Wing VC. _How Much Does an NVIDIA NVL72 Cost?_]],
        money[\~\$3.0--3.5M],
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

== NVIDIA beats everyone else combined

// Latest quarter, as reported. Not like-for-like: NVIDIA's data centre and
// Broadcom's AI figures include networking; AMD's data centre segment includes
// EPYC CPUs; Marvell's data centre includes networking. Quarters end Jul 2026
// (NVIDIA), Aug 2026 (Broadcom, Marvell), Jun 2026 (AMD, Cerebras).
// VERIFY: Huawei is an estimate, a quarter of the FT's reported US$12B 2026
// figure (2 May 2026, unnamed sources). Cited via IndexBox; swap in the FT
// article link if you can get it.
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

// VERIFY: the 75--80% share is analyst estimates (Silicon Analysts, IDC), not
// reported figures.
#speaker-note[
  Not like-for-like: NVIDIA and Broadcom include networking, AMD includes CPUs, and the quarters end in different months. The ratio survives every adjustment.
  - Analysts put NVIDIA at about 75--80% of AI accelerator revenue in 2026.
  - The threat isn't a rival GPU. It's NVIDIA's customers (Google, Amazon, Microsoft, Meta) designing their own chips, often with Broadcom.
  - Hold that thought for section 4: your supplier is your competitor.
  #cite-source(
    "https://siliconanalysts.com/analysis/nvidia-ai-accelerator-market-share-2024-2026",
    display: false,
  )[Silicon Analysts. _NVIDIA AI Accelerator Market Share 2024--2026_. Estimates NVIDIA at 75--81% of AI accelerator revenue in 2026.]
]

= Value Chain: Infrastructure

#section-subtitle[AI Value Chain]


// Photos are company press images; see figures/photos/SOURCES.md. Power:
// Abilene 1.2 GW (Epoch AI); Hyperion 2 GW by 2030, 5 GW later (Meta);
// Rainier 2.25 GW at full build-out (Epoch AI). Fairwater's power is not
// disclosed.
// VERIFY: the Rainier photo is from Amazon's Project Rainier article but is
// captioned only "The exterior of a data center".
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
      [Amazon for Anthropic; 2.25 GW#cite-source("https://www.aboutamazon.com/news/aws/aws-project-rainier-ai-trainium-chips-compute-cluster")[Amazon. _AWS Project Rainier_. Photo: Amazon. 2.25 GW at full build-out per Epoch AI's satellite explorer.]],
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
  - Hyperion is being built with ten new gas plants from the local utility. Stargate Abilene has its own gas generation on site.
  - Every one of these is owned or financed by someone different from the company that uses the chips: Oracle for OpenAI, Blue Owl's investors for Meta, Amazon for Anthropic.
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
      Colossus 1 wentCabn from empty factory to running in *122 days*.

      Colossus 1 + 2 together draw *~1 GW*:\
      as much as all homes in Singapore#cite-source("https://www.ema.gov.sg/singapore-energy-statistics/Ch03/index3")[Energy Market Authority. _Singapore Energy Statistics_, chapter 3. Households used about 8 TWh in 2024, 14.6% of total electricity consumption; about 0.9 GW on average.].

      Anthropic rents both for *\$1.25B a month* until 2029#cite-source("https://www.sec.gov/Archives/edgar/data/1181412/000162828026040364/spaceexplorationtechnologib.htm")[SpaceX. _Form S-1/A_. Colossus and Colossus II together approximately 1.0 GW; Anthropic agreements for about 325,000 NVIDIA GPUs at US\$1.25 billion a month through May 2029, terminable by either party on 90 days' notice after the first three months.], but either side can walk away on *90 days' notice*.
    ],
  )
]

#speaker-note[
  - Singapore's households used about 8 TWh in 2024, an average of 0.9 GW. The whole country averages about 6.6 GW, with a record peak of 8.2 GW (July 2025).
  - xAI is now part of SpaceX. Its AI business made \$3.2B in 2025, so this one contract is worth about five times that.
  - The last line is the whole section: a building that lasts decades, rented on terms that can end in months.
  - The site runs partly on gas turbines; local groups have sued over turbines running without permits.
]


== Big Tech will spend \~\$730B on data centres this year

// Capex guidance for calendar 2026 as of the June-quarter results (Sep-quarter
// results are due late Oct 2026). Microsoft's ~$175B is after an accounting
// change (buildings 15 -> 25 years) that moves leases off the capex line.
// Capex / operating cash flow is our arithmetic from each filing: latest
// quarter, except Amazon (trailing twelve months). Oracle's capex is its
// fiscal year to May 2027 (Reuters, not an Oracle document).
// VERIFY: refresh after the Sep-quarter results.
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
      text(size: 0.75em)[*2026 capex*],
      text(size: 0.75em)[*capex ÷ cash \ from operations*],
      table.hline(stroke: 0.6pt + luma(160)),
      ..row("Amazon", [\~\$220B], 105, cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001018724/000101872426000024/amzn-20260630xex991.htm",
      )[Amazon. _Second Quarter 2026 Results_ (8-K). Q2 purchases of property and equipment US\$54.2B; trailing-twelve-month operating cash flow US\$161.4B.]),
      ..row("Alphabet", [\$195--205B], 115, cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001652044/000165204426000066/googexhibit991q22026.htm",
      )[Alphabet. _Second Quarter 2026 Results_ (8-K). Q2 capex US\$44.9B; operating cash flow US\$39.1B.]),
      ..row("Microsoft", [\~\$175B], 65, cite-source(
        "https://www.sec.gov/Archives/edgar/data/0000789019/000119312526323632/msft-ex99_1.htm",
      )[Microsoft. _FY26 Q4 Results_ (8-K). Capex US\$35.8B cash plus US\$5.6B finance leases; operating cash flow US\$55.4B.]),
      ..row("Meta", [\$130--145B], 98, cite-source(
        "https://investor.atmeta.com/investor-news/press-release-details/2026/Meta-Reports-Second-Quarter-2026-Results/",
      )[Meta. _Meta Reports Second Quarter 2026 Results_. Q2 capex US\$31.1B including finance leases; 2026 guidance US\$130--145B.]),
      ..row("Oracle", [up to \$95B], 123, cite-source(
        "https://www.sec.gov/Archives/edgar/data/0001341439/000119312526389274/orcl-20260831.htm",
      )[Oracle. _Form 10-Q_, quarter ended 31 August 2026. Capex US\$28.5B; operating cash flow US\$23.1B.]),
      table.hline(stroke: 0.6pt + luma(160)),
    ),
    [
      Four of the five spent *all their operating cash flow or more* on capex last quarter.

      So they borrow and sell shares: Alphabet sold *\$80B of new stock*, the largest US share sale ever#cite-source("https://www.sec.gov/Archives/edgar/data/0001652044/000119312526257724/d83560dex991.htm")[Alphabet. _Form 8-K, Exhibit 99.1_. US\$80 billion equity offering, including a US\$10 billion private placement to Berkshire Hathaway, June 2026.].
    ],
  )
]

#speaker-note[
  Oracle's figure is for its fiscal year to May 2027. Microsoft's is lower partly because of an accounting change, not less spending.
  - Every one of them says demand still exceeds capacity: Microsoft "customer demand continues to exceed available capacity"; Amazon says it will still be short in 2027.
  - Most of this money buys GPUs that are written off over five or six years.
]

== Where the risk sits

#slide(config: config-common(breakable: false))[
  #oracle-cliff()
]

#speaker-note[
  Up: what customers have promised to pay Oracle each year. Down: what Oracle has promised to pay. The two totals are about the same, \$664B in and \$658B out. The difference is when.
  - 84% of the customer money arrives by 2031. The new leases start in 2027--29 and run 15--19 years. Past the line, the bills keep coming and nobody has promised to pay yet.
  - The 2027--31 bars look comfortable, but that is revenue, not profit: it also has to pay for the chips, staff and power to deliver it.
  - The chips are paid for now, \$90--95B this year, partly out of borrowing: Oracle owes \$125B and S\&P cut it to BBB-, one notch above junk. Oracle writes servers off over six years; sceptics say a new NVIDIA generation makes them obsolete in about three. So far old GPUs still re-rent: Oracle renewed mostly 4-year-old capacity at a 20% premium.
  - About half the backlog is one customer, OpenAI, which is still losing money. Oracle names Meta, NVIDIA, AMD, xAI and TikTok as the others but not how much each owes.
  - Not just Oracle: Big Tech has about \$1.2 trillion of data centre leases signed but not yet started. Meta signed only a 4-year lease on its Louisiana campus; bondholders carry the other 19 years, protected by Meta's guarantee on what the campus will be worth.
  - Seen it before: WeWork signed 15-year leases and rented desks by the month. It filed for bankruptcy in 2023.
  - The bull case: demand still exceeds supply, and H100 rental prices rose about 40% this year. The risk is about timing and debt, not demand. You can be right about AI and still go bust if prices dip the year your loan is due.
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
