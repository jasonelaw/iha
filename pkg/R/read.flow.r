read.flow <-
    function(..., 
        site, start.date, end.date = NULL, gauge = F, file = NULL)
{
  if (is.null(file)) {
    parameter <- 'cb_00060=on'
    if (gauge) parameter <- paste( parameter, 'cb_00065=on', sep = '&')
    if (is.null(end.date)){
      end.date <- ""
    } else {
      end.date <- sprintf('&end_date=%s', as.Date(end.date))
    }
    input <- sprintf("http://waterdata.usgs.gov/nwis/dv?site_no=%s&%s&begin_date=%s%s&format=rdb",
        site, parameter, as.Date(start.date), end.date) 
  } else {
    input <- file 
  }
  cat(paste("Retrieving data from: \n", input, "\n",sep=""))
  flow <- read.delim(file = input, header = T, comment.char = "#", as.is = T)
  nms <- c("agency","site_no","date","discharge","discharge_qual")
  if (gauge) nms <- c(nms, "gauge", "gauge_qual")
  names(flow) <- nms
  flow <- flow[-1,]
  flow$date<- as.POSIXct(strptime(flow$date, format="%Y-%m-%d"))
  flow$discharge <- as.numeric(flow$discharge)
  if (gauge){
    flow$gauge <- as.numeric(flow$gauge)
  }
  flow <- as.data.frame(flow)
  attr(flow, 'url') <- input
  class(flow) <- c('flow', 'data.frame')
  cat("Finished!\n")
  return(flow)
}
