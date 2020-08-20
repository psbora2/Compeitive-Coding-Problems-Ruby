
# https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
def zigzag_level_order(root)
    result = []
    stack = [[root]]
    counter = 0

    while stack.length > 0 && stack[0].length > 0 && !root.nil?
        values = []
        new_level = []
        current_level = stack.shift
        
        current_level.each do |el|
            if el
                if el.left
                    new_level << el.left
                end
                if el.right
                    new_level << el.right
                end
            end 
            values << el.val
        end
        stack << new_level
        if counter.even?
            result << values
        else
            result << values.reverse
        end
        counter = counter + 1
    end
    return result     
end