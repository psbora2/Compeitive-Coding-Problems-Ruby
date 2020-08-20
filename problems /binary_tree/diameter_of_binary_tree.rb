# https://leetcode.com/problems/diameter-of-binary-tree/

def diameter_of_binary_tree(root)
    k = DiaMeter.new
    k.diameter_of_binary_tree(root)
    (k.max)
end

class DiaMeter
    attr_accessor :max
    def initialize
        @max = 0
    end
    
    def diameter_of_binary_tree(root)
        if root.nil? || root.val.nil?
            return 0
        else
            if root.left.nil?
                l = 0
            else
                l = diameter_of_binary_tree(root.left) + 1
            end
            
            if root.right.nil?
                r = 0
            else
                r = diameter_of_binary_tree(root.right) + 1
            end

            debugger
            
            temp = [l,r].max
            @max = [@max, temp, l+r].max
            temp
        end
    end
end

diameter_of_binary_tree(root)