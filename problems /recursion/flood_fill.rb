# https://leetcode.com/problems/flood-fill/

def flood_fill(image, sr, sc, new_color)
    k = FloodFill.new
    k.image = image
    k.flood_fill(sr, sc, new_color)
end

class FloodFill
    attr_accessor :image
    
    def flood_fill(sr, sc, new_color)
        if @image[sr] && @image[sr][sc] && sr >= 0 && sc >= 0 && @image[sr][sc] != new_color 
            puts "#{sr}, #{sc}"
            k = @image[sr][sc]
            @image[sr][sc] = new_color
            if @image[sr + 1 ] && @image[sr + 1 ][sc] && @image[sr + 1 ][sc] == k
                flood_fill(sr + 1, sc, new_color)
            end
            if @image[sr - 1 ] && @image[sr - 1 ][sc] && @image[sr - 1 ][sc] == k
                flood_fill(sr - 1, sc, new_color)
            end
            
            if @image[sr ] && @image[sr ][sc + 1] && @image[sr ][sc + 1] == k
                flood_fill(sr, sc + 1, new_color)
            end
            if @image[sr] && @image[sr][sc - 1] && @image[sr][sc-1] == k
                flood_fill(sr, sc - 1, new_color)
            end 
        end
        return @image
    end
    