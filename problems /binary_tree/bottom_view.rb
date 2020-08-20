def bottom_view(root)
    stack = [[root]]
    result = []
    bottom = []
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
                if el.left.nil? && el.right.nil?
                    bottom << el.val
                end
            end
        end
        if new_level.length > 0
            stack << new_level
        end
    end
    bottom
end

bottom_view(tree)