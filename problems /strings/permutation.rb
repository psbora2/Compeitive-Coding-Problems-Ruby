
# https://leetcode.com/problems/subarray-sum-equals-k/

def add_element_and_save_one(string_array, level)
    if string_array.length == 1
        return string_array[0]
    else
        strings = []
        string_array.each do |el|
            update_string = Array.new(string_array)
            update_string.delete(el)
            j = add_element_and_save_one(update_string, level + 1)
            if j.class == Array
                strings = strings  + j.map{|k| el+ k}
            else
                strings =  strings  + [el + j ]
            end
        end
        if level === 1
            strings.map{|k| print k+" "}
        end
        return strings
    end
end

add_element_and_save_one("lkjhq".split('').sort, 1)
