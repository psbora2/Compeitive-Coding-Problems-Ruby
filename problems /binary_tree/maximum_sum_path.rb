# https://leetcode.com/problems/binary-tree-maximum-path-sum/

def max_path_sum(root)
    k = MaxSum.new
    k.max_path_sum(root)
    k.max
end

class MaxSum
    attr_accessor :max
    def initialize
        @max = -(1/0.0)
    end
    
    def max_path_sum(root)
        if root.nil?
            return nil
        else
            val = root.val
            l = max_path_sum(root.left)
            r = max_path_sum(root.right)
            if l.nil? && r.nil?  
                temp = val
            elsif l.nil? 
                temp = [(val + r), val].max
            elsif r.nil?
                temp = [(val + l), val].max
            else
                temp = [val, val+r, val+l].max
            end
            @max = [temp, @max, sum(val, r,l)].max
            temp
        end
    end

    def sum( val, r, l)
        if l.nil? && r.nil?
            return val
        elsif l.nil? && !r.nil?
            return (val+r)
        elsif !l.nil? && r.nil?
            return (val+l)
        else
            return (val+l+r)
        end
    end
end