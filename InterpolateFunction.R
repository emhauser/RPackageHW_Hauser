###DataInterpolationFunction###

#Interpolate is a function that takes a dataframe with a limited number of observations and performs linear interpolation between the datapoints to generate an expanded dataset.
#The function takes a dataframe of observations and returns a dataframe containing all extrapolated values.
#Args
# Dataset:  a dataframe containing the observations from which values will be interpolated
# interCol: the column over which the approx function embedded in interpolate() performs interpolation
# datRange: The range of points to which the interCol column will be expanded.  


interpolate <- function(Dataset, interCol, datRange){
    cbind.data.frame(data.frame(Depth = datRange),
                           lapply(Dataset[-interCol], function (u) approx(Dataset[[interCol]], u, datRange)$y))
}

