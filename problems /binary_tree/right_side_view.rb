# https://leetcode.com/problems/binary-tree-right-side-view/submissions/

def right_side_view(root)
	stack = [[root]]
    result = []
	while stack.length != 0 && stack[0].length != 0 && !root.nil?
		current_level = stack.shift
        new_level = []
        j = nil
		current_level.each do |el|
            if el
                if el.left
                    new_level = new_level + [el.left]
                end
                if el.right
                    new_level = new_level + [el.right]
                end
                j = el.val
            end
		end
		if new_level.length > 0
			stack << new_level
		end
        result << j
	end
    result
end

