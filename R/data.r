#' RAFI Factor Returns Across Three Regions
#' 
#' A dataset containing the monthly returns of 14 factors across the US, international developed and
#' emerging markets.
#' 
#' @format  A tibble with 381 rows and 15 variables:
#' \describe{
#'   \item{date}{date at the end of the month}
#'   \item{USVal}{U.S. Value factor}
#'   \item{USLVol}{U.S. Low volatility factor}
#'   \item{USQual}{U.S. Quality factor}
#'   \item{USSize}{U.S. Size factor}
#'   \item{USMom}{U.S. Momentum factor}
#'   \item{DxUVal}{Int'l Developed Value factor}
#'   \item{DxULVol}{Int'l Developed Low volatility factor}
#'   \item{DxUQual}{Int'l Developed Quality factor}
#'   \item{DxUSize}{Int'l Developed Size factor}
#'   \item{DxUMom}{Int'l Developed Momentum factor}
#'   \item{EMVal}{Emerging Value factor}
#'   \item{EMLVol}{Emerging Low volatility factor}
#'   \item{EMQual}{Emerging Quality factor}
#'   \item{EMMom}{Emerging Momentum factor}
#' }
"factorReturns"

#' RAFI U.S. Factor Returns
#' 
#' A dataset containing the monthly returns of 5 factors across the US
#' 
#' @format  A tibble with 381 rows and 15 variables:
#' \describe{
#'   \item{date}{date at the end of the month}
#'   \item{USVal}{U.S. Value factor}
#'   \item{USLVol}{U.S. Low volatility factor}
#'   \item{USQual}{U.S. Quality factor}
#'   \item{USSize}{U.S. Size factor}
#'   \item{USMom}{U.S. Momentum factor}
#' }
"factorReturns.US"

#' RAFI International Factor Returns 
#' 
#' A dataset containing the monthly returns of 5 factors across the international developed markets.
#' 
#' @format  A tibble with 381 rows and 15 variables:
#' \describe{
#'   \item{date}{date at the end of the month}
#'   \item{DxUVal}{Int'l Developed Value factor}
#'   \item{DxULVol}{Int'l Developed Low volatility factor}
#'   \item{DxUQual}{Int'l Developed Quality factor}
#'   \item{DxUSize}{Int'l Developed Size factor}
#'   \item{DxUMom}{Int'l Developed Momentum factor}
#' }
"factorReturns.Intl"

#' RAFI Emerging Market Factor Returns
#' 
#' A dataset containing the monthly returns of 4 factors across emerging markets.
#' 
#' @format  A tibble with 381 rows and 15 variables:
#' \describe{
#'   \item{date}{date at the end of the month}
#'   \item{EMVal}{Emerging Value factor}
#'   \item{EMLVol}{Emerging Low volatility factor}
#'   \item{EMQual}{Emerging Quality factor}
#'   \item{EMMom}{Emerging Momentum factor}
#' }
"factorReturns.EM"

#' Factor groups
#' 
#' A 3 item list grouping the factorReturns variables into regions.
#' 
#' @format  A list with 3 items:
#' \describe{
#'   \item{US}{US factor names. }
#'   \item{Intl}{International developed factor names}
#'   \item{EM}{Emerging market factor names}
#' }
"factorGroups"