# setup.R (auto-sourced by testthat before the tests) ------------------------
# Locate the project root (works regardless of testthat's working directory)
# and load every project function + constant.

find_root <- function(start = getwd()) {
  d <- normalizePath(start, winslash = "/", mustWork = FALSE)
  while (!file.exists(file.path(d, "_targets.R")) && dirname(d) != d) {
    d <- dirname(d)
  }
  d
}

ROOT        <- find_root()
TARGETS_DIR <- file.path(ROOT, "_targets")

for (f in list.files(file.path(ROOT, "R"), pattern = "[.][Rr]$", full.names = TRUE)) {
  source(f)
}
