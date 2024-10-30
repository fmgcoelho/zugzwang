using Dates

function budget(items, overhead=0.25)
    partial = sum(items)
    partial_overhead = overhead * partial
    total = partial + partial_overhead
    return (partial, partial_overhead, total)
end

function get_budget()
    items = [700, 500, 576, 2660, 12*1686]
    (partial, overhead, total) = budget(items)
    println("Partial : $(partial)\nOverhead: $(overhead)\nTotal   : $total")
end

function project_month(n, startdate=Date(2024,09,01))
    months = Dates.Month(n)
    return startdate + months
end

function get_month(month=8)
    cm = project_month(month)
    println("M$(month) -> $(cm)")
end

get_budget()