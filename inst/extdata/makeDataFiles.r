require(readxl)
# factorGroups <- list(US = c("USVal", "USLVol", "USQual", "USSize", "USMom"),
#                      Intl = c("DxUVal", "DxULVol", "DxUQual", "DxUSize", "DxUMom"),
#                      EM = c("EMVal", "EMLVol", "EMQual", "EMMom"))
# factorReturns <- read_excel(".\\inst\\extdata\\8892_RAFI_factor_portfolio_returns_20190228.xlsx", 
#                                      sheet = "Monthly Returns")
# colnames(factorReturns) <- c("date", 
#                              unlist(factorGroups["US"]),
#                              unlist(factorGroups["Intl"]),
#                              unlist(factorGroups["EM"]))
# factorReturns$date <- as.Date(factorReturns$date)
# factorReturns.US <- factorReturns[,c("date", unlist(factorGroups["US"]))]
# factorReturns.Intl <- factorReturns[,c("date", unlist(factorGroups["Intl"]))]
# factorReturns.EM <- factorReturns[,c("date", unlist(factorGroups["EM"]))]
# factorReturns.US <- factorReturns.US[complete.cases(factorReturns.US),]
# factorReturns.Intl <- factorReturns.Intl[complete.cases(factorReturns.Intl),]
# factorReturns.EM <- factorReturns.EM[complete.cases(factorReturns.EM),]
# save(factorGroups, file=".\\data\\factorGroups.rdata")
# save(factorReturns, file=".\\data\\factorReturns.rdata")
# save(factorReturns.US, file=".\\data\\factorReturns.US.rdata")
# save(factorReturns.Intl, file=".\\data\\factorReturns.Intl.rdata")
# save(factorReturns.EM, file=".\\data\\factorReturns.EM.rdata")

factorGroups <- list(US = c("RADMFUVT", "RADMFULT","RADMFUQT", "RADMFSST", "RAFIUST", "RAFIUSST"),
                     Intl = c("RADMFXVT", "RADMFXLT", "RADMFXQT", "RADMFXST", "RAFIDXUT"),
                     EM = c("RADMFEVT", "RADMFELT", "RADMFEQT", "RAFIEMT"))

factorColNames<- read_excel(".\\inst\\extdata\\RAFI-Performance-Series-2019-08-31.xlsx", 
                            sheet = "RAFI Indices Performance", range = "C11:AA11", col_names = FALSE) 
factorColNames <- c("Date", unlist(factorColNames[1:sum(!is.na(factorColNames))]))

factorReturns <- read_excel(".\\inst\\extdata\\RAFI-Performance-Series-2019-08-31.xlsx", 
                            sheet = "RAFI Indices Performance", skip = 12, col_names = factorColNames)

factorReturns.US <- factorReturns[,c("Date", unlist(factorGroups["US"]))]
factorReturns.Intl <- factorReturns[,c("Date", unlist(factorGroups["Intl"]))]
factorReturns.EM <- factorReturns[,c("Date", unlist(factorGroups["EM"]))]
factorReturns.US <- factorReturns.US[complete.cases(factorReturns.US),]
factorReturns.Intl <- factorReturns.Intl[complete.cases(factorReturns.Intl),]
factorReturns.EM <- factorReturns.EM[complete.cases(factorReturns.EM),]
save(factorGroups, file=".\\data\\factorGroups.rdata")
save(factorReturns, file=".\\data\\factorReturns.rdata")
save(factorReturns.US, file=".\\data\\factorReturns.US.rdata")
save(factorReturns.Intl, file=".\\data\\factorReturns.Intl.rdata")
save(factorReturns.EM, file=".\\data\\factorReturns.EM.rdata")