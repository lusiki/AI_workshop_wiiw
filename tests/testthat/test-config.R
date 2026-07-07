# test-config.R ---------------------------------------------------------------
# Pure checks on the sample definition. No data required, so these always run.

test_that("accession cohorts partition the treated countries", {
  expect_setequal(CESEE, c(ACCESSION_2004, ACCESSION_2007, ACCESSION_2013))
  expect_length(intersect(CESEE, CONTROL_EU), 0)
  expect_length(CESEE, 11)
})

test_that("accession_year() maps every country to the right cohort", {
  expect_equal(accession_year("PL"), 2004L)
  expect_equal(accession_year("EE"), 2004L)
  expect_equal(accession_year("BG"), 2007L)
  expect_equal(accession_year("RO"), 2007L)
  expect_equal(accession_year("HR"), 2013L)
  expect_equal(accession_year("DE"), NEVER_TREATED_COHORT)
  expect_true(is.na(accession_year("XX")))
})

test_that("the price basis is a constant-price (volume) measure", {
  # Guards the current-vs-constant-prices variant of the planted bug.
  expect_match(GDP_UNIT, "CLV", info = "GDP_UNIT must be chain-linked volumes, not current prices (CP_*)")
  expect_false(grepl("^CP_", GDP_UNIT))
})
