# BSN4811 guest lecture: AI and business models (90 min)

Working notes, 2026-10-16. Sources: the A\* "Introduction to Agentic AI" deck (the PDF numbers its slides "N / 78"; the slide numbers below use those footers), `AI Platforms for BSE3713.pptx`, and web research.

**Verification tags.** Claims marked ⚠ come from a single source or an aggregator. Verify them before they go on a slide. Everything else had at least one credible source.

---

## 1. Meta-lessons (the spine of the lecture)

Each lesson has a name, a one-line thesis and its anchor cases.

| # | Meta-lesson | Thesis | Anchor cases |
| --- | --- | --- | --- |
| **L1** | **Your supplier is your competitor** (ecosystem cannibalization / "Sherlocking") | Whatever sits one layer below you in the stack can absorb your product as a feature, and it sees your usage data first. | ChatGPT PDF upload killing chat-with-PDF apps (Nov 2023). Jasper vs ChatGPT. Claude Code vs Cursor. Claude Cowork plugins triggering the Feb 2026 "SaaSpocalypse" (Thomson Reuters −18% in a day). Labs launching vertical products (Claude for Healthcare, ChatGPT Health). |
| **L2** | **Landlord risk**: you're renting your core competency | If your product is someone else's model, they can raise the rent, change the terms or evict you. | Anthropic cut Windsurf's Claude access with <5 days' notice (Jun 2025). Anthropic cut OpenAI's access (Aug 2025). Cursor reportedly paid more to Anthropic than it earned ⚠. Cursor then built Composer on open-weight Kimi. |
| **L3** | **Your best customers are your worst customers** (inverted unit economics) | SaaS has ~0 marginal cost, so heavy users are pure profit. AI has a per-token cost, so on a flat plan heavy users are pure loss. It's like a gym subscription: the flat fee only works because most members rarely show up. | Altman: "losing money" on ChatGPT Pro at $200. Copilot lost ~$20/user/month on a $10 plan (2023). Claude Code weekly limits (Aug 2025). Cursor's credit switch and apology. Replit effort-based pricing backlash. AI gross margins ~50–60% vs SaaS 80–90%. |
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

**Recommendation.** Thirteen lessons is too many for 90 minutes. Teach **6 headline lessons** and fold the rest in:

1. **L3 + L4**: "Every message costs money" (unit economics; Character.AI)
2. **L1 + L2**: "Your supplier is your competitor and your landlord" (Cursor/Windsurf; SaaSpocalypse)
3. **L5 + L5b**: "Meat puppets and crumple zones" (Builder.ai; Klarna)
4. **L7 + L8**: "Moats evaporate; value flows to the scarce layer" (LLMflation; Nvidia vs OpenAI; DeepSeek)
5. **L10 + L11**: "Pricing follows the work; answers eat clicks" (Intercom Fin; Chegg)
6. **L6 + L12**: "You own the output and the lawsuit" (Air Canada; Bartz; Midjourney/Disney)

Finish on **L13**, the survivor's playbook with Midjourney, as the positive counter-case. L9 (reverse acqui-hire) makes a good aside inside the Character.AI story.

---

## 2. Proposed 90-minute run sheet

| Time | Block | Content | Source |
| --- | --- | --- | --- |
| 0–5 | **Hook** | "This week, a company Google paid $2.7B to license (and hire its founders from) filed for bankruptcy. Disney opened bidding at $20M." Then ask: how does an app with millions of devoted users go broke? | Character.AI ⚠ |
| 5–25 | **Crash course** | A\* slides 8 (gold rush scale), 9 (who controls what), 11–13 (fancy autocomplete, tokens, stochastic), 14–17 (cost scatter: 3 orders of magnitude, frontier→budget in 4 months), 19 (agent = LLM + harness). Add **one** slide from BSE3713 38–39 (training cost table, plus the point that a model is a depreciating asset). Close on A\* 23 (five failure modes) as the bridge to liability. | A\* 8–19, 23; BSE 38–39 |
| 25–40 | **Business-model primer** | (a) The stack, using BSE3713's *aaS ladder updated with chips → cloud → labs → apps. (b) The pricing menu: per-token API / flat subscription / freemium + ads / per-seat / usage credits / outcome-based. (c) **SaaS vs AI unit economics**: 80–90% vs 50–60% gross margin, and why. (d) **Live exercise** (below). | BSE 45–56; research |
| 40–80 | **Six lessons × ~6.5 min** | Each lesson gets one headline case told as a story, 1–2 rapid-fire supporting cases and one discussion question. | §1 |
| 80–88 | **Survivor's playbook** | Midjourney as the counter-case. A checklist for spotting a defensible AI business: Do you own the customer? Can you swap models? Does a heavy user make or lose you money? Who is liable? What happens when the model is 10× cheaper? | L13 |
| 88–90 | **Close** | Return to the hook: which of the six lessons killed Character.AI? (Answer: nearly all of them.) | |

### Live exercise: "price my homework bot" (5 min, back-of-envelope)

The setup is a $10/month AI tutor running on a mid-tier model at $3 per million tokens in and $15 per million out.

- One question with the conversation so far as context is ~5k tokens in and ~1k out. That costs about **$0.03**.
- A light user asks 100 questions a month, which costs **$3**. That is 70% gross margin, so it looks like SaaS.
- A heavy user asks 3,000 a month, which costs **$90**. That is a −800% margin.
- Turn it into an agent with ~50 model calls per task and even the light user costs about $150.

Ask the class to pick a pricing model that fixes this, then reveal what Cursor, Anthropic and Replit actually did, and the backlash that followed. The point is that context accumulates and agent loops multiply cost, so L3 and L7 come together on a single slide.

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
- **Model names and prices.** The research agent's aggregator prices (Opus 4.8, GPT-5.5) are older than the models on A\* slide 14. Use the A\* chart (Artificial Analysis, current) as the single price source and don't quote the aggregator tables.
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
