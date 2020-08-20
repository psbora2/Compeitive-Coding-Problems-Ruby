class Array

    def heapify(i = (self.length) - 1)
        if i < 0
            return self
        elsif left_child(i) && left_child(i) > self[i]
            self[i], self[2*i+1] = self[2*i+1], self[i]
        elsif right_child(i) && right_child(i) > self[i]
            self[i], self[2*i+1] = self[2*i+1], self[i]
        end
        
        heapify(i-1)
    end

    def left_child(i)
        self[2*i + 1]
    end

    def right_child(i)
        self[2*i + 2]
    end

    def heap_sort
        
    end
end