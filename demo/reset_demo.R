#!/usr/bin/env Rscript
# demo/reset_demo.R -----------------------------------------------------------
# Restores the manuscript to its clean, code-backed state after the demo.
# Run from the project root:   Rscript demo/reset_demo.R

qmd <- "paper/working_paper.qmd"
stopifnot(file.exists(qmd))

clean_frag <- "closed by `r fmt_lp(est$accession_effect_5y)` log points"
bug_frag   <- "closed by 13.8 log points"

txt <- readLines(qmd, warn = FALSE)
hit <- grepl(bug_frag, txt, fixed = TRUE)

if (!any(hit)) {
  message("Nothing to reset: the manuscript is already in its clean state.")
} else {
  txt[hit] <- sub(bug_frag, clean_frag, txt[hit], fixed = TRUE)
  writeLines(txt, qmd)
  message("Reset done: the Results number is once again an inline reference to estimates.json.")
}
