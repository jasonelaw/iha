#'Return a string giving the water year for a date
#'
#'Returns a number specifying the water year (\code{2010}) for a date.
#'@param x a date-time object which can be handled by lubridate
#'@importFrom lubridate month year
#'@export
water.year <- function(x){
  yr <- year(x)
  ifelse(month(x, label = FALSE) > 9, yr + 1, yr)
}

#'Extract the month of the water year from a date or time object.
#'
#'Extract the month of the water year from a date or time object.  Can be returned
#'as a number 1:12, for October through September respectively, or an ordered factor.
#'@param x a date or time object
#'@param label logical TRUE will return an ordered factor for month with the month name as labels
#'@param abbr logical. FALSE will abbreviate the name of the month in the ordered factor.
#'@S3method water.month default
#'@S3method water.month numeric
#'@importFrom lubridate month
#'@export water.month
water.month <- function(x, label = FALSE, abbr = TRUE){
  UseMethod('water.month')
}

water.month.numeric <- function(x, label = FALSE, abbr = TRUE){
  if (!label){
    return(x)
  } 
  if (abbr) {
    labels <- c("Oct", "Nov", "Dec", "Jan", "Feb", "Mar", 
                "Apr", "May", "Jun", "Jul", "Aug", "Sep")
  } else {
    labels <- c("October", "November", "December", "January", "February", "March",
                "April", "May", "June", "July", "August", "September")
  }
  ordered(x, levels = 1:12, labels = labels)
}

water.month.default <- function(x, label = FALSE, abbr = TRUE){
  water.month(c(4:12, 1:3)[month(x, label = FALSE)], label, abbr)
}
