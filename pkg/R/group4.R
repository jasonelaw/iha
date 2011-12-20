`group4` <-
function (x) 
{
    q <- quantile(as.numeric(x), probs = c(0.25, 0.75))
    p <- pulses(as.numeric(x), q)
    st.date <- index(x)[rle.start(p)]
    st.date.wy <- water.year(st.date)
    numbers <- sapply(split(p$values, st.date.wy), pulse.numbers)
    ldp <- split(as.data.frame(p), st.date.wy)
    lengths <- sapply(ldp, FUN = pulse.location)
    res <- cbind(number = t(numbers), length = t(lengths))
    names(res) <- c('number of low', 'number of high', 'length of low', 'length of high')
    return(res)
}
