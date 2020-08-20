def frequency_sort(s)
    j = ''
    strings = s.split('')
    hash={}
    strings.each do |el|
        if hash[el]
            hash[el] = hash[el] + 1
        else
            hash[el] = 1
        end
    end
    
    k = hash.keys.sort
    k.each do |key|
        j = j + (key*hash[key])
    end
    
    return j
    
end