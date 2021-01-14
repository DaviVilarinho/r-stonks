################################################################################
# Safety margin: return a table with 33% less to 33% more in price, pe, identifying how much to expect.

safety_margin <- function(fcfs,
                          price,
                          pe,
                          wacc, 
                          real=TRUE)
{
    foo <- 1/3

    price_pe_table <- c()

    for (i in 1:3)
    {
        line <- c()
        for (j in 1:3)
        {
            if (real)
                line <- c(line, real_profit(fcfs,
                                            price*(foo+i/3),
                                            pe*(foo*j/3),
                                            wacc,
                                            F))
            else
                line <- c(line, total_profit(fcfs,
                                             price*(foo+i/3),
                                             pe*(foo+j/3)))
        }
        price_pe_table <- rbind(price_pe_table, line)    
    }

    row.names(price_pe_table) <- c(2*price/3, price, 4*price/3)
    colnames(price_pe_table) <- c(2*pe/3, pe, 4*pe/3)
    return(price_pe_table)
}
