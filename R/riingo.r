#' Convert Daily Prices to Monthly Returns
#'
#' @param prices Vector of monthly prices
#'
#' @return Vector of monthly returns. First element will be NA.
#' @export
#' 
#' @examples convert_prices_to_monthly_returns(rnorm(30, 100, 1))
convert_prices_to_monthly_returns <- function(prices){
  c(NA, prices[2:length(prices)] / prices[(2:length(prices)) - 1] - 1)  
}

#' Get Monthly Returns
#' 
#' Only returns full months.  Dates are last business days of the month.
#'
#' @param symbols Character vector of symbols
#' @param tiingo_token The token for tiigo API
#' @param start_date Start date
#' @param end_date End date.
#'
#' @return Vector of monthly returns.
#' @export
#'
#' @examples get_monthly_returns(symbols="IVV", 
#' start_date = as.Date("2014-12-31"), 
#' end_date = as.Date("2018-12-31"))
get_monthly_returns <- function(symbols, tiingo_token=Sys.getenv("TIINGO_TOKEN"), 
                                start_date, end_date){
  riingo::riingo_set_token(tiingo_token)
  prices <- riingo::riingo_prices(symbols, resample_frequency = "monthly",
                                  start_date = start_date,
                                  end_date = end_date)
  prices$date <- as.Date(prices$date)
  out <- tibble(ticker=character(0), date=numeric(0), Ra=numeric(0))
  for(sym in symbols){
    prices.filtered <- prices[prices$ticker == sym, c("ticker", "date", "adjClose")]
    if(nrow(prices.filtered) > 1){
      Ra <- convert_prices_to_monthly_returns(prices.filtered[, "adjClose", drop=TRUE])
      out <- rbind(out, cbind(prices.filtered[, c("ticker", "date")], Ra))
    }
  }
  out <- out[stats::complete.cases(out), ]
  colnames(out) <- c("symbol", "date", "Ra")
  return(out)
}

