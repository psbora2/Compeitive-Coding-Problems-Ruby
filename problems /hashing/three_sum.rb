def three_sum(nums)
    target = 0
    hash_2 = {}
    length = nums.length
    for i in 0..(length - 1)
        for j in (i+1)..(length - 1)
            if i != j
                value = nums[i] + nums[j]
                if hash_2[value]
                    hash_2[value] << [i, j]
                else
                    hash_2[value] = [[i, j]]
                end
            end
        end
    end
    result = []
    hash_3 = {}
    nums.each_with_index do |el, index|
        if hash_2[target - el]
            hash_2[target - el].each do |val|
                if !val.include?(index) && !hash_3["#{[nums[val[0]], nums[val[1]], el].sort}"]
                    result << [el] + [nums[val[0]], nums[val[1]]]
                    hash_3["#{[nums[val[0]], nums[val[1]], el].sort}"] = 1
                end
            end
        end
    end
    
    result
end

 nums = [-1,0,1,2,-1,-4]

 three_sum(nums)