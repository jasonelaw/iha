`as.data.frame.rle` <-
function (x) 
{
    data.frame(values = x$value, lengths = x$length)
}
