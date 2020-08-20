# https://leetcode.com/problems/implement-queue-using-stacks/


class MyQueue

=begin
    Initialize your data structure here.
=end
    def initialize()
        @s1 = Array.new
        @s2 = Array.new
    end


=begin
    Push element x to the back of queue.
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        @s1 << x
    end


=begin
    Removes the element from in front of queue and returns that element.
    :rtype: Integer
=end
    def pop()
        while el = @s1.pop
            @s2 << el
        end
        k = @s2.pop
        while el = @s2.pop
            @s1 << el
        end
        return k
    end


=begin
    Get the front element.
    :rtype: Integer
=end
    def peek()

        while el = @s1.pop
            @s2 << el
        end

        f = @s2.last

        while el = @s2.pop
            @s1 << el
        end
        return f
    end


=begin
    Returns whether the queue is empty.
    :rtype: Boolean
=end
    def empty()
        @s1.length == 0
    end
end