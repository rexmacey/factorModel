context("AddFactor")
test_that("AddFactor adds a column,  restricts dates", {
  
  #seq.Date(as.Date("2009-03-1"), by="month", length.out = 36) %m-% days(1)
  data("factorReturns.US")
  data("factorReturns.Intl")
  fr1 <- factorReturns.US
  fr2 <- factorReturns.Intl[,1:2]
  fr <- AddFactor(fr1, fr2, TRUE)
  fr1[fr1$date == fr$date[1], 2] 
  expect_equal(ncol(fr), ncol(fr1) + 1)
  expect_equal(max(fr$date), min(max(fr1$date), max(fr2$date)))
  expect_equal(min(fr$date), max(min(fr1$date), min(fr2$date)))
  expect_equal(as.numeric(fr1[fr1$date == fr$date[1], 2, drop=TRUE]), as.numeric(fr[1, 2] + fr[1, ncol(fr)]))
  fr <- AddFactor(fr1, fr2, FALSE)
  expect_equal(as.numeric(fr1[fr1$date == fr$date[1], 2, drop=TRUE]), as.numeric(fr[1, 2]))
})