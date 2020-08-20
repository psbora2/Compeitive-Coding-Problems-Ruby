# https://leetcode.com/problems/sliding-window-maximum/

def max_sliding_window(nums, k)
    result = []
    sliding_window = []
    nums.each_with_index do |el, index|
        sliding_window = insert_in_sliding_window(nums, sliding_window, index, k, el)
        if index >= k -1 
            result << nums[sliding_window.first]
        end
    end
    return result 
end

def insert_in_sliding_window(nums, sliding_window, index, k ,el)
    if sliding_window.first && sliding_window.first <= index - k
        sliding_window.delete_at(0)
    end
    
    if sliding_window.first == nil 
        sliding_window = [index]
    elsif nums[sliding_window.first] <= el
        sliding_window = [index]
    elsif nums[sliding_window.first] > el
        while sliding_window.last && nums[sliding_window.last] <= el
            sliding_window.pop
        end
        sliding_window << index 
    end
    
    return sliding_window
end

max_sliding_window([1,3,1,2,0,5], 3)