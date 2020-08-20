# https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/

def vertical_traversal(root)
    ash = Tom.new
    ash.hashing_tree(root, 0)
    result = []
    
    keys = ash.level_hash.keys
    
    hash = ash.level_hash
    keys = keys.sort{|a,b| a.to_s.to_i <=> b.to_s.to_i}
    j = []
    print keys
    keys.each do |key|
        result << hash[key]
    end
    result
end

class Tom
    attr_accessor :level_hash
    def initialize
        @level_hash = {}
    end
    
    def hashing_tree(root, level)
        stack = [[[root, 0]]]
        while stack.length != 0 && stack[0].length != 0 && !root.nil?
            current_level = stack.shift
            new_level = []

            current_level.each_with_index do |el|
                if el[0]
                    if el[0].left
                        new_level << [el[0].left, el[1] - 1]
                    end
                    if el[0].right
                        new_level << [el[0].right, el[1] + 1]
                    end


                    if self.level_hash[:"#{el[1]}"]  
                        self.level_hash[:"#{el[1]}"]  =  self.level_hash[:"#{el[1]}"] +[el[0].val] 
                    else
                        self.level_hash[:"#{el[1]}"] = [el[0].val]
                    end
                end
            end
            if new_level.length > 0
                stack << new_level
            end
        end
    end
end