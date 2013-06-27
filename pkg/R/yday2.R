#'Calculate the day of the year as TNC does in their IHA software
#'
#'The day of the year can be calculated using yday from the lubridate package.
#'This function does the same but, does it like TNC's version of the IHA software.
#'They count days as if every year was leap year; every year has 366 days.
#'@param x a date object that can be handled by the lubridate package
#'@importFrom lubridate month yday leap_year
#'@export
yday2 <- function(x){
  is.leap.year <- leap_year(x)
  is.janfeb <- month(x) < 3L
  ans <- yday(x)
  ans <- ifelse(!is.janfeb & !is.leap.year, ans + 1, ans)
  ans
}
