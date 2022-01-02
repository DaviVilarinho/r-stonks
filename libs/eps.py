def weighted_eps_sum(eps_series, weighted_capital_cost):
    final_sum = 0
    time_past = 1

    for eps in eps_series:
        final_sum += eps/(weighted_capital_cost ** time_past)

        time_past += 1
    
    return final_sum


def calc_eps(starting_eps, eps_growth_series):
    epses = []
    geometric_growth_sum = 1

    for growth in eps_growth_series:
        geometric_growth_sum *= growth
        epses += [starting_eps * geometric_growth_sum]

    return epses

def weighted_eps_growth_sum(starting_eps, eps_growth_series, wacc):
    return weighted_eps_sum(calc_eps(starting_eps, eps_growth_series), wacc)


