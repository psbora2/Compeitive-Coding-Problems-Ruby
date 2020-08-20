#https://leetcode.com/problems/string-to-integer-atoi/

def my_atoi(str)
    
    first_string = nil
    sign = +1
    j = []
    str.split('').each do |el|
        if el == " " && first_string == nil
        elsif el == "-" && first_string ==nil
            sign = -1
            first_string = "-1"
        elsif el.to_i.to_s == el && first_string == nil
            first_string = el
            j << el
        elsif el.to_i.to_s == el && first_string != nil
            first_string = el
            j << el
        elsif el.to_i.to_s != el && first_string != nil
            break
        elsif el.to_i.to_s != el
            break
        end
    end
    
    number = j.join('').to_i
    
    if number >= 214748364 && sign == -1
        number = 2147483648
    elsif number >= 214748364 && sign == +1
        number = 2147483647
    end
    return sign*number
end