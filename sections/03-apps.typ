#import "/common.typ": *
#import "/citations.typ": cite-source

= How to make money with AI

#section-subtitle[The application layer]


#focus-slide[
  Exercise

  #text(size: 72pt, weight: "bold")[
    *Set prices for your homework bot.*
  ]
]


== Exercise: price my homework bot

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: top,
  [
    *The product*: an AI homework tutor that answers questions and draws graphs and diagrams.
    Assume competitors charge *\$10 / month*.

    #v(0.6em)
    #table(
      columns: (1fr, auto),
      align: (left, right),
      stroke: none,
      inset: (x: 0.5em, y: 0.35em),
      [Input price], [\$2 / M tokens],
      [Output price], [\$10 / M tokens],
      [One question], [10k in, 1k out],
      [Light user], [100 qn / month],
      [Heavy user], [3,000 qn / month],
    )
    #text(size: 0.8em, fill: luma(90))[Mid-tier pricing: Claude Sonnet 5.5, GPT-6.1 Sol, Gemini 4 Argon]
  ],
  [
    *Your job (2 minutes, with a neighbour)*
    - What does one question cost?
    - What does a light user cost per month?
    - What about a heavy user?
    - At \$10 / month, how many questions before you lose money?
    - What margin do you make on each user?
    #pause
    #v(0.5em)
    *Heavy users*
    - How many light users do you need to subsidize one heavy user?
    - How do you stop them sinking you?
  ],
)

#cite-source(
  "https://developers.openai.com/api/docs/models/gpt-6.1-sol",
  display: false,
)[OpenAI. _GPT-6.1 Sol_. Standard text pricing checked 18 October 2026: US\$2/M input and US\$10/M output for prompts up to 272K input tokens.]
#cite-source(
  "https://claude.com/pricing",
  display: false,
)[Anthropic. _Pricing_. Sonnet 5.5 standard text rates, checked 18 October 2026: US\$2/M input and US\$10/M output. Team seats billed monthly: US\$25 standard and US\$125 premium; annual billing is cheaper.]
#cite-source(
  "https://ai.google.dev/gemini-api/docs/pricing",
  display: false,
)[Google. _Gemini Developer API pricing_. Gemini 4 Argon standard text rates: US\$2/M input and US\$10/M output through 30 November 2026; announced rates double from 1 December.]

#speaker-note[
  At the standard short-context text rates checked on 18 October 2026, these three models cost the same. This exercise assumes no cache hits, batch discount, reasoning beyond the stated output, or separate image/tool charges. Graphs are generated as code, not through a separately priced image model. The competitor price and usage profiles are hypothetical.

  One question: 10,000 × \$2/M = \$0.02 in, 1,000 × \$10/M = \$0.01 out. \$0.03.

  Light user: 100 × \$0.03 = \$3 against \$10 of revenue. 70% margin, looks like SaaS.

  Heavy user: 3,000 × \$0.03 = \$90 against \$10. You lose \$80 on them, every month: a #sym.minus;800% margin.

  Break-even: \$10 / \$0.03 ≈ 330 questions a month.

  One heavy user's \$80 loss needs 12 light users at \$7 contribution each (80 / 7 ≈ 11.4), before overhead.

  Agent: 100 tasks × 50 calls × \$0.03 = \$150.
]


== The pricing menu

#slide(align: top, config: config-common(breakable: false), repeat: 3, self => [
  #let (uncover, only, alternatives) = utils.methods(self)
  #let tied = uncover("2-", text(fill: accent)[●])

  #cite-source(
    "https://www.microsoft.com/en-us/copilot/solutions/individuals",
    display: false,
  )[Microsoft. _Copilot for individuals_. Microsoft 365 Premium: US\$19.99/month, checked 18 October 2026; usage limits apply.]
  #cite-source(
    "https://www.zendesk.com/pricing/",
    display: false,
  )[Zendesk. _Pricing_. Automated resolutions: US\$1.50 committed and US\$2.00 pay-as-you-go, in addition to the relevant base plan; checked 18 October 2026.]


  #table(
    columns: (auto, auto, 1fr, auto),
    align: (center, left, left, left),
    stroke: none,
    fill: (_, y) => if y > 0 and calc.even(y) { luma(240) },
    inset: (x: 0.5em, y: 0.4em),
    table.header([], [*Model*], [*How it works*], [*Example*]),
    table.hline(stroke: 0.5pt + luma(180)),
    tied, [Per-token API], [Pay for exactly what you use], [OpenAI / Anthropic APIs],
    [], [Flat / per-seat], [Fixed fee, subject to usage limits],
    [Microsoft 365 Premium, \$20/month \ Claude Team, \$25 / \$125 per seat/month],
    [], [Freemium + ads], [Ads help fund a free tier], [ChatGPT free tier],
    tied, [Usage credits], [Fee buys a usage budget], [Cursor, \$20 of credits],
    [], [Outcome-based], [Pay per job done], [Zendesk, \$1.50 per committed resolution],
  )

  #v(0.3em)
  #alternatives(start: 2, position: top + left)[
    #lblock[
      #grid(
        columns: (1em, 1fr),
        row-gutter: 0.5em,
        text(fill: accent)[●], [*Tie price to usage:* heavy users pay for what they use.],
        [], [*Pooled usage:* heavy users cost more than their fee. Lighter users make the plan viable.],
        [], [*Price to value:* outcome pricing charges for results, so the vendor absorbs risk.],
      )
    ]
  ][
    - *Cursor*: 500 requests → \$20 usage (Jun 2025); apology and refunds offered (Jul).#cite-source("https://cursor.com/blog/june-2025-pricing")[Michael Truell, Cursor. _Clarifying our pricing_. 4 July 2025. June 16 plan change, US\$20 usage pool and refunds offered for unexpected usage charges.]
    - *Anthropic*: weekly Claude Code limits added (Aug 2025).#cite-source("https://techcrunch.com/2025/07/28/anthropic-unveils-new-rate-limits-to-curb-claude-code-power-users/")[Maxwell Zeff, TechCrunch. _Anthropic unveils new rate limits to curb Claude Code power users_. 28 July 2025; new limits effective 28 August.]
    - *Replit*: \$0.25/checkpoint → compute billing (Jun--Jul 2025).#cite-source("https://replit.com/blog/effort-based-pricing-recap")[Replit. _Effort-Based Pricing Recap_. July 2025. US\$0.25 checkpoints replaced by charges based on compute resources; rollout began June 18 for new users and July 2 for existing users.]
    - *GitHub Copilot*: premium requests → token-priced credits (Jun 2026).#cite-source("https://github.blog/news-insights/company-news/github-copilot-is-moving-to-usage-based-billing/")[Mario Rodriguez, GitHub. _GitHub Copilot is moving to usage-based billing_. 27 April 2026. Monthly plans transition from June 1; existing annual plans retain request pricing until expiry. Completions remain included.]
  ]
])

#speaker-note[
  Return to the homework-bot exercise. The question is always: who carries the cost when a user uses a lot?

  Microsoft folded Copilot Pro into Microsoft 365 Premium. It doesn't promise unlimited, it promises "extensive usage": a flat fee with a fuzzy cap.

  Claude Team sells two seat tiers, \$25 and \$125. Even per-seat pricing ends up charging heavy users more.

  First show the table and ask: which of these protect the company from heavy users? Then reveal.

  The orange dots mark token or credit billing, where price follows metered usage. They do not mark outcome pricing: the vendor still carries retry and failure costs. Per-token: the user pays for extra tokens. Flat fee: the vendor carries extra use within its limits. Ads: the vendor carries compute cost unless ad revenue covers it. Credits: exposure is capped only if credits reflect resource use. Outcomes: the vendor carries every failed attempt unless its scope or contract limits that exposure.

  API-equivalent retail value is not the provider's serving cost. A heavily used subscription cannot be called a loss leader from API list prices alone. Microsoft can bundle Copilot with Office, and ChatGPT has introduced ads on eligible free tiers; neither establishes that ads or bundles cover all serving costs.

  Outcome pricing ties price to the value the customer gets, not to your cost. Zendesk charges \$1.50 per resolution, but still pays the model bill on tickets the bot fails to resolve. The customer pays for success, you pay for failure.
]


#speaker-note[
  Context accumulates and agent loops multiply cost. These companies changed the relationship between a flat fee and the resources consumed. Replit's source establishes compute billing rather than successful-outcome billing; it does not establish a universal policy of charging every failed run. Cursor offered refunds; that is not evidence every eligible user received one.
]
