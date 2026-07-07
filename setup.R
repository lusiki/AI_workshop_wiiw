#!/usr/bin/env Rscript
# setup.R ---------------------------------------------------------------------
# One-shot environment setup. Checks prerequisites, then restores the pinned R
# package library with renv (falling back to a fresh install + snapshot if the
# lockfile cannot be restored as-is).
#
#     Rscript setup.R

pkgs <- c(
  "targets", "tarchetypes", "quarto", "dplyr", "tidyr", "tibble", "eurostat",
  "fixest", "did", "modelsummary", "gt", "ggplot2", "jsonlite", "testthat"
)

cat("== Checking prerequisites ==\n")
cat(sprintf("R version: %s\n", getRversion()))
if (getRversion() < "4.2.0") warning("R >= 4.2 recommended.")

quarto <- Sys.which("quarto")
if (nzchar(quarto)) {
  cat(sprintf("Quarto: %s\n", quarto))
} else {
  cat("Quarto NOT found on PATH. Install from https://quarto.org and re-run.\n")
}

cat("== Restoring R packages (renv) ==\n")
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv", repos = "https://cloud.r-project.org")
}

restored <- FALSE
if (file.exists("renv.lock")) {
  restored <- tryCatch({
    renv::restore(prompt = FALSE)
    TRUE
  }, error = function(e) {
    cat("renv::restore() failed (", conditionMessage(e), ").\n",
        "Falling back to a fresh install + snapshot.\n", sep = "")
    FALSE
  })
}

if (!restored) {
  renv::init(bare = TRUE, restart = FALSE)
  install.packages(pkgs, repos = "https://cloud.r-project.org")
  renv::snapshot(packages = pkgs, prompt = FALSE)
}

# TinyTeX for PDF rendering, if no LaTeX is present.
if (!nzchar(Sys.which("pdflatex")) && !nzchar(Sys.which("xelatex"))) {
  cat("No LaTeX found. Installing TinyTeX for PDF output ...\n")
  if (requireNamespace("tinytex", quietly = TRUE) ||
      tryCatch({ install.packages("tinytex", repos = "https://cloud.r-project.org"); TRUE },
               error = function(e) FALSE)) {
    try(tinytex::install_tinytex(), silent = TRUE)
  }
}

cat("== Setup complete. Next: Rscript analysis/run.R ==\n")
