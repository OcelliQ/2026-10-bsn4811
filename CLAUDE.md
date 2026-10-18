# CLAUDE.md

Typst + touying (metropolis theme) slide deck for NUS BSN4811. `slides.typ` includes `sections/*.typ` in order; shared helpers live in `common.typ`, citations in `citations.typ`, figures in `figures/`.

**Build** `typst compile slides.typ` (writes `slides.pdf`). To check a slide, render its pages with `pdftoppm -f N -l N -png` and look at them: a step that overflows silently spills onto an extra blank page.

**Animations** Use `#only(..)` / `#uncover(..)` with explicit step indices. Don't nest `uncover` inside `only`: touying fails with `sequence does not have field "text"`. Keep them as sibling blocks. When asked for a `#pause`, read it as "add a reveal step" and use whichever primitive fits; `#pause` mixed with `uncover` in table cells pushes later content an extra step.

**Review comments** Sections carry `// GLM-5.3-REVIEW:` suggestions and `// VERIFY:` fact-check notes. Each time we start or finish work on a slide, clean up that slide's comments: delete the ones that have landed, and cut VERIFY notes down to a minimal citation (source and date). Leave suggestions that haven't been implemented. Also search the rest of the deck and `docs/` for comments and claims related to the slide (same company, figure or event), and update those too, but only with information actually verified; leave anything unchecked as VERIFY.
