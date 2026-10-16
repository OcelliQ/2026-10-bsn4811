#import "@preview/touying:0.7.4": *
#import themes.metropolis: *

#import "@preview/numbly:0.1.0": numbly
#import "/common.typ": accent, big-section-slide, gblock, lblock

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  header-right: image("gm-logo-white.svg", height: 1.4cm),
  config-common(
    new-section-slide-fn: big-section-slide,
    receive-body-for-new-section-slide-fn: true,
  ),
  config-info(
    title: [BSN4811 Lecture],
    subtitle: [TODO],
    author: [Dr. Gaurav Manek],
    date: datetime.today(),
    institution: [NUS BSN4811 -- Fall 2026],
    logo: image("gm-logo.svg", height: 1.6cm),
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set par(leading: 0.5em)
#set list(marker: text(fill: accent)[•], spacing: 0.8em)

#title-slide()

= Placeholder

== Placeholder slide

TODO
