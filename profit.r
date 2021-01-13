#                     __ _ _
#    _ __  _ __ ___  / _(_) |_ 
#   | '_ \| '__/ _ \| |_| | __|
#   | |_) | | | (_) |  _| | |_ 
#   | .__/|_|  \___/|_| |_|\__|
#   |_|                        

# ALL FUNCTIONS MAY RETURN PERCENTAGES LIKE THIS: 1.05 for 5%
# This is because it will easy your calcs ^^, and mine too :3

# return the profit based ONLY on the fcfs forecasted
fcf_profit   <- function(fcfs,
                         price) 
{
    return   (((sum(fcfs)+price)                # fcf sum + price
                /price)
                ^(1/length(fcfs)))               # returning a annual coumpound return
}

#####################################################################################
# return profits based on the forecasted P/E and fcfs received
total_profit <- function(fcfs,
                         price,
                         pe)
{
    return   (((sum(fcfs)+fcfs[length(fcfs)]*pe)  # fcf sum + price considering last pe
                /price)
                ^(1/length(fcfs)))               # returning a annual coumpound return
}

#####################################################################################
# return profits based in the different to the WACC
real_profit  <- function(fcfs, 
                         price,
                         pe,
                         wacc)    # Weighted Average Cost of Capital, kinda 1.05 = 5%
{
    time           <- length(fcfs)                           # fcf count
    nominal_return <- total_profit(fcfs, price, pe)          # getting nominal return

    # now, returning the profit considering your capital cost
    return ((nominal_return^time)/
            (wacc^time)) 
}
