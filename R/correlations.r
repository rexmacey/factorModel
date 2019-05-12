#' Get lower triangle of a correlation matrix
#'
#' @param cormat Correlation matrix
#'
#' @return Lower triangle of matrix, upper is NA
#' @export
#'
#' @examples get_lower_tri(cormat)
get_lower_tri<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}

#' Get upper triangle of a correlation matrix
#'
#' @param cormat Correlation matrix
#'
#' @return Upper triangle of matrix, lower is NA
#' @export
#'
#' @examples get_upper_tri(cormat)
get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}

#' Plots a correlation matrix
#' 
#' The upper triangle is a heatmap, the lower triangle is a table.
#'
#' @param cormat Correlation matrix
#'
#' @return A ggplot object
#' @export
#'
#' @examples plot_corr(cormat)
plot_corr <- function(cormat){
  upper_tri <- get_upper_tri(cor(cormat))
  melted_cormat <- melt(upper_tri, na.rm=TRUE)
  out <- ggplot(data = melted_cormat, aes(Var2, Var1, fill = value))+
    geom_tile(color = "white")+
    scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                         midpoint = 0, limit = c(-1,1), space = "Lab", 
                         name="Pearson\nCorrelation") +
    theme_minimal()+ 
    theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                     size = 12, hjust = 1))+
    coord_fixed() +
    xlab("") + ylab("")  + 
    geom_text(aes(Var2, Var1, label = round(value,2)), color = "black", size = 4) +
    theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      panel.grid.major = element_blank(),
      panel.border = element_blank(),
      panel.background = element_blank(),
      axis.ticks = element_blank(),
      legend.justification = c(1, 0),
      legend.position = c(0.6, 0.7),
      legend.direction = "horizontal")+
    guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                                 title.position = "top", title.hjust = 0.5))
  return(out)
}  
