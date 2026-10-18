# Source review for the news screenshots

These screenshots were filled on 2026-10-17. Each item below needs a look before the talk because its source is weaker than the brief asked for, or because it doesn't fully support the claim on its slide. Every capture's URL, outlet, date and supporting quote is in `figures/news/manifest.json`.

## Replaced with manual captures

N02 (WSJ), N05 (WSJ), N10 (The Information), N11 (Reuters), N12 (Bloomberg) and N19 (AP) were recaptured by hand from the outlets the brief asked for. One item is still open:

- [ ] **N11: Reuters URL** (`sections/05-landlord.typ`)
  - The screenshot is Reuters, but the `url:` is [Yahoo Finance's syndicated copy](https://finance.yahoo.com/news/anthropics-ai-tools-deepen-selloff-054551832.html). The reuters.com address couldn't be confirmed, since Reuters blocks automated lookups.
  - Paste the reuters.com URL into the slide and `figures/news/manifest.json`.

## The capture doesn't fully back the slide

- [ ] **N08: Cursor and Anthropic** (`sections/05-landlord.typ`)
  - No source was found for the \~\$650M Cursor reportedly paid Anthropic. [Newcomer](https://www.newcomer.co/p/cursors-popularity-has-come-at-a) supports \~\$500M ARR, negative gross margins and "huge Anthropic bills".
  - The slide is already softened: the bullet now says "Negative gross margins, with *huge Anthropic bills*", and the caption now quotes Newcomer.
  - Restore the stronger "paid Anthropic more than it earned" only if you find a source.
- [ ] **N03: Character.AI Chapter 11** (`sections/04-every-message.typ`)
  - [Variety](https://variety.com/2026/biz/news/disney-bids-on-character-ai-assets-chapter-11-bankruptcy-1236909984/) confirms the filing and Disney's \$20M bid, but doesn't name Delaware, which the slide says.
  - Check the docket.
- [x] **N20: DeepSeek day**: removed from `sections/08-moats.typ` (replaced by OpenRouter token volumes).
- [ ] **N01: Nvidia product photo** (`sections/00-hook.typ`)
  - The image is NVIDIA's official Blackwell GPU render from the [March 2024 press kit](https://nvidianews.nvidia.com/news/nvidia-blackwell-platform-arrives-to-power-a-new-era-of-computing), not an HGX board.
  - It's fine unless the slide text names a specific product.

## Sites that block capture

CBC (HTTP/2 error) refuses headless Chromium, and the BBC page didn't resolve; Reuters, Bloomberg and WSJ also block it, so those were captured by hand. To use them, take the screenshot by hand at 1600 x 1000. Then replace the PNG in `figures/news/` and the `url:` in the `shot(...)` call, and update the entry in `figures/news/manifest.json`.
