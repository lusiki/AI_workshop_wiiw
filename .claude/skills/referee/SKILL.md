---
name: referee
description: Produce a fresh-context referee report on the working paper, as a skeptical journal reviewer would. Use before calling a draft done, to pressure-test identification, robustness and exposition.
allowed-tools: Read
context: fork
---

# referee

Read the current draft with fresh eyes and referee it. Do **not** edit anything;
return a prioritized report.

Read: `paper/working_paper.qmd`, `results/estimates.json`, and the figures.
Then critique, most important first:

1. **Identification.** Does the design support the causal language used? Are the
   pre-accession (event-time < 0) coefficients consistent with parallel trends?
   Is the never-treated control group defensible?
2. **Robustness.** What specification would a referee demand — alternative
   price basis, sample, estimator (Callaway & Sant'Anna vs Sun & Abraham),
   clustering? Which are cheap to run and worth pre-empting?
3. **Provenance & exhibits.** Does every number trace to `estimates.json`? Is
   each figure introduced? Are the tables self-explanatory?
4. **Exposition.** Where would a non-specialist economist get lost?

End with the 3 highest-value changes. Flag anything that looks like a result
typed by hand rather than computed.
