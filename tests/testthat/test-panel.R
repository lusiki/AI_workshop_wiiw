# test-panel.R ----------------------------------------------------------------
# Schema and tolerance checks on the built panel. Skipped until the pipeline has
# been run at least once (targets store present), so a fresh clone still passes
# `Rscript tests/testthat.R` before any data has been pulled.

test_that("panel has the expected schema and stays within tolerances", {
  skip_if_not(dir.exists(TARGETS_DIR), "targets store not built yet (run tar_make())")

  panel <- targets::tar_read(panel, store = TARGETS_DIR)

  needed <- c("geo", "year", "gdp_pc", "log_gdp", "rel_gap",
              "cohort", "treated", "cesee", "event_time")
  expect_true(all(needed %in% names(panel)))

  expect_true(all(is.finite(panel$rel_gap)))
  expect_true(all(panel$gdp_pc > 0))
  expect_true(all(panel$year >= SAMPLE_START & panel$year <= SAMPLE_END))

  # Replication-first sanity: CESEE members are, on average, below the EU
  # average income level (negative convergence gap) over the sample.
  expect_lt(mean(panel$rel_gap[panel$cesee], na.rm = TRUE), 0)

  # Every treated CESEE country appears; controls are flagged never-treated.
  expect_setequal(unique(panel$geo[panel$cesee]), CESEE)
  expect_true(all(panel$cohort[!panel$treated] == NEVER_TREATED_COHORT))
})
