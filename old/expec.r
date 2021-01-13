years <- 15

expecting <- function(expec, g, gm) {
    for (i in 1:years) {
        expec <- c(expec, expec[i]*g)
        g <- g*gm
    }

    return(expec)
}

profit <- function(expec, price, pl) {
    return(((sum(expec)+(expec[length(expec)]*pl))/price)^(1/years))
}
