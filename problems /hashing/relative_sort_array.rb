# https://leetcode.com/problems/relative-sort-array/

def relative_sort_array(arr1, arr2)
    new_array = []
    arr1
    arr3 = arr2

    arr2.each do |el|
        arr1.each_with_index do |el2, index|
            if el == el2
                new_array << el2
                arr3.delete_at(index)
            end
        end
    end
    return(new_array + arr3.sort)
end