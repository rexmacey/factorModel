context("get_monthly_returns")
test_that("get_monthly_returns has correct length, type", {
  
  symbols <- "SPY"
  sdate <- as.Date("2014-12-31")
  edate <- as.Date("2018-12-31")
  test <- get_monthly_returns(symbols=symbols, start_date = sdate, end_date = edate)
  
  expect_equal(min(test$date), as.Date("2015-01-30"))
  expect_equal(max(test$date), as.Date("2018-12-31"))
  expect_equal(nrow(test), 48)
  expect_equal(test$symbol[1], symbols)
})