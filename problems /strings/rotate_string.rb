

def rotate_string(string, times)
    for i in 1..times
        string = string[1..(-1)] + string[0]
    end
    return string
end


def string_manipulation(string1, string2)
    length = string1.length
    k = false

    updated_string = rotate_string(string1, 2)
    if updated_string == string2
        return true
    end

    k
end

string_manipulation("amazon", "azonam")