#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/figures/sankey.typ": sankey
#import "/figures/margin-strips.typ": margin-strips
#import "/figures/layer-stack.typ": layer-grid, n-layers
#import "/figures/money-hub.typ": money-hub
#import "@preview/tiaoma:0.3.0": qrcode

= Who makes the money?

// GLM-5.3-REVIEW: the brief's optional light-user Sankey ($10 in, ~$3 out,
// no investor inflow) beside the heavy user - the contrast at a glance.
// GLM-5.3-REVIEW: recolor the Nvidia equity/guarantee backflow so "some of
// that investor money is Nvidia's" is visible - ties the close back to the
// infra slide's punchline.
== Follow the homework bot's money

// VERIFY: the Sankey's split below the lab is illustrative: lab gross margin
// ~50%, $60 of investor-funded training per heavy user per month, and the
// cloud's $105 split $50 Nvidia / $30 energy and datacentres / $25 margin.
// Downstream of the lab the user's slice is drawn pro rata, not traced.
#sankey()

#speaker-note[
  Use the numbers the class just worked out. The user pays \$10. The app pays the lab \$90. The \$80 gap is venture money. The lab is also burning investor money, so the infra layer and Nvidia receive more than the user ever paid. The flows are illustrative, not measured.
]

// GLM-5.3-REVIEW: the top triage item from the review - real cited TTM
// figures here (see the VERIFY note below), since the class just did real
// math in the exercise.
== Profit per \$1 of revenue, layer by layer

// D09 (logo strips) chosen over D08 (profit pool map, figures/profit-pool.typ)
// and D10 (treemap, figures/margin-treemap.typ). Those two stay in figures/
// unused, drawing on the same data.
// VERIFY: every figure in figures/profit-pool-data.typ is a dummy placeholder.
// Replace with cited TTM revenue and operating margin; the footnote on the
// chart says "Illustrative placeholder figures" until then.
// Same stack position and scale as the hook's value-chain slides.
// Step 2 adds the row notes.
#slide(align: top, config: config-common(breakable: false), repeat: 2, self => [
  #layer-grid(
    (1fr,),
    grid.cell(x: 1, y: 0, rowspan: n-layers + 1, layout(size => margin-strips(
      width: size.width,
      height: size.height,
      beside-stack: true,
      notes: if self.subslide > 1 {
        (
          Models: (verdict: [Loses money], detail: [on training]),
          // Infra and Chips line up left of the cluster, clear of CoreWeave's
          // label; there's no room right of AWS and Azure
          Infra: (
            verdict: [Tremendous risk],
            detail: [10--15-yr leases, 2--5-yr GPUs],
            side: left,
            at: -75,
          ),
          Chips: (
            verdict: [Value flows here],
            detail: [to the scarce layer],
            side: left,
            at: -75,
          ),
        )
      } else { (:) },
    ))),
  )
])

#speaker-note[
  Not on the chart because they report no margin: Google DeepMind, Meta, Cohere, DeepSeek, Thinking Machines and SSI among the labs; Lovable, Replit, Harvey and ElevenLabs among the apps.
]


== Nvidia is funding its own demand

// Step 1 Nvidia alone; 2 equity stakes; 3 buy-backs and guarantees; 4 Ohio
// and the New Street quote.
#slide(align: top, config: config-common(breakable: false), repeat: 4, self => [
  #align(center, money-hub(step: self.subslide))
  #uncover(4)[
    #gblock[
      #set par(spacing: 0.4em)
      "Nvidia would invest \$10bn for every \$35bn of GPUs OpenAI buys from it."
      #align(right, text(
        fill: luma(100),
      )[--- _The Economist_ on New Street Research's estimate, Sep 2025])
    ]
    #v(-0.3em)
    #align(center, text(
      fill: luma(100),
    )[The \$100B plan never completed: Nvidia took a \$30B stake instead.])
  ]
  #cite-source(
    "https://nvidianews.nvidia.com/news/openai-and-nvidia-announce-strategic-partnership-to-deploy-10gw-of-nvidia-systems",
    display: false,
  )[Nvidia. _OpenAI and NVIDIA Announce Strategic Partnership to Deploy 10 Gigawatts of NVIDIA Systems_. 22 September 2025. Letter of intent: up to US\$100B as each gigawatt is deployed.]
  #cite-source(
    "https://www.techtimes.com/articles/317839/20260605/nvidia-openai-investment-shrinks-100b-30b-compute-lock-war-continues.htm",
    display: false,
  )[TechTimes. _NVIDIA OpenAI Investment Shrinks From \$100B to \$30B_. 5 June 2026. US\$30B equity in OpenAI's round, closed 31 March 2026 at US\$122B.]
  #cite-source(
    "https://www.bloomberg.com/news/articles/2025-09-15/coreweave-says-nvidia-cloud-contract-valued-at-6-3-billion",
    display: false,
  )[Bloomberg. _CoreWeave Says Nvidia Cloud Contract Valued at \$6.3 Billion_. 15 September 2025. Nvidia buys unused capacity through 13 April 2032.]
  #cite-source(
    "https://www.tomshardware.com/tech-industry/data-centers/nvidia-weighs-250-billion-guarantee-so-openai-can-lease-softbanks-10-gigawatt-ohio-campus",
    display: false,
  )[Tom's Hardware, citing the Wall Street Journal (27 July 2026). Nvidia weighs a US\$250B guarantee of lease and debt for OpenAI's Ohio campus, and up to US\$350B of chip financing. In talks.]
  #cite-source(
    "https://www.datacenterdynamics.com/en/news/oracle-to-spend-40bn-on-nvidia-chips-for-openai-texas-data-center/",
    display: false,
  )[DatacenterDynamics, citing the Financial Times. _Oracle to spend \$40bn on Nvidia chips for OpenAI Texas data center_. May 2025.]
  #cite-source(
    "https://thenightly.com.au/business/the-economist-openai-could-receive-us100b-from-nvidia-to-fund-gpu-purchases-amid-ai-infrastructure-race-c-20118772",
    display: false,
  )[_The Economist_, syndicated by The Nightly. 24 September 2025. Paraphrasing Pierre Ferragu (New Street Research): Nvidia would invest US\$10B for every US\$35B of GPUs OpenAI buys, so OpenAI pays 71% in cash and 29% in shares.]
  #cite-source(
    "https://measuredai.substack.com/p/neoclouds-ai-middle-layer",
    display: false,
  )[Trinetti, C. (2026). _Neoclouds: AI's \$150 Billion Middle Layer That Owns Almost Nothing_. Measured AI.]

  #cite-source(
    "https://thenextweb.com/news/nvidia-invests-2-billion-in-nebius",
    display: false,
  )[The Next Web. _Nvidia invests \$2 billion in Nebius_. 12 March 2026. Pre-funded warrants, about 7.7% stake; Nebius to deploy 5 GW of Nvidia systems by 2030.]
  #cite-source(
    "https://www.thestar.com.my/tech/tech-news/2026/07/28/nvidia-to-invest-5-billion-in-ilya-sutskever039s-ai-startup-source-says",
    display: false,
  )[Reuters via The Star. _Nvidia to invest \$5 billion in Ilya Sutskever's AI startup_. 28 July 2026.]
  #cite-source(
    "https://www.sec.gov/Archives/edgar/data/0001769628/000176962826000362/coreweave2q26earningspress.htm",
    display: false,
  )[CoreWeave. _Second Quarter 2026 Results_ (8-K). Debt US\$35.1B (recourse and non-recourse, current and non-current) at 30 June 2026; backlog about US\$104B.]
])

// Spokes: OpenAI $30B equity in the $122B round closed 31 Mar 2026, with
// Amazon $50B and SoftBank $30B (TechTimes, 5 Jun 2026); the Sep 2025 "up to
// $100B" LOI never became definitive (Nvidia newsroom 22 Sep 2025; 10-Q Nov
// 2025). SSI $5B (Reuters, 28 Jul 2026). Nebius $2B warrants (12 Mar 2026).
// CoreWeave $6.3B capacity backstop to 13 Apr 2032 (CoreWeave 8-K, 15 Sep
// 2025; Bloomberg). Lambda $1.3B rent-back and Nscale $860M guarantee
// (Measured AI, 28 Jul 2026, citing filings). CoreWeave debt $35.1B at
// 30 Jun 2026 (Q2 8-K). Ohio $250B lease/debt guarantee plus up to $350B chip
// financing: talks, not a deal (WSJ, 27 Jul 2026, via Tom's Hardware); project
// $500B+ with SoftBank's SB Energy.
// VERIFY: Lambda $1.3B and Nscale $860M are single-source (Measured AI).
// VERIFY: Oracle's ~$40B Nvidia order (speaker note) is FT-sourced, never
// confirmed by Oracle.
// The lease-vs-GPU mismatch and CoreWeave's Microsoft concentration are in
// the primer's Oracle slide notes.

#speaker-note[
  This is why the Infra verdict is "unclear": who backs the neoclouds and the labs? The chip layer. Nvidia buys equity in its customers, buys back the capacity they can't sell, and guarantees their rent, so the scarce layer is underwriting the demand for its own product. The grey arrows are where outside money enters: equity rounds and debt. That is what ultimately pays for the GPUs.

  The meme version is the "infinite money glitch" (Sep 2025): Nvidia invests in OpenAI, OpenAI signs \$300B with Oracle, Oracle buys \~\$40B of Nvidia chips. The quote on the slide is New Street's estimate for the original \$100B plan, which shrank to a \$30B stake. The bull case: this is ordinary vendor financing, and Nvidia can afford it.

  Remember the Sankey: the money reaching Nvidia was mostly investor money. Some of that investor money is Nvidia's.

  Measured AI's line: "Converted bitcoin miners own the buildings; NVIDIA and Google guarantee the rent --- Microsoft simply buys the compute."
]



#focus-slide[
  #grid(
    columns: (1fr, auto),
    align: horizon,
    gutter: 1em,
    [
      #{
        set text(size: 1em)
        set list(spacing: 1.2em)
        set align(left)
        [
          + Does a *heavy user* make you money, or lose it?
          + What's left of you the day the lab *ships your feature*?
          + Can you *swap models* when the landlord raises the rent?
          + Does your edge survive a model *10× cheaper*?
          + Who pays the bill when the *investor money* runs out?
        ]
      }

    ],
    [
      // Scan target, then the verb, then the typed-in fallback
      #set align(center)
      #set par(leading: 0.4em)
      #box(fill: white, inset: 0.5em, radius: 6pt)[
        #qrcode("https://manek.sg/26F-bsn4811", width: 6cm)
      ]
      #v(0.3em)
      #text(weight: "bold")[Slides, reading list\ & LinkedIn]\
      #text(size: 0.75em)[Tell me what you build]\
    ],
  )
]

