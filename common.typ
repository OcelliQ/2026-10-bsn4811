// Shared helpers for all slide decks in this repo.
// Import what you need, e.g.:  #import "/common.typ": gblock, lblock, big-section-slide
#import "@preview/touying:0.7.4": *
#import themes.metropolis: *
#import "/citations.typ": cite-source

#let news-sources = json("/figures/news/manifest.json")

// Custom section divider: mirrors metropolis' new-section-slide but with a
// larger title and the section number styled like the principle index
// (big, bold, grey). Wire in via the theme:
//   #show: metropolis-theme.with(config-common(new-section-slide-fn: big-section-slide), ...)
#let big-section-slide(
  config: (:),
  level: 1,
  numbered: true,
  body,
) = touying-slide-wrapper(self => {
  let slide-body = {
    set std.align(horizon)
    show: pad.with(x: 12%, y: 20%)
    set text(size: 1.9em)
    // Number hangs in its own column, to the left of the centred title block.
    let section-number = text(weight: "bold", size: 3em, fill: luma(160))[
      #utils.display-current-heading(
        level: level,
        numbered: numbered,
        style: (
          setting: body => body,
          numbered: true,
          current-heading,
        ) => setting({
          if numbered and current-heading.numbering != none {
            numbering(
              current-heading.numbering,
              ..counter(heading).at(current-heading.location()),
            )
          }
        }),
      )
    ]
    let section-title = utils.display-current-heading(
      level: level,
      numbered: numbered,
      style: (
        setting: body => body,
        numbered: true,
        current-heading,
      ) => setting(
        current-heading.body,
      ),
    )
    // Title row: number hangs left of the title and bar only, so a
    // following epigraph does not pull the numeral down.
    grid(
      columns: (1fr, 16cm, 1fr),
      column-gutter: .8em,
      row-gutter: 0pt,
      align: (right + bottom, left + bottom),
      section-number,
      stack(
        dir: ttb,
        spacing: .3em,
        text(self.colors.neutral-darkest, section-title),
        block(
          height: 2pt,
          width: 100%,
          spacing: 0pt,
          components.progress-bar(
            height: 2pt,
            self.colors.primary,
            self.colors.primary-light,
          ),
        ),
      ),
      [],
      // Keep the section body in the next row of the same grid, directly
      // below the bar, without paragraph spacing between separate grids.
      [],
      {
        set text(size: 20pt, fill: self.colors.neutral-dark)
        body
      },
    )
  }
  self = utils.merge-dicts(self, config-page(
    fill: self.colors.neutral-lightest,
  ))
  touying-slide(self: self, config: config, slide-body)
})

// Grey filled block --- used for callouts / definition boxes.
#let gblock-center = center
#let gblock(
  body,
  inset: (x: 0em, y: 0.4em),
  outset: (x: 0.4em, y: 0.4em),
  width: 100%,
  center: false,
) = block(
  fill: luma(235),
  inset: inset,
  outset: outset,
  radius: 0.4em,
  width: width,
)[
  #{
    if center {
      set align(gblock-center)
      body
    } else {
      body
    }
  }
]

// White bordered block --- lighter-weight callout.
#let lblock-center = center
#let lblock(
  body,
  inset: (x: 0em, y: 0.4em),
  outset: (x: 0.4em, y: 0.4em),
  width: 100%,
  height: auto,
  fill: white,
  center: false,
) = block(
  fill: fill,
  stroke: 0.5pt + luma(220),
  inset: inset,
  outset: outset,
  radius: 0.4em,
  width: width,
  height: height,
)[
  #{
    if center {
      set align(lblock-center)
      body
    } else {
      body
    }
  }
]

// Metropolis default primary --- use for bars, accents, comparison "good" sides.
#let accent = rgb("#EB811B")

// Subtitle for a `=` section slide, set 0.4em below the title bar. Like
// `section-quote`, it goes in the section body. Put it before any quote.
#let section-subtitle(body) = {
  v(0.4em)
  block(
    above: 0pt,
    below: 0pt,
    text(size: 1.1em, fill: luma(110), body),
  )
}

// Epigraph for a `=` section slide. Lives in the section body so
// `big-section-slide` can place it under the title instead of on the next slide.
#let section-quote(quote, by) = {
  v(1.15em)
  block(
    width: 100%,
  )[
    #set text(size: 1.05em, style: "italic", fill: luma(70))
    #set par(leading: 0.5em)
    "#quote"
    #v(0.0em)
    #align(right, text(size: 0.72em, style: "normal", fill: luma(110))[--- #by])
  ]
}

// Grey titled box that fills its grid cell. From 01-introduction.
#let aside(title, body) = box(
  fill: luma(240),
  width: 100%,
  height: 100%,
  radius: 0.5em,
  inset: 0.5em,
  grid(
    rows: (2em, 1fr),
    align: horizon,
    text(weight: "bold", size: 1.5em)[#title],
    body,
  ),
)

// Horizontal percentage bar. `pct` is 0-100.
#let hbar(label, pct, fill: accent) = grid(
  columns: (9.2em, 1fr, 2.6em),
  column-gutter: 0.45em,
  align: horizon,
  text(size: 0.82em)[#label],
  box(width: 100%, height: 0.72em, fill: luma(230), radius: 0.12em)[
    #place(left, box(
      width: 100% * (pct / 100),
      height: 100%,
      fill: fill,
      radius: 0.12em,
    ))
  ],
  align(right, text(size: 0.82em, weight: "bold")[#pct%]),
)

// Survival rates "because" failure causes, with the source note. Used twice:
// once when introducing failure, once when coming back to it. `aside` rides in
// the spare column on the right --- pass an `uncover(..)` to reveal a question.
#let failure-stats(aside: none) = {
  let pct(n) = [
    #text(size: 4em)[#n]#text(size: 1.0em, baseline: -1.6em)[%]
  ]

  let survival = grid(
    columns: (auto, auto),
    column-gutter: 0.45em,
    row-gutter: 1.5em,
    align: (right + horizon, left + horizon),
    ..(([1 year], 20), ([3 years], 39), ([5 years], 50), ([10 years], 65))
      .map(((l, n)) => (text(size: 1em)[#l], pct(n)))
      .flatten()
  )

  let causes = grid(
    columns: (auto, auto),
    column-gutter: 0.45em,
    row-gutter: 1.0em,
    align: (right + horizon, left + horizon),
    ..(
      (38, [Financial Issues]),
      (35, [Lack of Market Need]),
      (20, [Competition]),
      (19, [Business Model]),
      (18, [Legal Challenges]),
    )
      .map(((n, l)) => (pct(n), text(size: 1em)[#l]))
      .flatten()
  )

  // ponytail: bracket measures the taller column so it tracks the chart's own height
  let bracket(side) = context {
    let s = 1.2pt + accent
    box(
      width: 0.5em,
      height: calc.max(measure(survival).height, measure(causes).height),
      stroke: (top: s, bottom: s) + side,
    )
  }

  grid(
    columns: (auto, auto, auto, auto, auto, 1fr),
    column-gutter: 0.6em,
    align: horizon,
    align(right, survival),
    bracket((right: 1.2pt + accent)),
    [
      #pause
      because
    ],
    bracket((left: 1.2pt + accent)),
    align(left, causes),
    // ponytail: aside rides in the leftover column, so the chart keeps its own metrics
    align(center, aside),
  )

  align(bottom + right)[
    #text(size: 0.62em, fill: luma(110))[
      Numbers from the US. See
      #link("https://www.forbes.com/advisor/business/software/startups-failure-rate/")[forbes.com/advisor/business/software/startups-failure-rate/].
    ]
  ]
}

// Card used in the great-filters grid.
// Two rows: title row is fixed-height and bottom-aligned so titles sit on a
// common baseline whether they wrap to one line or two.
#let filter-card(title, items) = grid(
  rows: (2.2em, auto),
  align: bottom,
  row-gutter: 0.8em,
  text(weight: "bold", size: 1em)[#title],
  {
    set text(size: 0.72em)
    for it in items [#it #v(0em)]
  },
)

// The six startup stages, in order. Also the column basis for `stage-strip`.
#let stages = (
  "Idea",
  "Prototyping",
  "Go-to-market",
  "Early Growth",
  "Growth",
  "Maturity",
)

// Column track for anything that must line up under `stage-strip`:
// six equal stage columns plus the arrowhead's own column. Pair it with
// `column-gutter: 0.3em`.
#let stage-cols = (..stages.map(_ => 1fr), 0.7em)

// Reusable "Idea → … → Maturity" header: six pills on an arrow band.
// Call it as the FIRST thing in a slide body --- the fixed height is what keeps
// it in the same place from slide to slide.
//   #stage-strip()                      // all neutral
//   #stage-strip(active: "Prototyping") // highlight the stage this slide is about
#let stage-strip(active: none, height: 2.5em) = {
  let head = 0.7em // arrowhead width; the band stops short by this much
  let bleed = 0.7em // band pokes out to the left of the first pill
  let band-h = 0.58em // thin ribbon running through the middle of the pills
  let head-h = 1.2em
  // ponytail: head is a flat swatch of the gradient's end colour, so it reads
  // as one shape without having to share a gradient across two elements
  let band-end = accent.transparentize(72%)
  // Active pill matches the "founding employee" band: pale accent, accent border.
  let pill(name) = box(
    width: 100%,
    height: 2.0em,
    radius: 0.25em,
    // lighten, not transparentize --- the ribbon must not show through the pill
    fill: if name == active { accent.lighten(82%) } else { luma(224) },
    stroke: if name == active { 0.8pt + accent },
  )[
    #align(center + horizon)[
      #text(
        size: 0.7em,
        weight: "bold",
        fill: if name == active { luma(40) } else { luma(80) },
      )[#name]
    ]
  ]

  block(width: 100%, height: height, spacing: 0pt, breakable: false)[
    #place(
      left + horizon,
      dx: -bleed,
      box(
        width: 100% - head + bleed,
        height: band-h,
        radius: (left: band-h / 2),
        fill: gradient.linear(luma(238), band-end),
      ),
    )
    #align(horizon)[
      #grid(
        columns: (..stages.map(_ => 1fr), head),
        column-gutter: 0.3em,
        align: horizon,
        ..stages.map(pill),
        polygon(fill: band-end, (0pt, 0pt), (head, head-h / 2), (0pt, head-h)),
      )
    ]
  ]
}

// Slide wrapper that pins the strip to the top of the body. Use it instead of
// calling `stage-strip` directly --- the theme centres slide bodies vertically,
// which would otherwise drift the strip with the amount of content below it.
//   == Which stages you see
//   #show: staged.with(active: "Idea")
#let staged(active: none, gap: 0.4em, body) = {
  set align(top)
  stage-strip(active: active)
  v(gap)
  body
}

// Callout that hangs under one pill of `stage-strip`, with a caret pointing up
// at that column. Columns match the strip, so the caret lands dead centre.
#let stage-callout(active, body, fill: luma(235), width: 50%) = {
  let i = stages.position(s => s == active)
  let caret = polygon(fill: fill, (0pt, 0.55em), (0.55em, 0pt), (1.1em, 0.55em))
  grid(
    columns: stage-cols,
    column-gutter: 0.3em,
    ..range(stages.len() + 1).map(j => if j == i { align(center, caret) } else {
      []
    })
  )
  // ponytail: half-width box hugs the side the caret is on, so the caret always
  // lands over it without having to solve for the column centre
  block(
    width: 100%,
    spacing: 0pt,
    align(
      if i != none and i >= stages.len() / 2 { right } else { left },
      box(width: width, fill: fill, radius: 0.3em, inset: 0.9em)[#align(
        left,
      )[#body]],
    ),
  )
}

// Draft placeholder for a slide we will write together.
// Call as `#stub(( [outcome], ... ))[optional body]` or `#stub((...))`.
#let stub(outcomes, body) = lblock(inset: (x: 0.8em, y: 0.7em), outset: 0pt)[
  #text(size: 0.75em, fill: luma(110), weight: "bold", tracking: 0.08em)[STUB]
  #if body != [] [
    #v(0.35em)
    #body
  ]
  #v(0.4em)
  #text(weight: "bold")[Learning outcomes]
  #set text(size: 0.9em)
  #set list(spacing: 0.4em)
  #for o in outcomes [- #o]
]

// Light grey source line under a screenshot or figure.
#let attribution-style(body) = text(size: 0.5em, fill: luma(150), body)

// Align a company logo with list body text, after the bullet and its gap.
#let company-logo(path, height: 1cm) = context {
  let marker = list.marker
  if type(marker) == array { marker = marker.first() }
  if type(marker) == function { marker = marker(0) }
  block(
    spacing: 0pt,
    inset: (
      left: list.indent + measure(marker).width + list.body-indent,
      top: 0.4em,
      bottom: 0.8em,
    ),
    image(path, height: height),
  )
}

// Grey stand-in for a diagram that has not been drawn yet. The comment above
// each call says what the finished diagram must show; `id` names it in briefs.
#let diagram-placeholder(id, caption, width: 100%, height: 100%) = block(
  width: width,
  height: height,
  fill: luma(215),
  radius: 0.3em,
  inset: 0.8em,
  spacing: 0pt,
)[
  #align(center + horizon)[
    #text(
      size: 0.6em,
      weight: "bold",
      fill: luma(90),
      tracking: 0.08em,
    )[DIAGRAM #id]
    #v(0.2em)
    #text(size: 0.55em, fill: luma(90))[#caption]
  ]
]

// News screenshot at the capture standard (1600 x 1000 px, so 16:10), with
// a linked citation over its bottom-right corner. Without `path` it draws a grey
// placeholder; the comment above each call says what the capture must show.
#let shot(id, caption, path: none, url: none, width: 12cm, height: auto, image-align: center) = {
  // An explicit height keeps the whole image vertically and clips its sides
  // around image-align (the horizontal centre by default).
  // Otherwise use the standard 16:10 thumbnail at the given width.
  let img-height = if height == auto { width * 10 / 16 } else { 100% }
  let img = if path == none {
    block(
      width: width,
      height: img-height,
      fill: luma(215),
      radius: 0.3em,
      inset: 0.6em,
      spacing: 0pt,
    )[
      #align(center + horizon)[
        #text(
          size: 0.55em,
          weight: "bold",
          fill: luma(90),
          tracking: 0.08em,
        )[NEWS #id]
        #v(0.15em)
        #text(size: 0.5em, fill: luma(90))[#caption]
      ]
    ]
  } else if height != auto {
    layout(size => {
      let full-width = measure(image(path, height: size.height)).width
      block(
        width: size.width,
        height: size.height,
        clip: true,
        stroke: 0.5pt + luma(210),
        place(image-align + top, image(path, width: full-width, height: size.height)),
      )
    })
  } else {
    block(
      spacing: 0pt,
      width: width,
      height: img-height,
      stroke: 0.5pt + luma(210),
    )[
      #image(path, width: width, height: 100%, fit: "cover")
    ]
  }
  block(width: width, height: if height == auto { img-height } else { height }, spacing: 0pt)[
    #img
    #if url != none {
      let index = news-sources.position(source => source.id == id and source.url == url)
      let reference = if index != none {
        let source = news-sources.at(index)
        [#(source.outlet). #emph(source.headline). #(source.date).]
      } else { caption }
      place(bottom + right, dx: -0.2em, dy: -0.2em, block(
        fill: white.transparentize(8%),
        inset: (x: 0.25em, y: 0.15em),
        radius: 0.1em,
        {
          set par(leading: 0pt, spacing: 0pt)
          text(
            size: 0.8em,
            fill: luma(60),
            top-edge: "bounds",
            bottom-edge: "bounds",
            cite-source(url, reference, brackets: true),
          )
        },
      ))
    }
  ]
}

// Fill-in-the-blank: shows "???" before subslide n, then the answer from n on.
#let blank(n, answer) = [#only("-" + str(n - 1))[*???*]#only(
    str(n) + "-",
  )[#answer]]

// Token pill for tokenizer demos; the fill colour cycles by token index.
#let tok-colors = (
  rgb("#FFD966"),
  rgb("#B6D7A8"),
  rgb("#9FC5E8"),
  rgb("#EA9999"),
)
#let tok(n, content, inset: (x: 0.2em, y: 0.15em)) = box(
  fill: tok-colors.at(calc.rem(n, tok-colors.len())),
  inset: inset,
  radius: 0.1em,
)[#content]
