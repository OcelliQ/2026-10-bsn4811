# Source review for the news screenshots

These screenshots were filled on 2026-10-17. Each item below needs a look before the talk because its source is weaker than the brief asked for, or because it doesn't fully support the claim on its slide. Every capture's URL, outlet, date and supporting quote is in `figures/news/manifest.json`.

## Weaker outlet than requested

- [ ] **N02: Google's \$2.7B Character.AI deal** (`sections/03-every-message.typ`)
  - The brief asked for WSJ, Reuters, The Information or The Verge. The capture is the [New York Post](https://nypost.com/2024/09/25/business/google-paid-2-7b-to-rehire-ai-genius-who-left-for-startup/), a tabloid reporting the WSJ figure.
  - The WSJ itself couldn't be captured, and the Business Insider version cut off its date.
  - The capture is from Sep 2024, a month after the deal.
- [ ] **N10: Jasper after ChatGPT** (`sections/04-landlord.typ`)
  - The brief asked for The Information or Forbes. The capture is [Maginative](https://www.maginative.com/article/jasper-cuts-internal-valuation-as-ai-growth-slows/), a small outlet rewriting The Information's story.
  - The Information's own page was rejected because its subscribe banner covered it.
- [ ] **N11: SaaSpocalypse, Thomson Reuters −18%** (`sections/04-landlord.typ`)
  - The brief asked for Reuters, Bloomberg or FT. The capture is [The Guardian](https://www.theguardian.com/technology/2026/feb/03/anthropic-ai-legal-tool-shares-data-services-pearson).
  - Reuters and Bloomberg block headless capture.
- [ ] **N12: Builder.ai collapse** (`sections/05-meat-puppets.typ`)
  - The brief asked for Bloomberg or FT. The capture is [TechCrunch, 20 May 2025](https://techcrunch.com/2025/05/20/once-worth-over-1b-microsoft-backed-builder-ai-is-running-out-of-money/).
  - That article covers the cash crunch. The \$220M-vs-\$55M revenue restatement on the slide comes from Bloomberg (30 Jul 2025), which isn't shown.
- [ ] **N19: Anthropic's \$1.5B settlement** (`sections/06-legal.typ`)
  - The brief asked for Reuters, NYT or AP. The capture is [The Guardian](https://www.theguardian.com/technology/2025/sep/05/anthropic-settlement-ai-book-lawsuit).
- [ ] **N05: Copilot losing \~\$20/user/month** (`sections/03-every-message.typ`)
  - The capture is [The Register](https://www.theregister.com/2023/10/11/github_ai_copilot_microsoft/) relaying the WSJ figure, which the brief allowed. It's listed here only because the slide caption says "(WSJ)".

## The capture doesn't fully back the slide

- [ ] **N08: Cursor and Anthropic** (`sections/04-landlord.typ`)
  - No source was found for the \~\$650M Cursor reportedly paid Anthropic. [Newcomer](https://www.newcomer.co/p/cursors-popularity-has-come-at-a) supports \~\$500M ARR, negative gross margins and "huge Anthropic bills".
  - The slide is already softened: the bullet now says "Negative gross margins, with *huge Anthropic bills*", and the caption now quotes Newcomer.
  - Restore the stronger "paid Anthropic more than it earned" only if you find a source.
- [ ] **N03: Character.AI Chapter 11** (`sections/03-every-message.typ`)
  - [Variety](https://variety.com/2026/biz/news/disney-bids-on-character-ai-assets-chapter-11-bankruptcy-1236909984/) confirms the filing and Disney's \$20M bid, but doesn't name Delaware, which the slide says.
  - Check the docket.
- [ ] **N20: DeepSeek day** (`sections/07-moats.typ`)
  - [CNBC](https://www.cnbc.com/2025/01/27/nvidia-sheds-almost-600-billion-in-market-cap-biggest-drop-ever.html) says "almost \$600 billion", while the `// VERIFY` note says \$589B.
  - The slide only says −17%, so it's fine as it stands. Pick one figure if you say it aloud.
- [ ] **N01: Nvidia product photo** (`sections/00-hook.typ`)
  - The image is NVIDIA's official Blackwell GPU render from the [March 2024 press kit](https://nvidianews.nvidia.com/news/nvidia-blackwell-platform-arrives-to-power-a-new-era-of-computing), not an HGX board.
  - It's fine unless the slide text names a specific product.

## Sites that block capture

Reuters (Datadome), Bloomberg (403) and CBC (HTTP/2 error) all refuse headless Chromium, and the BBC page didn't resolve. To use them, take the screenshot by hand at 1600 x 1000. Then replace the PNG in `figures/news/` and the `url:` in the `shot(...)` call, and update the entry in `figures/news/manifest.json`.
