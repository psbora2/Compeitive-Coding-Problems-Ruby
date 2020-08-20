# https://leetcode.com/problems/longest-palindromic-substring/

def longest_palindrome(string)
    result = {}
    max_substring = ""
    length = string.length
    for i in 0..(length - 1)
        intital_point = i
        for j in 0..(length - 1 - i)
            sub_string = string[j..(i+j)]
            puts sub_string
            if sub_string == "aba"
            end

            if i == 0
                max_substring = sub_string
                result[sub_string] = 1
            elsif  i == 1 && string[j] == string[i + j]
                max_substring = sub_string
                result[sub_string] = 1
            else
                if string[j] == string[i + j] && result[string[(j+1)..(i+j -1)]] == 1
                    max_substring = sub_string
                    result[sub_string] = 1
                else
                    result[sub_string] = 0
                end
            end
        end
    end
    max_substring
end

longest_palindrome("caba")