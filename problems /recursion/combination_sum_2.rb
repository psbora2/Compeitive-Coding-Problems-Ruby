# https://leetcode.com/problems/combination-sum-ii/

def combination_sum2(candidates, target)
    combination = []
    if candidates.length > 0
        candidates.each_with_index do |el, index|
            diff = target - el
            if diff == 0
                combination << [el]
            elsif diff > 0
                if (f = combination_sum2(candidates[(index+1)..-1], diff)).class == Array && f.length > 0
                    f.each do |j|
                        combination << ([el] + j)
                    end
                end       
            elsif (target -el) < 0
            end    
        end 
    end
    combination = combination.map{|el| el.sort}

    return combination.uniq
end

combination_sum2([10,1,2,7,6,1,5], 8)