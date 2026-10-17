// Shared data for the "profit per $1 of revenue" options (D08, D09, D10).
// Revenue is trailing-twelve-month AI-related revenue in US$ billions; margin
// is operating margin in percent. `margin: none` means no reported margin (a
// lab inside a profitable parent): draw it hatched, never estimated.
//
// VERIFY: every number below is a DUMMY placeholder of roughly the right
// size, not a sourced figure. Replace each with a cited TTM figure before the
// talk, and add the source to the slide footnote. Revenue double-counts down
// the stack (an app's spend is a lab's revenue, and so on).

#let layers = (
  (
    name: "Chips",
    companies: (
      (name: "Nvidia", revenue: 330, margin: 62),
      (name: "TSMC", revenue: 120, margin: 47),
      (name: "Broadcom", revenue: 35, margin: 40),
      (name: "AMD", revenue: 18, margin: 12),
    ),
  ),
  (
    name: "Infra",
    companies: (
      (name: "AWS", revenue: 125, margin: 36),
      (name: "Azure", revenue: 95, margin: 40),
      (name: "Google Cloud", revenue: 60, margin: 22),
      (name: "Oracle", revenue: 25, margin: 8),
      (name: "CoreWeave", revenue: 6, margin: -5),
    ),
  ),
  (
    name: "Models",
    companies: (
      (name: "OpenAI", revenue: 20, margin: -122),
      (name: "Anthropic", revenue: 12, margin: -70),
      (name: "xAI", revenue: 2, margin: -140),
      (name: "Mistral", revenue: 0.5, margin: -60),
      (name: "Google DeepMind", revenue: 8, margin: none),
      (name: "Meta (Llama)", revenue: 0, margin: none),
    ),
  ),
  (
    name: "Apps",
    companies: (
      (name: "Cursor", revenue: 1.5, margin: 0),
      (name: "Midjourney", revenue: 0.4, margin: 30),
      (name: "Perplexity", revenue: 0.3, margin: -90),
      (name: "Character.AI", revenue: 0.05, margin: -150),
    ),
  ),
)

// Under the stack: fab equipment makers (the hook's bedrock row). Kept out of
// `layers`, which the profit pool map indexes by position.
#let bedrock-layer = (
  name: "Bedrock",
  companies: (
    (name: "ASML", revenue: 33, margin: 34),
    (name: "Applied Materials", revenue: 28, margin: 29),
    (name: "Lam Research", revenue: 18, margin: 31),
    (name: "Tokyo Electron", revenue: 16, margin: 26),
  ),
)

// Shared styling so the three options look alike.
#let layer-colors = (
  Bedrock: rgb("#5a6b70"),
  Chips: rgb("#2e7d32"),
  Infra: rgb("#6b7f8e"),
  Models: rgb("#c62828"),
  Apps: rgb("#EB811B"),
)
#let gain = rgb("#2e7d32")
#let loss = rgb("#c62828")
#let data-note = [Illustrative placeholder figures. TTM revenue (US\$B) and operating margin. Revenue double-counts down the stack.]
