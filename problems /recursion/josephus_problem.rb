def josephus_problem(n, k)
    array = *(1..n)
    index = 0
    while array.length > 1
        index = index + k
        if array[index]
            array.delete_at(index)
        else
            last_index = (array.length) - 1 
            index = index - (last_index + 1)
            array.delete_at(index)
        end
    end
    return array[0]
end


