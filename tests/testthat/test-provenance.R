# test-provenance.R -----------------------------------------------------------
# The verification mechanism the seminar demo hinges on: no hand-typed numbers
# in the manuscript's Results section. This test PASSES on a clean clone and
# FAILS the moment demo/plant_bug.R injects a stray literal.

test_that("the manuscript has no hand-typed numbers in the Results section", {
  qmd <- file.path(ROOT, "paper", "working_paper.qmd")
  skip_if_not(file.exists(qmd), "manuscript not present")

  res <- check_numeric_provenance(qmd)
  expect_true(
    res$ok,
    info = paste0(
      "Unsourced numeric literal(s) in Results: ",
      paste(res$offenders, collapse = ", "),
      ". Replace with an inline `r ...` reference to results/estimates.json."
    )
  )
})
