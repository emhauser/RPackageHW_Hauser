###SoilDataGraphing_Functions##

#install.packages("colorspace")
#library(colorspace)
#This is a function that takes a dataframe consisting of columns of response variables that have been extrapolated across every centimeter of soil depth.
#The function first makes a vector of colors for the points in each column. Each datapoint in a column gets its own color value, and colors are assigned in rainbow order to datapoints by soil depth (so starting with red and working to purple from upper to lower soil horizon).
#The function then calculates the correlation coefficients between each soil variable in the dataframe. It produces a correlation matrix.
#It finally plots the correlation scatter plots. When plotted, a graph appearing as a correctly ordered rainbow indicates that depth is an important part of the correlation calculated by the cor() function. If colors are scattered with no pattern, there may still be a relationship between soil variables, but it is not depth dependent.
#The function returns a matrix of color-coordinated scatter plots with r values at the top of each plot. There is one plot returned for each pair of soil variable.

#Args
# SoilDatSet  A dataframe containing columns of numeric variables measured in soil samples
# depthCol    The column number in the dataframe for the column containing soil depth data (in cm)
# numDepths   The number of depths in/length of the soil depth column
# startCol    The column for which the user would like to start producing correlations. If the user wants to correlate all variables in the dataframe to each other, this value equals 1.
# endCol      The column for which the user would like to stop calculating correlations between variables. If the user wishes to correlate all variables, this number equals ncol(SoilDatSet)



#'Color-coded scatter plots of soil dataset correlations
#'
#'\code{SoilRainbowStats()} is a function that takes a dataframe of soil observations and analyzes the correlations between each column of variables. It then plots the correlation scatter plots with regression coefficients, and color codes plotted points in rainbow order according to soil depth. Shallower points are red and deeper points are violet.
#'@param SoilDatSet  A dataframe containing columns of numeric variables measured in soil samples
#'@param depthCol The column number in the dataframe for the column containing soil depth data.
#'@param numDepths The number of depths in/length of the soil depth column
#'@param startCol The column for which the user would like to start producing correlations. If the user wants to correlate all variables in the dataframe to each other, this value equals 1.
#'@param endCol  The column for which the user would like to stop calculating correlations between variables. If the user wishes to correlate all variables, this number equals ncol(SoilDatSet)
#'@section  Note: this function requires the colorspace package
#'@return A matrix of scatter plots with corresponding correlation coefficients. Scattered points are color coordinated such that a rainbow-ordered plot indicates depth-dependence of the relationship. Lack of color order indicates no effect of depth on the relationship between 2 variables.
#'@examples SoilRainbowStats(airquality, 6, 153, 1, 3 )
SoilRainbowStats <- function(SoilDatSet, depthCol, numDepths, startCol, endCol){
#Make color vector
SoilDat2 <- SoilDatSet[,-depthCol]
species_labels <- SoilDatSet[,depthCol]
depth_col <- rev(colorspace::rainbow_hcl(numDepths))
#Combine color vector and correlation coefficients
upper.panel<-function(x, y){
  points(x,y, pch=19, col=depth_col, cex = 0.5)
  r <- round(cor(x, y), digits=2)
  txt <- paste0("R = ", r)
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  text(0.5, 0.9, txt)
}
#Make plots of correlation matrices including r values
pairs(SoilDatSet[,startCol:endCol], lower.panel = NULL,
      upper.panel = upper.panel)
}



#SoilRainbowStats(HWSoilDat, 1, 175, 4, 8)
#SoilRainbowStats(PineSoilDat, 1, 175, 16, 19)
testPlots <- SoilRainbowStats(airquality, 6, 153, 1, 3 )
