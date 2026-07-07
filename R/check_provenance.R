# check_provenance.R ----------------------------------------------------------
# The verification mechanism behind the replication_check skill and the
# verifier agent. The house rule: every number in the manuscript's Results
# section must come from code (an inline `r ...` expression tied to
# results/estimates.json), never typed by hand. A hand-typed number can drift
# out of sync with the tables silently -- exactly the failure the seminar's
# planted bug demonstrates.
#
# The check therefore flags any *decimal literal* left in the Results prose
# after inline code spans and code chunks are stripped. Years and figure/table
# numbers are integers and are not flagged.

#' Scan the manuscript's Results section for hand-typed numeric literals.
#'
#' @return list(ok, offenders, n_lines_checked)
check_numeric_provenance <- function(qmd = "paper/working_paper.qmd") {
  if (!file.exists(qmd)) stop("Manuscript not found: ", qmd)
  lines <- readLines(qmd, warn = FALSE)

  headers   <- grep("^#{1,6}\\s", lines)
  res_start <- grep("^#{1,6}\\s+.*Results", lines, ignore.case = TRUE)
  if (length(res_start) == 0) {
    stop("No 'Results' section heading found in ", qmd,
         " -- provenance check cannot locate the block to verify.")
  }
  res_start <- res_start[1]
  after     <- headers[headers > res_start]
  res_end   <- if (length(after)) after[1] - 1L else length(lines)
  prose     <- lines[(res_start + 1L):res_end]

  # Drop fenced code chunks (```{r} ... ```).
  in_chunk <- FALSE
  keep <- vapply(prose, function(ln) {
    if (grepl("^\\s*```", ln)) { in_chunk <<- !in_chunk; return(FALSE) }
    !in_chunk
  }, logical(1))
  prose <- prose[keep]

  # Strip inline code spans (`r ...` and any other backtick spans).
  prose <- gsub("`[^`]*`", "", prose)

  # A decimal literal in prose is the signature of a hand-typed result.
  hits <- regmatches(prose, gregexpr("[-+]?[0-9]+\\.[0-9]+", prose))
  offenders <- unique(unlist(hits))

  list(
    ok = length(offenders) == 0,
    offenders = offenders,
    n_lines_checked = length(prose)
  )
}

#' Assert numeric provenance; stop with a clear message if violated.
#'
#' Used by tests/testthat and by the replication_check skill.
assert_numeric_provenance <- function(qmd = "paper/working_paper.qmd") {
  res <- check_numeric_provenance(qmd)
  if (!res$ok) {
    stop(
      "Numeric provenance violation in ", qmd, ".\n",
      "Hand-typed number(s) found in the Results section: ",
      paste(res$offenders, collapse = ", "), ".\n",
      "Every result must be an inline `r ...` reference to results/estimates.json.\n",
      "Replace the literal with the corresponding estimate and re-render.",
      call. = FALSE
    )
  }
  invisible(TRUE)
}
