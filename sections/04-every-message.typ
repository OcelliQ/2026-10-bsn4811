#import "/common.typ": *
#import "/citations.typ": cite-source

= Every message costs money

#section-subtitle[Unit Economics]

#section-quote[It's like a gym subscription: the flat fee only works because most members rarely show up.][the business model of every flat-rate AI plan]




== Traditional vs AI unit economics

#let margins = (
  (name: [Car maker], gross: [10%], net: [1%]),
  (name: [Airline], gross: [25%], net: [2.5%]),
  (name: [Restaurants], gross: [32%], net: [9%]),
  (
    name: [AI app#cite-source("https://a16z.com/the-new-business-of-ai-and-how-its-different-from-traditional-software/")[Martin Casado and Matt Bornstein, a16z. _The New Business of AI_. 16 February 2020. Observed AI-company gross margins of 50--60%; an illustrative historical benchmark, not a 2026 industry average.]
    ],
    gross: [50--60%],
    net: [???],
    hl: true,
  ),
  (name: [Software], gross: [72%], net: [25%]),
)
#let margin-fill(m) = if m.at("hl", default: false) { accent } else { black }

#v(1cm)
#grid(
  columns: (5cm,) + (1fr,) * margins.len(),
  column-gutter: 1em,
  row-gutter: 1.2em,
  align: horizon,
  [], ..margins.map(m => align(center, text(
    weight: "bold",
    fill: margin-fill(m),
    m.name,
  ))),
  ..(
    (
      field: "gross",
      label: [Gross margin#cite-source("https://pages.stern.nyu.edu/~adamodar/New_Home_Page/datafile/margin.html")[Aswath Damodaran. _Margins by Sector (US)_, January 2026. Auto & Truck: 10.4% gross / 1.3% net; Air Transport: 24.8% / 2.5%; Restaurant/Dining: 32.24% / 9.37%; Software (System & Application): 71.72% / 25.49%. Broad industry aggregates, not fast-food-only or SaaS-only samples.]],
      q: [Does the _product_ pay for itself?],
    ),
    (field: "net", label: [Net margin], q: [Does the _company_?]),
  )
    .map(r => (
      [#text(weight: "bold", r.label) \ #r.q],
      ..margins.map(m => gblock(center: true, outset: (x: 0em, y: 1em), text(
        size: 1.6em,
        weight: "bold",
        fill: margin-fill(m),
        m.at(r.field),
      ))),
    ))
    .flatten(),
)
#align(right)[
  #text(size: 0.7em)[\*Very rough numbers.]
]
#v(1fr)
#grid(
  columns: (1fr, auto, 1fr),
  column-gutter: 1em,
  align: top,
  [
    #text(weight: "bold")[Inputs are most of the price]
    - Steel in every car, food in every meal
    - AI: every message is a paid model call
    - Heavy users *drag you down*.
  ],
  grid.cell(align: horizon, text(
    size: 1em,
    fill: luma(50),
    sym.arrow.l.r.long,
  )),
  [
    #text(weight: "bold")[Inputs are almost free]
    - Code written once, copied for free
    - One more user costs relatively little
    - Heavy users are often *more profitable*
  ],
)
#v(1cm)



#speaker-note[
  Gross margin = (revenue - cost of serving each unit) / revenue. For a car maker that cost is steel and labour; for an airline, fuel and planes; for fast food, ingredients and staff; for SaaS, hosting and support. For AI it includes every token you buy from a lab.

  Net margin takes out everything else too: R&D, salaries, marketing, interest, tax. A car maker keeps a tenth of revenue after paying for parts, and about one cent per dollar once everything is paid.

  These are broad US industry aggregates, not individual-company targets. The AI gross-margin range is a historical a16z observation, not a comparable 2026 census. The AI net margin is deliberately left open for discussion.

  In an AI app cost scales with use, not just users, and heavy users on a flat plan can be pure loss.

  Tokens are ingredients. A flat plan is an all-you-can-eat buffet: it works only because most diners eat a normal amount.
]


== Character.AI: a beloved product

#slide(composer: grid.with(
  columns: (1fr, 9cm),
  column-gutter: 1.2em,
  align: top,
))[
  - *2021*: founded by ex-Google researchers Noam Shazeer and Daniel de Freitas
  - *Mar 2023*: valued at \$1B.#cite-source("https://blog.character.ai/character-ai/")[Character.AI. _Announcing Our Series A and Our New AI Model, C1.2_. 23 March 2023. US\$150M funding at a US\$1B valuation.]
  - By 2026: \~12M monthly users; active users average \~2 hours/day.
  - *Aug 2024*: Google rehires both founders and licenses the tech for a reported \$2.7B. Character.AI stays independent.
  - *Oct 2026*: files for *Chapter 11 bankruptcy* and seeks a buyer.#cite-source("https://blog.character.ai/an-update-on-character-ai/")[Character.AI. _An Update on Character.ai_. 12 October 2026.]

  #pause
  *The unit economics (company court filing)*#cite-source("https://cases.stretto.com/public/x936/14939/PLEADINGS/1493910132680000000119.pdf")[Colin M. Adams. _Declaration in Support of the Debtor's Chapter 11 Petition and First Day Motions_. In re Character Technologies, Inc., No. 26-11603-BLS, Doc. 18, filed 13 October 2026, paragraphs 5, 8, 11, 16 and 19. Company-reported usage, revenue, losses, compute expenditure, founding year and Google transaction.]
  - Monthly revenue: \$2.8M (Dec 2025) → \$5.3M (Aug 2026)
  - Operating loss, Aug 2026: *\$8--9M/month*
  - Compute, Jan--Aug 2026: *\$56.1M*

][
  #meanwhile
  #block(height: 100%, width: 100%, spacing: 0pt, grid(
    rows: (1fr, auto),
    row-gutter: 0.2em,
    layout(size => {
      // Source: 728 × 829. Preserve its full height and aspect ratio.
      let full-width = size.height * 728 / 829
      align(center, block(
        width: calc.min(size.width, full-width),
        height: size.height,
        clip: true,
        place(center + top, image(
          "/figures/news/N02-character-ai-google-deal.png",
          width: full-width,
          height: size.height,
        )),
      ))
    }),
    attribution-style(
      link("https://www.wsj.com/tech/ai/noam-shazeer-google-ai-deal-d3605697"),
    ),
  ))
]

== Character.AI: then the bills come

#slide(composer: grid.with(
  columns: (1fr, 9cm),
  column-gutter: 1.2em,
  align: top,
))[
  - *Oct 2024*: sued over 14-year-old Sewell Setzer's suicide; allegations later settled.#cite-source("https://techjusticelaw.org/cases/garcia-v-character-technologies-google-and-character-ai-co-founders-daniel-de-frietas-and-noam-shazeer/")[Tech Justice Law Project. _Garcia v. Character Technologies et al._ Complaint filed 22 October 2024; allegations of wrongful death and product liability. Doc. 18 of the bankruptcy case, paragraph 25, reports settlement of then-pending personal-injury cases in January 2026.]
  - *May 2025*: begins testing in-app ads.#cite-source("https://www.reddit.com/r/CharacterAI/comments/1kkz2qm/announcement_updates_to_keep_cai_running_smoothly/")[Character.AI. _Updates to keep C.AI running smoothly_. Official community announcement, 12 May 2025.]
  - *Nov 2025*: begins removing under-18s' open-ended chat.#cite-source("https://blog.character.ai/an-update-on-changes-to-our-under-18-experience/")[Character.AI. _An Update On Changes to Our Under-18 Experience_. 21 November 2025. Phased US rollout begins 24 November; additional groups and markets follow.]
  - *By Jan 2026*: in-app purchases available.#cite-source("https://www.reddit.com/r/CharacterAI/comments/1qklo2i/called_it_you_can_now_buy_charms_on_cai_mobile/")[r/CharacterAI. _Called it. You can now buy charms on C.AI mobile._ User reports and bundle prices, 23 January 2026. Establishes availability by January, rather than an official launch date.]

  - *12 Oct 2026*: Chapter 11 bankruptcy
    - *Disney, \$20M*: opening bid for certain IP rights and claims.#cite-source("https://www.businesswire.com/news/home/20261012656385/en/Character.ai-Initiates-Voluntary-Chapter-11-Proceeding-to-Facilitate-Value-Maximizing-Sale-Process")[Character Technologies. _Character.ai Initiates Voluntary Chapter 11 Proceeding to Facilitate Value-Maximizing Sale Process_. 12 October 2026. Delaware filing; Disney stalking-horse bid of US\$20M plus transition services for a non-exclusive perpetual licence of certain IP and certain claims, subject to higher offers.]

  #pause
  #lblock(center: true)[
    A \$1B startup enters bankruptcy\
    *while users still love it*
  ]
][
  #meanwhile
  #block(height: 100%, width: 100%, spacing: 0pt, grid(
    rows: (1fr, auto),
    row-gutter: 0.2em,
    layout(size => block(
      width: size.width,
      height: size.height,
      clip: true,
      // Keep the article headline inside the crop; its column is left of centre.
      place(center + top, dx: size.height * 0.19, image(
        "/figures/news/N03-character-ai-chapter-11.png",
        width: size.height * 1600 / 1000,
        height: size.height,
      )),
    )),
    attribution-style(
      link(
        "https://variety.com/2026/biz/news/disney-bids-on-character-ai-assets-chapter-11-bankruptcy-1236909984/",
      ),
    ),
  ))
]

#speaker-note[
  The product worked. People loved it. Every hour of that love was a compute bill, and the users who loved it most were the most expensive and the most legally exposed.

  The declaration was checked directly, not through press summaries. Revenue figures compare December 2025 with August 2026; the loss rate is as of August 2026, not every month of the year. The initial US under-18 removal began November 24 and was phased, superseding the original November 25 deadline.

  The filing names Colin M. Adams as CEO; Karandeep Anand was his predecessor and had joined Disney. Disney's US\$20M bid is for specified IP rights and claims plus transition services, not an equity valuation of the whole company. Do not plot it as a fall from a US\$1B company valuation to a US\$20M company valuation.
]

== It's not just Character.AI

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.6em,
  align: top,
  shot(
    "N04",
    [Altman: losing money on ChatGPT Pro],
    path: "/figures/news/N04-chatgpt-pro-losing-money.png",
    url: "https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/",
    width: 7.8cm,
  ),
  shot(
    "N05",
    [Copilot loses \~\$20/user/month (WSJ)],
    path: "/figures/news/N05-copilot-20-per-user.png",
    url: "https://www.wsj.com/tech/ai/ais-costly-buildup-could-make-early-products-a-hard-sell-bdd29b9f",
    width: 7.8cm,
  ),
  shot(
    "N06",
    [Harvey AI: gross margins turn negative],
    path: "/figures/news/N06-harvey-ai-margins.png",
    url: "https://research2.contrary.com/report/the-path-forward-for-legal-ai",
    width: 7.8cm,
  ),

  [*ChatGPT Pro*: losing money on the \$200 plan (Jan 2025)#cite-source("https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/")[Kyle Wiggers, TechCrunch. _OpenAI is losing money on its pricey ChatGPT Pro plan, CEO Sam Altman says_. 5 January 2025. Historical statement, not a claim about current plan profitability.]],
  [*GitHub Copilot*: reportedly >\$20/user/month lost on a \$10 plan (2023)#cite-source("https://www.wsj.com/tech/ai/ais-costly-buildup-could-make-early-products-a-hard-sell-bdd29b9f")[Tom Dotan and Deepa Seetharaman, The Wall Street Journal. _Big Tech Struggles to Turn AI Hype Into Profits_. 9 October 2023. Reported average loss above US\$20 per user per month, with some users costing much more; not a current loss estimate.]],

  [*Harvey AI*: gross margin reportedly fell to about -50% in Jun 2026; the company said it was positive by Sep.#cite-source("https://research2.contrary.com/report/the-path-forward-for-legal-ai")[Contrary Research. _The Path Forward for Legal AI_. 5 October 2026. Cites Bloomberg's source for gross margin moving from about +50% to -50% by June 2026, and Harvey's president reporting positive margins again in September. Private-company reports, not audited financial disclosures.]],
)

#v(0.4em)
Also *Claude Code* (weekly limits, Aug 2025)#cite-source("https://techcrunch.com/2025/07/28/anthropic-unveils-new-rate-limits-to-curb-claude-code-power-users/")[Maxwell Zeff, TechCrunch. _Anthropic unveils new rate limits to curb Claude Code power users_. 28 July 2025. Weekly limits announced for Pro and Max, effective 28 August 2025.],
*Cursor* (credits, then an apology, Jul 2025)#cite-source("https://cursor.com/blog/june-2025-pricing")[Michael Truell, Cursor. _Clarifying our pricing_. 4 July 2025. Apology and offer of refunds for unexpected usage charges after the June 16 pricing change.]
and *Replika* (operator Luka fined #sym.euro;5M by Italy's Garante, May 2025)#cite-source("https://www.garanteprivacy.it/home/docweb/-/docweb-display/docweb/10132048")[Garante per la protezione dei dati personali. _AI: The Italian Data Protection Authority fines company behind chatbot Replika_. 19 May 2025. Fine imposed on Luka Inc. for privacy violations; a regulatory cost, not evidence of negative unit margins.]

#speaker-note[
  These are dated examples, not statements about current profitability. Replika illustrates regulatory exposure; the other examples concern serving costs or usage controls. The WSJ report is the source of the Copilot loss estimate, not a Microsoft financial disclosure.
]
