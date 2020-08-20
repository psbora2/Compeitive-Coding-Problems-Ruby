

def min_insertions(string, si, ei)
    if si > ei
        return 10000000
    elsif si == ei 
        return 0
    elsif si == ei-1 
        string[si] == string[ei] ? 0 : 1
    else
        if string[si] == string[ei] 
            min_insertions(string, si + 1, ei - 1)
        else
            [min_insertions(string, si + 1, ei), min_insertions(string, si , ei-1)].min + 1
        end
    end
end

min_insertions("mbadm", 0, 4)
@result = []

def min_insertions(string)
    length = string.length
    @result = Array.new(length).map{|k| Array.new(length)}
    
    for i in 0..(length - 1)
        for j in 0..(length - 1 - i)
            if i == 1 || i==0
                if string[j] == string[j+i]
                    @result[j][i+j] = 0
                else
                    @result[j][i+j] = 1
                end
            else
                if( j == 1 && i == 1)
                    debugger
                end
                if string[j] == string[j+i]
                    @result[j][j+i]= @result[j+1][j+i-1]
                else
                    @result[j][j+i]= [@result[j+1][j+i], @result[j][i+j-1]].min + 1
                end
            end

        end
    end
    @result[0][length - 1]
end

min_insertions("zzazz")