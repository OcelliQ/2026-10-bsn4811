#import "/common.typ": *
#import "/citations.typ": cite-source
#import "/figures/openrouter-tokens.typ": openrouter-tokens

= The Moat

#section-subtitle[What survives when AI gets cheaper?]

== LLMflation

// `cost-vs-aaii-by-age` chart from OcelliQ/ai-models-chart: same axes as
// the lesson-1 cost charts, coloured by model release date. The arrow runs
// from the rightmost model on the "highest intelligence prior to 9 Jun 2026"
// line to GLM 5.3 Flash; its endpoints are in the SVG's own pt coordinates.
// VERIFY: "4 months" = release gap between that model and GLM 5.3 Flash.
#slide(config: config-page(margin: (x: 0em)))[
  #layout(size => {
    let (svg-w, svg-h) = (837.68055, 381.6422)
    let k = size.height / svg-h / 1pt
    let pt(x, y) = (x * k * 1pt, y * k * 1pt)
    let ink = rgb("#2a8f4f")
    align(center, box(width: svg-w * k * 1pt, height: size.height, {
      image(
        "/figures/ai-models-chart/svg-paths/cost-vs-aaii-by-age.svg",
        height: 100%,
      )
      // Sag between the two bubbles' facing edges; the head follows the
      // curve's end tangent (end minus last control point).
      let (sx, sy, ex, ey) = (695.0, 118.0, 291.0, 118.0)
      let (c1, c2) = ((620.0, 190.0), (366.0, 190.0))
      place(top + left, curve(
        stroke: 2.5pt + ink,
        curve.move(pt(sx, sy)),
        curve.cubic(pt(..c1), pt(..c2), pt(ex + 6, ey + 6)),
      ))
      let (dx, dy) = (ex - c2.at(0), ey - c2.at(1))
      let n = calc.sqrt(dx * dx + dy * dy)
      let (ux, uy) = (dx / n, dy / n)
      let head(along, across) = pt(
        ex - ux * along - uy * across,
        ey - uy * along + ux * across,
      )
      place(top + left, polygon(
        fill: ink,
        pt(ex, ey),
        head(12, 6),
        head(12, -6),
      ))
      let (lx, ly) = pt(492, 182)
      place(top + left, dx: lx - 190pt, dy: ly, box(width: 380pt, lblock(
        center: true,
        text(fill: ink, weight: "bold")[From frontier to budget in 4 months],
      )))
    }))
  })
  #pause
  #place(bottom + left, dx: 54pt, dy: -52pt, lblock(width: 60%)[
    - The price of a given capability falls *\~10× a year*
    - GPT-3-level: *\$60 → \$0.06* per million tokens in three years
  ])
]

// GLM-5.3-REVIEW: the signature number deserves its own chart - GPT-3-level
// capability $60 -> $0.06 per million tokens (a16z), log scale, over three
// years. Needs a small custom chart; the ai-models-chart figures are
// cross-sections, not a time series.
// GLM-5.3-REVIEW: Jevons counterpoint beside it - price down 10x, enterprise
// spend $11.5B -> $37B: the argument's tension in one visual.
== LLMflation: today's premium is next year's commodity

// Values with their dates in grey below, joined by rightward arrows.
#let growth(..steps) = {
  let steps = steps.pos()
  align(center, grid(
    columns: steps.len() * 2 - 1,
    align: center + horizon,
    column-gutter: 0.6em,
    row-gutter: 0.3em,
    ..steps.map(((v, _)) => strong(v)).intersperse(sym.arrow.r),
    ..steps
      .map(((_, d)) => box(text(size: 0.75em, fill: luma(120), d)))
      .intersperse([]),
  ))
}

- Yet total spend *rises*: tasks use far more tokens (Jevons' paradox)
- Enterprise GenAI spend:
  #growth(
    ([\$1.7B], [2023]),
    ([\$11.5B], [2024]),
    ([\$37B], [2025]),
    ([\$??B], [2026]),
  )
- Tokens per week on OpenRouter: *\~32×* in a year
#openrouter-tokens(height: 5.5cm)

// VERIFY: a16z "LLMflation" (Nov 2024): ~10x/year and $60 -> $0.06. Frontier
// to budget ~4 months (A* slide 16 / by-age chart).
// Enterprise GenAI spend $1.7B/$11.5B/$37B (2023-25): Menlo Ventures,
// "State of Generative AI in the Enterprise", Dec 2025 (verified; no 2026
// figure). OpenRouter weekly tokens: openrouter.ai/rankings open-closed
// series, fetched 18 Oct 2026 (4.9T -> 155T, 20 Oct 2025 -> 12 Oct 2026).

#speaker-note[
  A\* slide 70's line: "expensive value-added services may be much cheaper or obsolete in months". If your premium is "we have access to a better model", it expires.
]

== Moats that hold

What keeps your product alive when the next model does the same thing *10× cheaper*?
#v(1em)


// Helmer, _7 Powers_ (2016), plus Porter-style barriers to entry. The test
// for each row: does a 10x cheaper or better model erode it?
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  row-gutter: 1em,
  align: top,
  principle(1)[Network effects][A better model doesn't bring the users with it],
  principle(2)[Proprietary data][Labs can't train on what they can't get],

  principle(
    3,
  )[Regulatory barriers][Licences and audits are slow and expensive to copy],
  principle(
    4,
  )[Niche dominance][Too small a market for the enormous labs to chase],

  principle(
    5,
  )[Switching costs][Know-how lives in your and your customers' processes and people],
  principle(6)[Brand and trust][Worth more when output is hard to check],
)

#pause
#v(1em)
#align(center)[...and whichever moat you build, keep your models *swappable*.]


#speaker-note[
  Read each row against the LLMflation slide: if a 10× cheaper or better model arrives next quarter, does this still hold? Model access, prompt wrappers and inference-cost advantages fail that test because everyone gets the price cut at once. Whatever the moat, keep your models swappable.
]


// GLM-5.3-REVIEW (single source): revenue-per-employee bar - Midjourney at
// ~$18M per staff against the labs - quantifies "the profitable one".
== Midjourney: the profitable one

#slide(composer: grid.with(
  columns: (12cm, 1fr),
  column-gutter: 1.2em,
  align: top,
))[
  #shot(
    "N21",
    [Meta licenses Midjourney's tech, Aug 2025],
    path: "/figures/news/N21-meta-midjourney-license.png",
    url: "https://techcrunch.com/2025/08/22/meta-partners-with-midjourney-on-ai-image-and-video-models/",
    width: 100%,
    height: 100%,
    image-align: right,
  )
][
  - AI image generator, sold by subscription
  - *Jul 2022*: open beta on Discord. *No VC.*
  - *2023* \~\$200M revenue with *\~11 staff*
  - *Aug 2025*: licenses its tech *to Meta*, rather than being eaten by it
  #pause
  - *Jun 2025*: adds video
  - *Jun 2026*: Midjourney Medical, a full-body ultrasound scanner
  - Sued by Disney, Universal and WBD, but still alive and kicking.
]

// Open beta on Discord 12 Jul 2022 (Wikipedia; PCWorld). Midjourney Medical
// scanner prototype unveiled 18 Jun 2026 (Butterfly Network IR release, same
// day; Butterfly ultrasound-on-chip modules, prototype only, no FDA clearance).
// VERIFY: ~$200M 2023 revenue and ~11 staff (single source); Meta licensing
// (Aug 2025, terms undisclosed); video model V1 (Jun 2025). Co-Star
// acquisition (Jul 2026) and any Harvard link to the medical division are
// single-source.

#speaker-note[
  Midjourney owns the brand and the community, keeps costs tiny, and charges a subscription people actually pay. It sells to the giant instead of competing with it. The open legal risk is the asterisk.
]
