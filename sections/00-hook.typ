#import "/common.typ": *
#import "/citations.typ": cite-source

= The Gold Rush

== Gold Rush of our age

// Lifted from ai-for-clm 01-intro/chapter/01-industry-landscape.typ. Sources
// are in ai-for-clm 01-intro/media/industry-landscape/GOLD-RUSH-SOURCES.md.
#slide(align: top, config: config-common(breakable: false))[
  #grid(
    columns: (auto, auto, 1fr),
    column-gutter: 8pt,
    row-gutter: 1em,
    align: (left, right, left),
    grid.cell(colspan: 3, align: left)[
      *Global AI infrastructure spending forecast for 2026*#cite-source("https://www.gartner.com/en/newsroom/press-releases/2026-09-16-gartner-forecasts-worldwide-ai-spending-to-grow-49-point-5-percent-in-2026")[Gartner. _Worldwide AI Spending Forecast_. 16 September 2026. AI infrastructure: US\$1.484 trillion forecast for 2026.]
    ],

    grid.cell(rowspan: 2)[
      #text(size: 48pt, weight: "bold")[US\$1.48T]
    ],
    text(size: 24pt)[≈5×],
    [
      #text(size: 24pt)[Apollo missions]#cite-source("https://www.planetary.org/space-policy/cost-of-apollo")[The Planetary Society. _How much did the Apollo program cost?_ Apollo, 1960--1973: US\$309 billion in 2025 dollars.] (US\$309 billion)
    ],
    text(size: 24pt)[≈1×],
    [
      #text(
        size: 24pt,
      )[All the datacentres built until the mid-2000s, inflation-adjusted]
    ],

    grid.cell(colspan: 3, align: left)[
      *Global AI-server electricity consumption forecast for 2026*#cite-source("https://www.gartner.com/en/newsroom/press-releases/2026-06-10-gartner-says-data-center-electricity-demand-to-grow-26-percent-in-2026")[Gartner. _Data Center Electricity Consumption Forecast_. 10 June 2026. AI-optimized servers: 175 TWh forecast for 2026.]
    ],

    grid.cell(rowspan: 2)[
      #text(size: 48pt, weight: "bold")[175 TWh]
    ],
    text(size: 24pt)[≈3×],
    [
      #text(size: 24pt)[Singapore's electricity consumption in 2024]#cite-source("https://www.ema.gov.sg/resources/singapore-energy-statistics/chapter3")[Energy Market Authority, Singapore. _Singapore Energy Statistics: Energy Consumption_. 2024 electricity consumption: 58 TWh.] (58 TWh)
    ],
    text(size: 24pt)[≈2×],
    [
      #text(size: 24pt)[Three Gorges Dam's designed annual output]#cite-source("https://www.ctg.com.cn/ctgenglish/news_media/news37/2024080621160453600/index.html")[China Three Gorges Corporation. _Three Gorges annual power generation_. Designed annual generation: 88.2 TWh.] (88.2 TWh)
    ],
  )

  #v(1fr)
  #align(right)[\*All rough estimates]
]

#speaker-note[
  Gartner's figure is all AI infrastructure (servers, devices, datacentres), not datacentre construction alone. Apollo is a programme total in 2025 dollars; the AI figure is one year. Scale, not precision.
]

== Here's an NVIDIA B200

#slide(config: config-common(breakable: false))[
  #grid(
    columns: (11cm, 1fr),
    column-gutter: 1.2em,
    align: horizon,
    shot(
      "N01",
      [NVIDIA B200 product photo],
      path: "/figures/news/N01-nvidia-b200.png",
      url: "https://nvidianews.nvidia.com/news/nvidia-blackwell-platform-arrives-to-power-a-new-era-of-computing",
      width: 11cm,
    ),
    [
      // Each blank shows "???" until its own subslide.
      #let blank(n, answer) = [#only("-" + str(n - 1))[*???*]#only(
          str(n) + "-",
        )[#answer]]
      To keep up with *one* B200, you'd need #blank(2)[*about a million Earths*] of people, each doing one sum per second.

      A large datacentre has #blank(3)[*220,000+* (Colossus 1, 300 MW)] of them.

      A frontier model trains on #blank(4)[*tens of thousands to \~100,000*] of them for #blank(4)[*a few months*], continuously.
    ],
  )
]

// VERIFY: B200 throughput. The "million Earths" line assumes ~10^16 low-
// precision (FP4, dense) operations a second and 8.2 billion people. Check
// NVIDIA's B200 datasheet; FP8 dense is about half that (~500k Earths).
// VERIFY: Colossus 1 at >220,000 GPUs and >300 MW, per Anthropic's SpaceX
// compute announcement (anthropic.com/news/higher-limits-spacex, May 2026).
// Note that Colossus 1 is not all B200s.
// VERIFY: frontier training-run size and duration. Labs do not publish this;
// cite an Epoch AI estimate for a recent frontier run.
#speaker-note[
  Ask the room to guess each blank before revealing it.
  - 10^16 operations a second / 8.2 billion people at one sum a second each ≈ 1.2 million Earths.
  - Colossus 1: the Memphis site Anthropic now rents from SpaceX.
  - Training runs: estimates only, from Epoch AI.
]

== The question for today

#focus-slide[
  Who earns back \
  *US\$1.48 trillion* a year?
]

#speaker-note[
  Leave this open. We answer it at the end, layer by layer.
]
