read.flow <- function(site = NULL, start.date, end.date = NULL, gauge = F, http = TRUE, file = NULL){
     parameter <- 'cb_00060=on'
     if (gauge) parameter <- paste( parameter, 'cb_00065=on', sep = '&')
     if (is.null(end.date)){
          end.date <- ""
     } else {
          end.date <- paste('&end_date=',format(end.date,"%Y-%m-%d"),sep="")}
     if (inherits(start.date, "Date"))
          start.date <- format(start.date)
     else{
          if(inherits(Sys.time(),"POSIXt")){
               start.date <- format(start.date,"%Y-%m-%d") }
          else{
               start.date <- start.date }}
     if (http){
          input = sprintf("http://waterdata.usgs.gov/nwis/dv?site_no=%s&%s&begin_date=%s%s&format=rdb",
               site, parameter, start.date, end.date) }
     else{
          input = file }
     cat(paste("Retrieving data from: \n", input, "\n",sep=""))
     flow <- read.delim(file=input,header=T,comment.char="#",as.is = T)
     nms <- c("agency","site_no","date","discharge","discharge_qual")
     if (gauge) nms <- c(nms, "gauge", "gauge_qual")
     names(flow) <- nms
     flow <- flow[-1,]
     flow$date<- as.POSIXct(strptime(flow$date,format="%Y-%m-%d"))
     is.na(flow) <- flow == ""
     flow$discharge <- as.numeric(flow$discharge)
     flow$agency <- flow$agency[, drop = T]
     flow$site_no <- flow$site_no[, drop = T]
     flow$discharge_qual <- flow$discharge_qual[, drop = T]
     if (gauge){
          flow$gauge_qual <- flow$gauge_qual[, drop = T]
          flow$gauge <- as.numeric(flow$gauge)}
     flow <- as.data.frame(flow)
     attr(flow, 'url') <- input
     return(flow)
}
