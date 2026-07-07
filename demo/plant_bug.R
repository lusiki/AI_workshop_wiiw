#!/usr/bin/env Rscript
# demo/plant_bug.R ------------------------------------------------------------
# Injects the planted bug used in the live seminar demo: it replaces one inline,
# code-backed number in the manuscript's Results section with a hand-typed
# literal ("13.8 log points"). That literal is NOT tied to results/estimates.json,
# so the verification step (replication_check / the provenance test) flags it --
# the moment the pipeline catches what a tired human on a deadline would miss.
#
# Run from the project root BEFORE the demo:   Rscript demo/plant_bug.R
# Undo with:                                   Rscript demo/reset_demo.R
#
# See demo/PLANTED_BUG.md for the alternative (current-vs-constant-prices) bug.

qmd <- "paper/working_paper.qmd"
stopifnot(file.exists(qmd))

clean_frag <- "closed by `r fmt_lp(est$accession_effect_5y)` log points"
bug_frag   <- "closed by 13.8 log points"

txt <- readLines(qmd, warn = FALSE)
hit <- grepl(clean_frag, txt, fixed = TRUE)

if (!any(hit)) {
  stop("Clean anchor not found. The manuscript may already be bugged or edited.\n",
       "Run demo/reset_demo.R first, or restore paper/working_paper.qmd.")
}

txt[hit] <- sub(clean_frag, bug_frag, txt[hit], fixed = TRUE)
writeLines(txt, qmd)

message("Planted bug: a hand-typed '13.8 log points' now sits in the Results section.")
message("Rebuild + verify to trigger the catch:")
message("  Rscript analysis/run.R      # provenance gate stops the build")
message("  # or: Rscript -e 'testthat::test_dir(\"tests/testthat\")'")
