# https://leetcode.com/problems/longest-substring-without-repeating-characters/


def length_of_longest_substring(string)
    initial = 0
    end_point = 1
    size = 0
    count = 0
    max_count = 0
    hash = {}
    while end_point <= ((string.length) - 1)
        puts "#{initial}, #{end_point}"

        if !hash[string[end_point]]
            hash[string[end_point]] = 1
            end_point = end_point + 1
            max_count = [hash.size, max_count].max
        else
            hash.delete(string[inital])
            initial = initial + 1
        end
    end
    max_count
end

length_of_longest_substring("dvdf")