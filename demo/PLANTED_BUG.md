# The planted bug (seminar demo)

The repository ships **clean**: a cold clone builds and all tests pass. The bug
is injected on purpose, right before the live demo, so the "money moment" — the
verification loop catching an error a tired human would miss — is reliable and
repeatable.

## Primary bug: a hand-typed number that drifts from the tables

`demo/plant_bug.R` replaces one inline, code-backed figure in the Results
section of `paper/working_paper.qmd`:

| State | Results sentence contains |
|-------|---------------------------|
| Clean | ``closed by `r fmt_lp(est$accession_effect_5y)` log points`` |
| Bugged | `closed by 13.8 log points` |

The literal `13.8` is not tied to `results/estimates.json`. The house rule
(see `.claude/rules/verification.md`) is that **every number in Results must be
an inline `r ...` reference**. The check that enforces it is
`check_numeric_provenance()` in `R/check_provenance.R`, surfaced two ways:

- `Rscript analysis/run.R` — the provenance gate fails the build.
- `testthat::test_dir("tests/testthat")` — `test-provenance.R` fails.

The `replication_check` skill and the `verifier` agent both call this check, so
the agent's own verification step catches the bug before it reports "done". The
fixer restores the inline reference (equivalently, `demo/reset_demo.R`).

### Run sheet

```bash
Rscript demo/plant_bug.R                 # inject the bug (do this before the talk)
Rscript analysis/run.R                   # build -> provenance gate STOPS with the offender
# ... let the agent (or you) fix it ...
Rscript demo/reset_demo.R                # restore the inline reference
Rscript analysis/run.R                   # clean build, manuscript verified
```

## Alternative bug: current vs constant prices

A more econometric variant, if you want to show a *data* error rather than a
prose error. In `R/config.R` change:

```r
GDP_UNIT <- "CLV10_EUR_HAB"   # correct: chain-linked volumes (real)
# to
GDP_UNIT <- "CP_EUR_HAB"      # bug: current prices (confounds real convergence with inflation)
```

`test-config.R` guards this (`GDP_UNIT` must contain `CLV`, must not start with
`CP_`), so the check catches it immediately, and the event-study coefficients
visibly shift when the wrong unit is used. Revert the one line to fix.

## Rehearsal note

Rehearse whichever variant you will show at least once on the demo machine with
the model session and `renv` library already warmed. If anything stalls for more
than ~60 seconds during the talk, cut to the recording and keep narrating.
