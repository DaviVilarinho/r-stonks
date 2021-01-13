#     __                              _   
#    / _| ___  _ __ ___  ___ __ _ ___| |_ 
#   | |_ / _ \| '__/ _ \/ __/ _` / __| __|
#   |  _| (_) | | |  __/ (_| (_| \__ \ |_ 
#   |_|  \___/|_|  \___|\___\__,_|___/\__|
#                                         

################################################################################
# yet another almost GGM model but better
## return forecasted array

forecast <- function(first_fcf,                 # basic free-cash-flow
                     growth,                    # growth (1+%, like 1.075 = 7.5%)
                     time,                      # in your units, usually years
                     accelerator = 1,           # growth of the growth, can be used to reduce if < 1 (0.94 = -6%/year), 1 default, don't xlr8ed.
                     wacc = 1)                  # weighted average cost capital IF YOU WANT DISCOUNT CASH FLOWS MODEL
{
    fcfs <- c(first_fcf)

    for (i in 1:time)
    {
        growth <- growth * accelerator
        fcfs <- c(fcfs, fcfs[length(fcfs)] * growth/wacc)
    }

    return(fcfs)
}

################################################################################
# now yes the GGM '-'
## return "fair enterprise value"

ggm_forecast <- function(first_fcf,
                         growth,                    
                         time,                      
                         accelerator = 1,           
                         wacc = 1)                  
{
    if (wacc != 1)
    {
        fcf_series <- forecast(first_fcf, growth, time, accelerator, wacc) # recycle
    
        final_growth <- growth^time * accelerator^time
        next_fcf   <- fcf_series[length(fcf_series)] * final_growth / wacc

        # Perp = d_(+1)/(r-g)
        perpetuity <- next_fcf/(1-wacc - (1-final_growth))

        return (perpetuity + sum(fcf_series))
    }
    else
        return(-1)
}
