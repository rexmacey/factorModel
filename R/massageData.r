#' Get Fund Returns    
#' 
#' Retrieves prices from web and calculates monthly returns. 
#'
#' @param symbols vector of character strings
#' @param sdate start date. Should be the last day of the month before the first month of the return series. 
#' Example: use 2015-12-31 to generate the first monthly return for January 2016.
#' @param edate end date. Last day of the month of the return series.
#'
#' @return 3 column tibble with Symbol, Month-End Date, and Ra, the monthly return
#' @import dplyr
#' @import tidyquant
#' @export
#'
#' @examples GetFundReturns(c("IVV", "SPY"), as.Date("2015-12-31"), as.Date("2018-12-31"))
GetFundReturns <- function(symbols, sdate, edate){
  requireNamespace("dplyr")
  requireNamespace("tidyquant")
  fundreturns <- symbols %>%
    tidyquant::tq_get(get  = "stock.prices",
           from = sdate,
           to   = (lubridate::add_with_rollback(edate, lubridate::days(1))))
   colnames(fundreturns) <- c("symbol", colnames(fundreturns)[2:ncol(fundreturns)])
  fundreturns <- fundreturns %>%
    dplyr::group_by(symbol) %>%
    tidyquant::tq_transmute(select = adjusted, 
                 mutate_fun = periodReturn, 
                 period     = "monthly", 
                 col_rename = "Ra") %>%
    dplyr::filter(date > sdate)
  return(fundreturns)}

#' Add a Factor
#' 
#' Adds a column of returns to an existing table.  Optionally subtracts the returns from each column of the
#' existing table.
#' 
#' If the date columns do not align, the returning table will have the maximum common date range.  The 
#' first column of both tables of returns be date.
#'
#' @param factorReturns Tibble of existing returns with date in first column.
#' @param newFactorReturns Vector of new returns with date in first column.
#' @param calcExcess If FALSE, no adjustments are made. If TRUE, the newFactorReturns are subtracted from
#' each column of the factorReturns creating excess returns.
#'
#' @return Tibble with new column
#' @import dplyr
#' @export
#'
#' @examples AddFactor(factorReturns[, 1:6], factorReturns[,c(1,7)], TRUE)
AddFactor <- function(factorReturns, newFactorReturns, calcExcess = FALSE){
  requireNamespace("dplyr")
  # dateRange <- FindMaxCommonDateRange(factorReturns$date, newFactorReturns$date)
  dateRange <- FindMaxCommonDateRange(factorReturns[, "date", drop=TRUE], newFactorReturns[, "date", drop=TRUE])
  fr1 <- factorReturns %>% dplyr::filter(date >= dateRange["start"] & date <= dateRange["end"])
  fr2 <- newFactorReturns %>% dplyr::filter(date >= dateRange["start"] & date <= dateRange["end"])
  if(calcExcess){
    for(i in 2:ncol(fr1)){
      fr1[, i] <- fr1[, i] - fr2[, 2]
    }
  }
  return(cbind(fr1, fr2[,2]))
}

#' Find Maximum Common Date Range
#' Finds the maximum common date range between two vectors of dates
#' @param dates1 Vector of dates
#' @param dates2 Vector of dates
#'
#' @return Vector of two dates: start and end
#' @export
#'
#' @examples FindMaxCommonDateRange(factorReturns$date, factorReturns$date)
FindMaxCommonDateRange <- function(dates1, dates2){
  out <- c(start = max(min(dates1), min(dates2)),
           end = min(max(dates1), max(dates2)))
  return(out)
}