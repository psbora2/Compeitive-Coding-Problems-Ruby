# https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/


def divide_string_into_two_part(string)
    length = string.length

    if length.even?
        first_half = string[0..((length-1)/2)]
        second_half = string[(length/2)..(length - 1)]
    else
        first_half = string[0..(length/2)]
        second_half = string[((length+1)/2)..(length - 1)]
    end

    return [first_half, second_half]
end

def concat_string(s1, s2)
    puts "#{s1} #{s2} ====="
    if s1[-1] != "" && s2[0] != "" && s1[-1] == s2[0]
        if s1.length == 1
            concat_string("", s2[1..(-1)])
        else
            return concat_string(s1[0..((s1.length) - 2)], s2[1..(-1)])
        end
    else
       return s1 + s2
    end
end

def remove_duplicates(string)
    if string.length == 1
        return string
    elsif string.length == 2
        if string[0] == string[-1]
            return ""
        else
            return string
        end
    elsif string.length > 2

        first_half, second_half = divide_string_into_two_part(string)
        first_half = remove_duplicates(first_half)
        second_half = remove_duplicates(second_half)
        binding.pry
        puts "#{first_half} #{second_half} ====="
        return concat_string(first_half, second_half)
    end
end


def remove_duplicates(string)
    last_element = nil
    stack = []
    string.split('').each do |el|
        if stack.last && stack.last == el
            last_element = el
            stack.pop
        elsif last_element && last_element == el
        else
            stack << el
            last_element = nil
        end
    end
    stack.join('')
end


remove_duplicates("aaaaaaaaaaaaa")
