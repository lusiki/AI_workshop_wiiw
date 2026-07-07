# Verification (always on)

This rule has no `paths:` block, so it loads every session. It is the one that
keeps confident nonsense out of the working paper.

## The firm rule
You may **not** report a task complete without compiling, rendering, or testing
the result. "It should work" is not "it works". Concretely, before you say done:

1. `Rscript analysis/run.R` succeeds (this runs the pipeline **and** the
   numeric-provenance gate), or
2. the narrower check for what you changed passes:
   - code touched → `Rscript -e 'testthat::test_dir("tests/testthat")'`
   - manuscript touched → `quarto render paper/working_paper.qmd` renders clean
     and `check_numeric_provenance()` returns `ok = TRUE`.

## Replication-first
When translating or extending existing analysis, first record the gold-standard
numbers, reproduce them within `PROVENANCE_TOL`, and only then extend. Do not
"improve" numbers you have not first reproduced.

## Adversarial check
For anything nontrivial, do not grade your own homework. Hand the result to the
`verifier` agent (read-only). If it finds a problem, a separate pass fixes it,
and the verifier runs again — loop until it finds nothing new.

## Numeric provenance
Every number quoted in the manuscript is anchored to the script and estimate
that produced it (`results/estimates.json`). A stale table must never silently
drift from the text. If you cannot point a number to its source, it does not go
in the paper.
