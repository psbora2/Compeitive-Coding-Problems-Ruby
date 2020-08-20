# https://leetcode.com/problems/rotting-oranges/

def oranges_rotting(array)
    rotten_hash = get_rotten_cordinates(array)
    prev_hash = {}
    count = 0
    k = {}

    while rotten_hash.values.include?(2)

        prev_hash.merge!(rotten_hash)
        rotten_hash.each do |k, v|
            if v == 2
                cordinate = k.split(',').map{|i| i.to_i}
                # blast
                [-1,0, 1].each do |x|
                    [-1,0, 1].each do |y|
                        if x == 0 || y == 0
                            if prev_hash["#{cordinate[0] + x}, #{cordinate[1]+y}"] == 1
                                prev_hash["#{cordinate[0] + x}, #{cordinate[1]+y}"] = 2
                            end
                        end
                    end
                end
                prev_hash.delete(k)
            end
        end
        rotten_hash = k.merge(prev_hash)
        count = count + 1

    end


    if rotten_hash.keys.length > 0
        return -1
    elsif count == 0
        return 0
    else
        return count -1
    end
end


def get_rotten_cordinates(array)
    hash = {}
    array.each_with_index do |val, o_i|
        val.each_with_index do | val, i_i|
            if val == 1 || val == 2
                hash["#{o_i}, #{i_i}"] = val
            end
        end
    end
    return hash
end

rotten_oranges([[2,1,1],[1,1,0],[0,1,1]])
