#import "@preview/touying:0.7.4": *
#import themes.metropolis: *

#import "@preview/numbly:0.1.0": numbly
#import "/common.typ": accent, big-section-slide, gblock, lblock
#import "/citations.typ": reference-slides

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  header-right: image("images/gm-logo-white.svg", height: 1.4cm),
  config-common(
    new-section-slide-fn: big-section-slide,
    receive-body-for-new-section-slide-fn: true,
  ),
  config-info(
    title: [How to make money with AI],
    subtitle: [AI and business models],
    author: [Dr. Gaurav Manek],
    date: datetime.today(),
    institution: [NUS BSN4811 -- Fall 2026],
    logo: image("images/gm-logo.svg", height: 1.6cm),
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set par(leading: 0.5em)
#set list(marker: text(fill: accent)[•], spacing: 0.8em)

#title-slide()

#include "sections/00-hook.typ"
#include "sections/01-crash-course.typ"
#include "sections/02-primer.typ"
#include "sections/03-every-message.typ"
#include "sections/04-landlord.typ"
#include "sections/05-meat-puppets.typ"
#include "sections/06-legal.typ"
#include "sections/07-moats.typ"
#include "sections/08-close.typ"

#reference-slides()
