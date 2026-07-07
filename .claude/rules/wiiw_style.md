---
paths:
  - "paper/**/*.qmd"
  - "paper/**/*.md"
---

# wiiw manuscript house style

These load whenever you edit the working paper. The register is a policy-facing
research institute: precise, sober, readable by an economist who is not a
specialist in the subfield.

## Numbers (non-negotiable)
- **Every number in the Results section is an inline `r ...` reference** to
  `results/estimates.json` (via the `est` object). Never type a result by hand.
  `check_numeric_provenance()` fails the build on any hand-typed literal.
- Quote a statistic once, in the place it is first established; refer back to it,
  do not re-state it with a different rounding.

## Figures and tables
- Every figure is introduced by a prose sentence *before* it that says what the
  reader should take from it. No figure appears cold.
- Tables come from `modelsummary`; do not paste raw regression output.

## Prose
- One idea per paragraph; topic sentence first.
- British or US spelling is fine, but be consistent within the document.
- Cite only from `paper/references.bib`. Never invent a citation, a DOI, or a
  page number from memory — if a reference is missing, fetch its metadata and
  add the entry first.
- Hedge claims to the strength of the identification: "associated with",
  "consistent with", not "causes", unless the design licenses it.
