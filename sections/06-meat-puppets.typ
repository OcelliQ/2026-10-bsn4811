#import "/common.typ": *
#import "/citations.typ": cite-source

= Meat puppets and crumple zones

== Two ways to hide a human

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  gblock[
    *The meat puppet*

    "AI" on the label, *people in a call centre* behind it.

    - Disclosed: a legitimate *Wizard-of-Oz MVP*
    - Sold as automation: *fraud*
    - Either way it *hides the true unit economics*
  ],
  [
    #pause
    #gblock[
      *The moral crumple zone*

      The AI does the work. A human is kept *mainly to absorb the blame*.

      #text(
        size: 0.8em,
        fill: luma(110),
      )[Term coined by Madeleine Clare Elish (2019).]
    ]
  ],
)

// VERIFY: Elish, "Moral Crumple Zones: Cautionary Tales in Human-Robot
// Interaction", Engaging Science, Technology, and Society 5 (2019). Add a
// cite-source with the DOI.

== Builder.ai: "like ordering pizza"

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
  shot(
    "N12",
    [Builder.ai overstated sales to creditors, May 2025],
    path: "/figures/news/N12-builder-ai-collapse.png",
    url: "https://www.bloomberg.com/news/articles/2025-05-22/startup-builder-ai-overestimated-sales-by-300-to-key-creditors",
    width: 12cm,
  ),
  [
    - Marketed *"Natasha the AI"*, which builds apps for you
    - Microsoft-backed, valued at \~\$1.5B
    #pause
    - Told lenders it expected \$220M of 2024 sales; the actual was \~\$50M
    - Reports of round-tripping sales with VerSe
    - *May 2025*: a lender sweeps \$37M; insolvency
    - US prosecutors and the SEC investigate
  ],
)

// VERIFY: $1.5B valuation; $220M forecast vs ~$50M actual (Bloomberg, 22 May
// 2025; the 30 Jul 2025 feature has ~$55M); VerSe round-tripping; Viola Credit's $37M sweep;
// SDNY and SEC probes.

#speaker-note[
  Present this carefully. The viral version is "700 Indian engineers pretending to be AI". The fuller story is partly disputed: some AI components were real. What's not disputed is that the revenue was inflated and the automation was overstated. The lesson is about the unit economics: if humans do the work, your costs look like a call centre's, not a software company's.
]

== The roll-call

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0.8em,
  align: top,
  [
    *Nate* (shopping app): founder charged by US prosecutors; automation was \~0%
  ],
  [
    *Presto* (drive-through voice AI): SEC order; claimed 95% automated, \~70% of orders needed humans
  ],

  [
    *Amazon Just Walk Out*: reportedly \~700 of every 1,000 sales human-reviewed (Amazon disputes this)
  ],
  [
    *1X NEO* home robot: "Expert Mode" means a remote human operator
  ],
)

#v(0.6em)
#align(center, shot(
  "N13",
  [Nate founder charged, Apr 2025],
  path: "/figures/news/N13-nate-founder-charged.png",
  url: "https://techcrunch.com/2025/04/10/fintech-founder-charged-with-fraud-after-ai-shopping-app-found-to-be-powered-by-humans-in-the-philippines/",
  width: 10cm,
))

// VERIFY: Nate (SDNY charges, Apr 2025); Presto (SEC order, Jan 2025, and the
// 95% / ~70% figures); Amazon JWO ~700/1,000 (The Information, 2024) and
// Amazon's denial; 1X NEO "Expert Mode" teleoperation.

== Klarna: the crumple zone in reverse

#grid(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
  shot(
    "N14",
    [Klarna rehires humans, 2025],
    path: "/figures/news/N14-klarna-rehires-humans.png",
    url: "https://fortune.com/2025/05/09/klarna-ai-humans-return-on-investment/",
    width: 12cm,
  ),
  [
    - *Feb 2024*: AI does the work of *700 agents*, worth \$40M profit
    - *Aug 2024*: "shutting down Salesforce and Workday" (in practice, swapped for other SaaS)
    #pause
    - *2025*: the CEO says quality got *lower*; Klarna hires humans again
  ],
)

// VERIFY: Klarna's Feb 2024 "700 agents / $40M" press release; the Aug 2024
// Salesforce/Workday statement and the Deel replacement; the 2025 CEO quote
// on lower quality (A* slide 43).

#speaker-note[
  Why rehire? Partly quality. Partly that when the AI makes a bad call, someone has to answer for it. A human in the loop who rubber-stamps the AI is a liability sponge, the crumple zone.
]

== Discuss

#discuss[
  When is a human behind the curtain a legitimate MVP, \
  and when does it become fraud?
]
