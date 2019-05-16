#' Get lower triangle of a correlation matrix
#'
#' @param cormat Correlation matrix
#'
#' @return Lower triangle of matrix, upper is NA
#' @export
#'
#' @examples get_lower_tri(stats::cor(matrix(rnorm(500), 100, 5)))
get_lower_tri<-function(cormat){
  cormat[base::upper.tri(cormat)] <- NA
  return(cormat)
}

#' Get upper triangle of a correlation matrix
#'
#' @param cormat Correlation matrix
#'
#' @return Upper triangle of matrix, lower is NA
#' @export
#'
#' @examples get_upper_tri(stats::cor(matrix(rnorm(500), 100, 5)))
get_upper_tri <- function(cormat){
  cormat[base::lower.tri(cormat)]<- NA
  return(cormat)
}

#' Plots a correlation matrix
#' 
#' The upper triangle is a heatmap, the lower triangle is a table.
#'
#' @param cormat Correlation matrix
#'
#' @return A ggplot object
#' @import ggplot2
#' @export
#'
#' @examples plot_corr(stats::cor(matrix(rnorm(500), 100, 5)))
plot_corr <- function(cormat){
  upper_tri <- get_upper_tri(cormat)
  melted_cormat <- reshape2::melt(upper_tri, na.rm=TRUE)
  out <- ggplot2::ggplot(data = melted_cormat, ggplot2::aes(Var2, Var1, fill = value))+
    ggplot2::geom_tile(color = "white")+
    ggplot2::scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                         midpoint = 0, limit = c(-1,1), space = "Lab", 
                         name="Pearson\nCorrelation") +
    ggplot2::theme_minimal()+ 
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, vjust = 1, 
                                     size = 12, hjust = 1))+
    ggplot2::coord_fixed() +
    ggplot2::xlab("") + ggplot2::ylab("")  + 
    ggplot2::geom_text(ggplot2::aes(Var2, Var1, label = round(value,2)), color = "black", size = 4) +
    ggplot2::theme(
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      legend.justification = c(1, 0),
      legend.position = c(0.6, 0.7),
      legend.direction = "horizontal")+
    ggplot2::guides(fill = ggplot2::guide_colorbar(barwidth = 7, barheight = 1,
                                 title.position = "top", title.hjust = 0.5))
  return(out)
}  

