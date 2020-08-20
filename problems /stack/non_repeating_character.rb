# https://www.interviewbit.com/problems/first-non-repeating-character-in-a-stream-of-characters/

    def fnrc(string)
        result = []
        stack = []
        hash = {}
        array = string.split('')
        array.each do |k|
            if hash[k]
                hash[k] = hash[k] + 1
            else
                hash[k] = 1
            end

            stack << k
            if hash[k]
                while stack.first != nil && hash[stack.first] && hash[stack.first] > 1
                    stack.delete_at(0)
                end
            end

            if stack.first == nil
                result << "#"
            else
                result << stack.first
            end

        end
        result.join('')
    end

    fnrc("abadbc")