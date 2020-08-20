# https://leetcode.com/problems/next-greater-element-ii/

    def next_greater_elements(nums)
        stack = []
        result = []
        while el = (nums.pop)
            if stack.last == nil
                result << -1
                stack << el
            elsif stack.last > el
                result << stack.last
                stack << el
            elsif stack.last <= el
                while stack.last != nil && stack.last <= el
                    stack.pop
                end
                if stack.last
                    result << stack.last
                    stack << el 
                else
                    result << -1
                    stack << el
                end
            end
        end

        return result.reverse.join('')
    end

next_greater_elements([5, 1, 6, 2, 2, 3])

