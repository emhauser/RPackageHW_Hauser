##StatisticalAnalysisFunction##
#This function will take a dataframe of soil variables interpolated to 1cm depths in soil profiles.
#It will calculate correlations between soil variables.
#In particular I will examine correlations between different phosphorus forms (organic, inorganic, resin, melich, and total), root carbon exudates (phosphatase enzyme, and extractable organic carbon (EOC), as well as the ratio of phosphatase:EOC), and root density.
# It will return a correlation matrix including each paired dataset.

#'Correlation of interpolated soil datasets
#'
#'\code{SoilCorMat()} is a function that takes a dataframe of soil observations and analyzes the correlations between each column of variables.
#'@param SoilDat A dataframe of soil observations for which the user would like to calculate correlations.
#'@param startCol Specifies dataframe column where correlation calculations should begin
#'@param endCol Specifies dataframe column for correlations calculations to end
#'@section  Note: this function requires the "Hmisc" package
#'@return A correlation matrix of calculated r and p values.
#'@examples SoilCorMat(CO2, startCol = 4, endCol = 5)
SoilCorMat <- function(SoilDat, startCol, endCol){
  SoilDat <-Hmisc::rcorr(as.matrix(SoilDat[,startCol:endCol]))
  return(SoilDat)
}

