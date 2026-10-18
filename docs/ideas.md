# BSN4811 guest lecture: AI and business models (90 min)

Working notes, 2026-10-16. Sources: the A\* "Introduction to Agentic AI" deck (the PDF numbers its slides "N / 78"; the slide numbers below use those footers), `AI Platforms for BSE3713.pptx`, and web research.

**Verification tags.** Claims marked ⚠ come from a single source or an aggregator. Verify them before they go on a slide. Everything else had at least one credible source.

---

## 1. The lecture in sequence

The lecture moves down the stack and back up. The hook covers the scale of infrastructure spending. The value chain shows students where they will sit, which is the app layer. Five lessons cover the app-layer business. The close answers the question the hook raised: who makes the money?

The complete table of all 13 candidate lessons is in §6. **Dropped:** L10 (seat compression) and L11 (answer engines eat the click), which are unlikely to interest this audience. L9 (reverse acqui-hire) survives as an aside in the Character.AI story, and L8 moves to the close.

### Hook: the gold rush (0–5)

- Reuse the ai-for-clm "Gold Rush of our age" slide: US\$1.48T of AI infrastructure spending forecast for 2026 (≈5× Apollo), and 175 TWh of AI-server electricity (≈3× Singapore's consumption). Its sources are in ai-for-clm `01-intro/media/industry-landscape/GOLD-RUSH-SOURCES.md`.
- Mention energy and chips only briefly: "Here's an NVIDIA B200. To keep up with it you'd need ??? arithmetic geniuses. A datacentre typically has ? of them, and a frontier model trains on ??? for ? months continuously." Fill-in guesses to verify (§5):
  - One B200 does ~10^15–10^16 low-precision operations a second. At one sum per second per person, that is about a million Earths of people.
  - A large datacentre: Colossus 1 has more than 220,000 GPUs and 300 MW.
  - A frontier run: tens of thousands to ~100,000 GPUs for a few months. Labs don't publish this, so cite an estimate (Epoch AI).
- Leave the question open: who earns back US\$1.48T a year? The close answers it.

### Crash course (5–20)

A\* slides 11–13 (fancy autocomplete, tokens, stochastic), 14–17 (cost scatter: 3 orders of magnitude, frontier→budget in 4 months; swap the A\* scatter for the latest ai-models-chart chart, see §4) and 19 (agent = LLM + harness). Add **one** slide from BSE3713 38–39 (training cost table, plus the point that a model is a depreciating asset). Close on A\* 23 (five failure modes) as the bridge to liability.

A\* slides 8 (gold rush) and 9 (who controls what) are dropped because the hook and the value chain now cover them.

### Business-model primer (20–35)

1. **The value chain** (slide notes below): four layers, the inputs feeding each one, and the two legal side items.
2. **The pricing menu**: per-token API / flat subscription / freemium + ads / per-seat / usage credits / outcome-based.
3. **SaaS vs AI unit economics**: 75–85% vs 50–60% gross margin, and why.
4. **Live exercise** (below).

#### Value-chain slide: inputs feeding each layer

Four layers: chips → infra → models → apps. Students will mostly build apps and consume apps and models, so the rest of the lecture lives at the top of the stack. On the slide, show outside inputs merging into the chain:

- **Chips** ← TSMC and wafer fabs, ASML lithography, rare earths and critical minerals, HBM memory.
- **Infra** ← energy (grid capacity, power stations, Singapore's datacentre roadmap), land, cooling and water.
- **Models** ← data (and its copyright), research talent (link to L9).
- **Apps** ← distribution and the customer relationship.

Two separate legal side items come in from the top. Both set up lesson 4.

- **Liability → apps.** Liability for what the model says or does stays with whoever faces the customer. This value isn't extracted from the chain; the risk simply lands on the app.
- **Extraction ← models.** Copyright settlements, licensing deals and regulatory fines draw value out of the chain, mostly at the model layer. This is the other side of the "data (and its copyright)" input, and it is a significant line item.
  - **TODO:** find more EU examples, especially around Mistral. Leads to verify: Mistral's lobbying on the AI Act's GPAI rules, its signing of the Code of Practice, the EU and French regulators' look at its Microsoft investment, and its news licensing deals (AFP?).

Reuse the ai-for-clm "Who Controls What in AI" slide (`01-intro/chapter/01-industry-landscape.typ`), which already splits the bottom layer into model dev, chips, power, data centres and network.

#### Live exercise: "price my homework bot" (5 min, back-of-envelope)

The setup is a $10/month AI tutor running on a mid-tier model at $3 per million tokens in and $15 per million out.

- One question with the conversation so far as context is ~5k tokens in and ~1k out. That costs about **$0.03**.
- A light user asks 100 questions a month, which costs **$3**. That is 70% gross margin, so it looks like SaaS.
- A heavy user asks 3,000 a month, which costs **$90**. That is a −800% margin.
- Turn it into an agent with ~50 model calls per task and even the light user costs about $150.

Ask the class to pick a pricing model that fixes this, then reveal what Cursor, Anthropic and Replit actually did, and the backlash that followed. The point is that context accumulates and agent loops multiply cost, so L3 and L7 come together on a single slide.

### Five lessons (35–78, ~8.5 min each)

Each lesson gets one headline case told as a story, 1–2 rapid-fire supporting cases and one discussion question. Case facts are in §3.

#### Lesson 1. Every message costs money (L3 + L4)

- **Thesis:** SaaS has ~0 marginal cost, so heavy users are pure profit. AI has a per-token cost, so on a flat plan heavy users are pure loss. It's like a gym subscription: the flat fee only works because most members rarely show up. Engagement, the metric consumer apps chase, becomes a cost, and highly engaged users also bring safety and legal exposure.
- **Headline case:** Character.AI. A beloved product with millions of devoted users, compute costs far above revenue, the Google reverse acqui-hire (L9 aside), and then Chapter 11 ⚠.
- **Rapid-fire:** ChatGPT Pro losing money at $200. Copilot losing ~$20/user/month on a $10 plan. Harvey gross margin reportedly around -50% in June 2026, with the company reporting positive margins again in September (Contrary Research, October 5, 2026). Also Claude Code weekly limits, Cursor's credit switch and apology, and Replika.
- **Discussion:** the live exercise already raised it. Which pricing model would you pick for the homework bot, and what does it do to your heaviest users?

#### Lesson 2. Your supplier is your competitor and your landlord (L1 + L2)

- **Thesis:** whatever sits one layer below you can absorb your product as a feature, and it sees your usage data first. If your product is someone else's model, they can also raise the rent, change the terms or evict you.
- **Headline case:** Cursor and Windsurf. Anthropic cut Windsurf's access with <5 days' notice, then Google took its people. Cursor reportedly paid Anthropic more than it earned ⚠ while competing with Claude Code, and then built its own model on open-weight Kimi.
- **Rapid-fire:** chat-with-PDF apps killed by ChatGPT file upload. Jasper. The Feb 2026 SaaSpocalypse (Thomson Reuters −18% in a day).
- **Discussion:** you're building on a frontier model's API. What would make you hard to replace the day the lab ships your feature?

#### Lesson 3. Meat puppets and crumple zones (L5 + L5b)

- **Thesis:** "AI" on the label is often people in a call centre. That is fine as a disclosed Wizard-of-Oz MVP and fraud if you sell it as automation, and it hides the true unit economics. The inverse is the moral crumple zone: the AI does the work, and a human exists mainly to absorb the blame.
- **Headline case:** Builder.ai (from a $1.5B valuation to insolvency). Present the "humans posing as AI" framing carefully, since it is partly disputed.
- **Rapid-fire:** Nate, Presto, Amazon Just Walk Out. On the crumple-zone side, Klarna replacing 700 agents and then rehiring humans.
- **Discussion:** when is a human behind the curtain a legitimate MVP, and when does it become fraud?

#### Lesson 4. Liability and extraction: the legal line item (L6 + L12)

Pays off the two legal side items on the value-chain slide.

- **Liability (apps layer):** courts treat the bot as you, so every model failure mode is a business risk you carry. Your students build apps, so this lands on them. Cases: Air Canada / Moffatt, the Chevy $1 Tahoe, DPD, Replit's agent deleting a production database.
- **Extraction (models layer):** copyright, licensing and regulation take value out of the chain at a scale comparable to COGS. Cases: Bartz v. Anthropic ($1.5B), NYT v. OpenAI, Disney/Universal/WBD v. Midjourney, Getty v. Stability, Garante's fines, EU AI Act fines up to 3% of turnover. Add EU and Mistral examples (TODO above).
- **Bridge to lesson 5:** compliance favours incumbents who can afford it, so regulation is also a moat.
- **Discussion:** is this extraction, or the cost of doing business? (Moffatt got their refund rightly.)

#### Lesson 5. Moats: which evaporate, which hold (L7 + L13)

- **Failed moats:** the price of a given capability falls ~10×/year and the frontier reaches budget tier in ~4 months, so anything you charge a premium for today is a commodity next year. Total spend still rises, because tokens per task explode (Jevons). Cases: a16z LLMflation, DeepSeek day (Nvidia −17%), A\* slide 70.
- **Moats that hold:** own the customer, the workflow, the data or the brand, and keep your models swappable. Headline case: Midjourney (no VC, subscription-only, tiny team, profitable; it licenses to Meta rather than being eaten by it). Also Cursor's own models and the legal and health verticals. Compliance as a moat follows from lesson 4.
- **Discussion:** what happens to your product when the model it runs on is 10× cheaper?

### Close, part 1: follow the heavy user's \$10 (78–82)

Bring back the homework bot from the live exercise and trace its **heavy user** through the stack as a Sankey diagram. This is the chosen visual, so build it properly.

- **Inflows:** \$10/month from the user, plus **investor money** entering at the app layer and at the model layer.
- **The app layer:** it receives \$10 but pays the lab ~\$90 for that user's tokens, so roughly \$80 of VC money has to come in to cover the gap.
- **The model layer:** it passes inference compute down to the cloud. Training and R&D, which are not covered by the user's tokens, are funded by investor money too.
- **Further down:** the cloud pays Nvidia, and the flow comes out wider than what the user paid in.
- **The punchline:** more money reaches Nvidia than the user ever paid. The difference is investor money, so the stack runs on a subsidy.
- The split between layers is illustrative. Derive it from the exercise numbers plus a stated lab gross margin and cloud margin (⚠, label them as assumptions), and label the slide "illustrative".
- Optional: put the light user's Sankey beside it ($10 in, ~$3 out, no investor inflow needed) so the contrast is visible at a glance.

### Close, part 2: who makes the money? (82–88)

Answers the hook's question by going layer by layer (L8: value flows to the scarce layer).

**Metric: use operating margin ("profit per \$1 of revenue"), not gross margin.** On gross margin the labs are positive (~40–60% on inference ⚠). They lose money on training, research staff and free users, which shows up only in operating margin.

**Visualization (TODO when building the deck):** mock up all three options below as slides and pick one.

1. **Profit pool map** (Bain; Gadiesh & Gilbert, HBR 1998). One bar per layer: width = share of revenue, height = operating margin. Loss-making layers sit below zero, and each bar is split into companies with logos. The app layer is thin, so give it a call-out or a minimum width.
2. **Logo strips.** Four stacked number lines, one per layer, on a shared operating-margin axis (~−150% to +80%) with a heavy zero line. Put logos on each line, optionally scaled by revenue. Best for showing the spread within the app layer.
3. **ETF-style treemap.** Area = revenue, colour = margin on a diverging scale. Familiar, but colour reads imprecisely and the apps shrink to slivers.

Data caveats for all three:

- Labs inside a profitable parent (DeepMind, Meta) have no reported margin. Show them hatched, not estimated.
- Private-company figures are ⚠, so cite them on the slide.
- Use trailing twelve months throughout, since Nvidia reports quarterly and others report run-rates.
- Revenue double-counts down the stack. That's normal for a profit pool, but note it.

| Layer | Who makes the money | Cases |
| --- | --- | --- |
| Chips | Clearly winning | Nvidia FY27 Q2: $96.2B revenue, 75% gross margin. |
| Infra | Unclear | Record capex on GPUs that lose value within a few years; neoclouds such as CoreWeave borrowing heavily. Figures to source (§5). |
| Models | Standalone labs lose money | OpenAI reportedly loses ~$1.22 per $1 of revenue ⚠, and Anthropic's figures are run-rate revenue, not profit. Labs inside profitable parents (Google DeepMind, Meta) can afford to commoditize models, and open weights are how they do it. |
| Apps | Varies wildly | Midjourney profitable, Cursor around break-even, Character.AI bankrupt. These are the cases already told, so this row is the recap. |

End on the L13 checklist, applied to the app layer: Do you own the customer? Can you swap models? Does a heavy user make or lose you money? Who is liable? What happens when the model is 10× cheaper?

### Buffer / Q&A (88–90)

---

## 2. Run sheet (summary)

| Time | Block | Content |
| --- | --- | --- |
| 0–5 | **Hook** | Gold rush: US\$1.48T, 175 TWh, the B200 fill-in questions. |
| 5–20 | **Crash course** | A\* 11–17, 19, 23; BSE3713 38–39. |
| 20–35 | **Business-model primer** | Value chain with inputs and legal side items, pricing menu, SaaS vs AI unit economics, live exercise. |
| 35–78 | **Five lessons** | L3+L4, L1+L2, L5+L5b, L6+L12, L7+L13. |
| 78–88 | **Close** | Sankey of the homework bot's heavy user, with investor money. Then who makes the money, layer by layer (L8), and the L13 checklist. |
| 88–90 | **Buffer / Q&A** | |

---

## 3. Master list of cases (facts for slides)

### Headline cases

**Character.AI** (L4, L9, L12, L3)

- 2021: founded by ex-Google researchers Shazeer and de Freitas. In Mar 2023 it was valued at more than $1B.
- Aug 2024: Google paid ~$2.7B to license the technology and rehire the founders. The company itself stayed independent.
- Oct 2024: Garcia sued over the suicide of 14-year-old Sewell Setzer. State suits from Kentucky and Pennsylvania followed. The cases were settled with Google in early 2026 ⚠.
- 25 Nov 2025: open-ended chat banned for under-18s; the company pivoted from "companion" to "role-play platform".
- Monetization ⚠ (Futurism, citing bankruptcy filings):
  - revenue grew from $2.8M/month (Dec 2025) to $5.3M/month (Aug 2026);
  - operating losses ran $8–9M/month;
  - compute cost $56M over Jan–Aug 2026;
  - ads were added in mid-2025 and in-app purchases in early 2026.
- **Chapter 11, D. Del., 12–13 Oct 2026** ⚠. Disney is the stalking-horse bidder at $20M for a non-exclusive IP licence.
  - Conflict on the CEO: reports name Karandeep Anand, who has reportedly left for Disney, but another source says "Colin Adams". Check this.

**Midjourney** (L13, L12)

- Bootstrapped with no VC, subscription-only, started Discord-first.
- Reportedly ~$200M revenue in 2023 with ~11 staff ⚠. A lawsuit cites ~$300M and ~20M users ⚠.
- Product and deals:
  - Video model V1 launched Jun 2025.
  - Licensing partnership with Meta, Aug 2025 (terms undisclosed).
  - Acquired Co-Star, Jul 2026 ⚠.
  - Medical division with Harvard, Jun 2026 ⚠.
- Sued by Disney and Universal (Jun 2025) and WBD (Sep 2025). The cases are consolidated and in discovery, with no ruling yet.
- The "hardware pivot" story is unverified, so drop it unless you have a source.

**Cursor / Anysphere** (L1, L2, L3)

- Fastest company to $100M ARR. ARR estimates since conflict (⚠): $1B (Oct 2025), $2–2.7B (early 2026), ~$4B (Jun 2026).
- Jun 2025: switched from 500 requests to $20 of credits. The CEO apologised on 4 Jul and refunded charges.
- Newcomer ⚠ reported an estimated ~$650M/year paid to Anthropic against ~$500M revenue.
- Built its own Composer model (Nov 2025). Composer 2 at $0.50/$1.50 is reportedly built on Kimi K2.5. Margins reportedly turned slightly positive afterwards.
- **SpaceX $60B all-stock acquisition** announced 16 Jun 2026 ⚠. Closing is not confirmed.

**Windsurf** (L2, L9)

- OpenAI's ~$3B acquisition talks stalled over Microsoft's IP rights. Separately, Anthropic cut its Claude access in Jun 2025.
- Jul 2025: Google paid $2.4B for a licence plus the CEO and key researchers. A few days later Cognition bought the remainder.
- This is the best single slide for L2 and L9 together.

**Builder.ai** (L5)

- Marketed "Natasha the AI", which would build apps "like ordering pizza". Microsoft-backed and valued at ~$1.5B.
- Bloomberg (2025) reported round-tripping with VerSe. Audited 2024 revenue was ~$55M against $220M told to investors ⚠.
- Viola Credit swept $37M and the company went insolvent in May 2025. There are SDNY and SEC probes.
- Nuance: the "700 Indian engineers posing as AI" framing is partly disputed, since some AI components were real. Present it carefully.

**Klarna** (L5b, L10)

- Feb 2024: said AI did the work of 700 customer-service agents, worth $40M of profit.
- Aug 2024: said it would "shut down Salesforce and Workday". In practice it replaced them with other SaaS such as Deel.
- 2025: the CEO said the result was "lower quality" and Klarna rehired human agents (A\* slide 43).
- IPO at $40 in Sep 2025; ~$19 by Jul 2026 ⚠.

### Supporting cases (rapid-fire)

- **Inflection/Pi** (L9): raised $1.3B. Microsoft took Suleyman and staff in Mar 2024 plus a ~$650M licence. The remainder pivoted to enterprise.
- **Adept, Covariant** (L9): Amazon reverse acqui-hires in 2024. Covariant reportedly paid ~$380M to stay just above the HSR threshold ⚠. The FTC looked at Adept.
- **Scale AI** (L9, L1): Meta paid $14.3B for 49% (Jun 2025). Google (~$200M/year planned), OpenAI and Microsoft then left as customers, and ~14% of staff were laid off. The lesson is that neutrality was the product.
- **Jasper** (L1): Series A of $125M at $1.5B in Oct 2022, and ChatGPT launched a month later. Valuation and ARR forecast were cut and the founders stepped down (Sep 2023).
- **Humane AI Pin / Rabbit R1** (L1, L3): Humane raised ~$230M. HP bought its assets for $116M and the Pin was bricked on 28 Feb 2025. Rabbit had ~5% daily use ⚠. Hardware wrapped around someone else's model.
- **Stability AI** (L8, L12): open-sourced its models, which became a cash furnace, and its CEO left in 2024. It beat Getty in the UK (Nov 2025). In Aug 2026 it raised $76M from EA, Sony, UMG and WMG ⚠, pivoting to licensed or partner content.
- **Perplexity** (L11, L12): valued at $20B or more. Sued by News Corp, NYT (Dec 2025) and Britannica. Amazon got an injunction against the Comet shopping agent, which the 9th Circuit overturned ⚠.
- **Chegg** (L11): ~$113 → $0.44 a share. Subscribers −31% in Q1 2025. Cut 22% of staff, then 45%. Sued Google over AI Overviews.
- **Stack Overflow** (L11): Prosus bought it for $1.8B in 2021. Monthly questions fell from ~200k (2014) to ~1.4k (Jul 2026) ⚠. The decline began before ChatGPT, which is a good nuance for students. Now earns from data licensing with OpenAI and Google.
- **Intercom Fin** (L10): $0.99 per resolution. Resolution rate went from ~25% to 65–70%; Fin is ~$100M ARR, about half of Intercom ⚠.
- **Salesforce Agentforce** (L10): three pricing models in 18 months. ARR >$1.5B in Q2 FY27.
- **SaaSpocalypse, Feb 2026** (L1, L10):
  - Anthropic launched Claude Cowork and then a legal plugin.
  - On 3 Feb, Thomson Reuters fell 18% and RELX and Wolters Kluwer each fell more than 10%.
  - The SEG SaaS index was −26% YTD by March.
  - Sources disagree on the total loss, from $100B to $1T ⚠, so pick one sourced number.
- **ChatGPT Pro / GitHub Copilot / Claude Code limits** (L3): see the L3 row in the table.
- **Replit** (L3, L6): effort-based pricing charged users even when a task failed, with gross margin swinging between +36% and −14% ⚠. The agent also deleted a production database during a code freeze (A\* slide 45).
- **OpenAI itself** (L8, L4) ⚠ (all figures from aggregators; check against the S-1):
  - ~$25B ARR; projected 2026 operating loss of ~$14B;
  - 900M weekly active users, ~50M paying;
  - an $8 "Go" tier and ads in the free tier (2026);
  - a Sora app shutdown and an Atlas browser discontinuation (TechCrunch "AI graveyard", Sep 2026).
- **Anthropic** (L1, L2): run-rate went from ~$9B (end of 2025) to over $30B (Apr 2026) ⚠. Claude Code passed $2.5B. Enterprise API share is 40% vs OpenAI 27% (Menlo). It is both supplier and competitor to Cursor, legal SaaS and others.
- **Nvidia** (L8): FY27 Q2 revenue $96.2B, 75% gross margin. On DeepSeek day (27 Jan 2025) it fell 17%, losing $589B.
- **Liability trio** (L6): Air Canada (CA$812, "the bot is part of your website"), Chevy of Watsonville ($1 Tahoe), DPD (bot swore at customers).
- **Meat-puppet roll-call** (L5): Nate (SDNY charges, Apr 2025), Presto (SEC order, Jan 2025), Amazon JWO (The Information, 2024), 1X NEO "Expert Mode" teleoperation.
- **Zillow Offers** (BSE3713 slides 16–18): accurate models, but asymmetric business risk and adverse selection, leaving $6B of inventory. This is an older, non-GenAI case. Optional reuse for "test the whole business process, not just the model".
- **Vercel / Next.js** (BSE3713 slides 49–51): the open-source "costly signal" and the commoditize-your-complement logic. A ready-made bridge to open-weight models in L8.

### Regulation quick-ref (L12)

- **EU AI Act**
  - GPAI duties from Aug 2025. Enforcement from Aug 2026, with fines up to 3% of turnover or €15M.
  - Code of Practice signed by OpenAI, Anthropic, Google, Microsoft, Amazon and Mistral. Meta declined.
  - The Digital Omnibus (May 2026) delays high-risk duties to Dec 2027 or Aug 2028. Labelling and watermarking apply from Dec 2026.
  - Check that the Omnibus has been formally adopted.
- **US**
  - California SB 53 (frontier transparency, Jan 2026). California SB 243 (companion chatbots).
  - Colorado AI Act stayed, then replaced by a narrower law effective Jan 2027.
- **Copyright**
  - Bartz v. Anthropic: training on lawfully acquired books is fair use, but piracy is not. Settled for $1.5B.
  - Kadrey v. Meta found fair use. Thomson Reuters v. Ross did not (the tool was a market substitute).
  - NYT v. OpenAI: a 20M-log production order was affirmed.
- **Privacy**
  - Garante fined OpenAI €15M; a Rome court annulled it on jurisdiction grounds in Mar 2026.
  - Garante fined Replika €5M.
- **Singapore**
  - IMDA GenAI framework (May 2024) and Agentic AI framework (Jan 2026; v1.5 May 2026 per the A\* deck).
  - AI Verify and Project Moonshot.
  - PDPC AI guidelines (Mar 2024).
  - Copyright Act ss. 243–244 exception for computational data analysis.

---

## 4. Notes on reusing the source decks

- **A\* deck, slides to lift:** 8, 9, 11–17, 19, 23 (about 12 slides). Skip 2–5 (logistics, TAs) and everything from 28 on except 43 (Klarna), 45 (Replit) and 70 (vendor lock-in and future strategy).
- **A\* slide 13 has a typo**: "we have ability to predict and explain their behaviour" is missing "no".
- **Gaps in the A\* crash course for this audience:**
  - Training cost vs inference cost. BSE3713 slide 38's table fills this. Update its GPT-4o figures or label them "2024, leaked".
  - The context window, and why cost grows during a conversation. This is needed for the exercise.
  - Batch and cached pricing discounts, as one bullet only.
- **Model names and prices.** The research agent's aggregator prices (Opus 4.8, GPT-5.5) are out of date. Don't quote the aggregator tables.
- **Model price charts come from [OcelliQ/ai-models-chart](https://github.com/OcelliQ/ai-models-chart)** (note the plural "models"). They replace the A\* slide 14 cost scatter and serve as the single price source.
  - The charts plot API price per task against the Artificial Analysis Intelligence Index, without annotations, sized for the content box under a 16:9 slide title. Annotate them in this deck.
  - There are five colourings: `cost-vs-aaii` (open vs closed), `-by-lab`, `-by-lab-open`, `-by-age` and `-by-hardware`.
  - That repo's CI renders `dist/` from its committed tables on every push and uploads it as the `charts` artifact.
  - **Decision: fetch with a script, not a submodule.** `scripts/fetch-model-charts.sh` downloads `charts.zip` from that repo's public rolling [`charts` release](https://github.com/OcelliQ/ai-models-chart/releases/tag/charts) (no login) and unpacks it into the gitignored `figures/ai-models-chart/`. CI runs it before compiling.
    - Why: a submodule would only bring in the source tables, so we'd also need its Python environment to render. The release is already built.
    - Every push to that repo's `master` refreshes the release, so re-run the script close to the lecture.
  - Use `dist/svg-paths/`. The plain SVGs rely on DejaVu Sans, which isn't embedded.
  - Keep A\* slide 16 for the "frontier reaches budget tier in ~4 months" claim unless the `-by-age` chart shows it better.
- **BSE3713 deck, slides to lift:**
  - 37–39: inference and training cost, model as a depreciating asset.
  - 45–52: the *aaS stack and open-source business models.
  - 16–18 (optional): Zillow.
  - The jailbreak and alignment section (57–71) is off-topic here. Use it only if L6 needs colour.

## 5. To verify before the slides are final

1. Character.AI: filing date, CEO name, the $20M Disney bid, revenue and compute figures (get the bankruptcy docket).
2. Whether the Cursor/SpaceX deal has closed, and Cursor's true ARR.
3. OpenAI's S-1 figures (revenue, loss, users, ads), Anthropic's run-rate and Midjourney's revenue.
4. The size of the SaaSpocalypse loss: pick one sourced figure.
5. Builder.ai's revenue numbers (Bloomberg, 30 Jul 2025).
6. Stack Overflow's question count (from the Stack Exchange Data Explorer).
7. The B200 fill-in numbers for the hook, and the infra-layer figures for the close (hyperscaler capex and depreciation, CoreWeave debt).

---

## 6. Complete lesson table

All 13 candidate lessons. §1 uses L1–L8 and L12–L13, L9 as an aside, and drops L10 and L11.

| # | Meta-lesson | Thesis | Anchor cases |
| --- | --- | --- | --- |
| **L1** | **Your supplier is your competitor** (ecosystem cannibalization / "Sherlocking") | Whatever sits one layer below you in the stack can absorb your product as a feature, and it sees your usage data first. | ChatGPT PDF upload killing chat-with-PDF apps (Nov 2023). Jasper vs ChatGPT. Claude Code vs Cursor. Claude Cowork plugins triggering the Feb 2026 "SaaSpocalypse" (Thomson Reuters −18% in a day). Labs launching vertical products (Claude for Healthcare, ChatGPT Health). |
| **L2** | **Landlord risk**: you're renting your core competency | If your product is someone else's model, they can raise the rent, change the terms or evict you. | Anthropic cut Windsurf's Claude access with <5 days' notice (Jun 2025). Anthropic cut OpenAI's access (Aug 2025). Cursor reportedly paid more to Anthropic than it earned ⚠. Cursor then built Composer on open-weight Kimi. |
| **L3** | **Your best customers are your worst customers** (inverted unit economics) | SaaS has ~0 marginal cost, so heavy users are pure profit. AI has a per-token cost, so on a flat plan heavy users are pure loss. It's like a gym subscription: the flat fee only works because most members rarely show up. | Altman: "losing money" on ChatGPT Pro at $200. Copilot lost ~$20/user/month on a $10 plan (2023). Claude Code weekly limits (Aug 2025). Cursor's credit switch and apology. Replit effort-based pricing backlash. AI gross margins ~50–60% vs SaaS 75–85% (Lazard 2024). |
| **L4** | **Engagement is a cost, not an asset** (the companion trap) | When every message costs compute, a beloved free product can bleed to death. Highly engaged users also bring safety and legal exposure. | **Character.AI** (Chapter 11, Oct 2026 ⚠ details). Replika (Garante ban, €5M fine, ERP backlash). OpenAI shut down its Sora app in Mar 2026, citing operating cost and retention. |
| **L5** | **The meat puppet**: humans behind the "AI" | "AI" on the label is often people in a call centre. It is fine as a disclosed Wizard-of-Oz MVP and fraud if you sell it as automation. The meat puppet also hides the true unit economics. | **Builder.ai** (from a $1.5B valuation to insolvency, revenue ~4× inflated ⚠). **Nate** (founder charged, ~0% automation). **Presto** (SEC order: claimed 95% automated, ~70% needed humans). **Amazon Just Walk Out** (~700 of every 1,000 sales human-reviewed; Amazon disputes this). 1X NEO teleoperation. Historical: Facebook M, x.ai, Expensify. |
| **L5b** | **The moral crumple zone** (the inverse of the meat puppet) | Here the AI does the work but a human absorbs the blame, so the "human in the loop" exists mainly as a liability sponge. Elish (2019) coined the term. | Klarna: 700 agents replaced, then humans rehired because "lower quality". The A\* IMDA "humans remain accountable" slide. Optional: the review-fatigue point on A\* slide 65. |
| **L6** | **You own the output** (liability does not pass to the vendor) | Courts treat the bot as you. Every model failure mode is a business risk you carry. | Air Canada / Moffatt (the chatbot "is part of Air Canada's website"). Chevy $1 Tahoe. DPD chatbot swearing. Replit agent deleting a production database. Project Vend. The South African AI policy with fake citations. |
| **L7** | **Moats evaporate: LLMflation** | The price of a given capability falls ~10×/year (a16z), and the frontier reaches budget tier in ~4 months (A\* slide 16). Anything you charge a premium for today is a commodity next year. Total spend still *rises*, because tokens per task explode (Jevons). | A16z: GPT-3-level capability went from $60 to $0.06 per million tokens in 3 years. Reasoning and agent loops use ~50× the tokens of a single pass ⚠. Enterprise GenAI spend went from $11.5B to $37B (2024→25, Menlo). DeepSeek day: Nvidia −17%, −$589B. A\* slide 70: "expensive value-added services may be much cheaper or obsolete in months." |
| **L8** | **Who captures the value?** (the stack, and commoditizing your complement) | Value flows to the scarce layer. Right now that is chips: Nvidia has 75% gross margin, while OpenAI reportedly loses about $1.22 per $1 of revenue ⚠. Every layer tries to commoditize the layer next to it. Open weights are Meta's and China's version of the Vercel/Next.js play from BSE3713. | Nvidia FY27Q2 ($96B revenue, 75% GM). OpenAI losses. Open-weight share on OpenRouter rose to ~⅓ or more. Cursor on Kimi. BSE3713 slides 45–52 (IaaS commoditized, open source as a "costly signal"). |
| **L9** | **The talent is the asset; the company is the shell** (reverse acqui-hire) | Big Tech buys the people plus a licence, not the company. The founders get rich and the remaining employees and the cap table get the husk. | Inflection→Microsoft (~$650M licence). Character.AI→Google ($2.7B). Adept and Covariant→Amazon. Windsurf→Google ($2.4B), then Cognition bought the rest. Scale AI→Meta ($14.3B for 49%), after which Google and OpenAI left as customers. |
| **L10** | **Pricing follows the work, not the seat** (seat compression) | If AI does the work of 10 users, per-seat pricing shrinks your revenue. Vendors move to outcome or usage pricing, and *flail* along the way. | Intercom Fin at $0.99 per resolution (~$100M ARR ⚠). Zendesk at $1.50–2.00 per resolution. Salesforce Agentforce went from $2/conversation to Flex Credits to a seat-style AELA, running 3 models at once. Workday hiring freezes. Klarna "shutting down Salesforce/Workday" (in reality, swapped for other SaaS). |
| **L11** | **The answer engine eats the click** (disintermediation) | If AI answers in place, whoever monetized the click (publishers, Q&A sites, homework help) loses its traffic and its data moat in one go. | Chegg: −99%, then a 45% layoff and a suit against Google AI Overviews. Stack Overflow: questions down >99% from peak ⚠, now living on data licensing. Pew: clicks 8% with an AI summary vs 15% without. NYT and News Corp vs Perplexity. |
| **L12** | **Regulation and copyright are a line item** | Legal exposure is now a COGS-scale cost. Compliance tends to favour incumbents who can afford it. | Bartz v. Anthropic ($1.5B, ~$3k/book). Disney, Universal and WBD vs Midjourney. NYT v. OpenAI. Getty losing to Stability in the UK. EU AI Act GPAI duties (fines up to 3% of turnover), with high-risk duties delayed to Dec 2027 via the Omnibus. California SB 243 (companion chatbots, $1k per violation). Singapore's voluntary IMDA agentic framework (Jan 2026). |
| **L13** | **The survivor's playbook** (what actually defends) | Own the customer, the workflow, the data or the brand, and keep your models swappable. | **Midjourney**: no VC, subscription-only, tiny team, profitable; it *licenses to* Meta rather than being eaten by it, and is diversifying (video, Co-Star, medical ⚠). Cursor's own models. Legal and health verticals (Legora) claiming the labs are no threat. A\* slide 70: "keep data exportable, workflows portable." |
