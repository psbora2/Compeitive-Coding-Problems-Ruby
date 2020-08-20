class Heap
  def initialize(compare_symbol = :<=, storage = [], &compare_fn)
    @heap = storage
    @size = 0
    initialize_compare(compare_symbol, &compare_fn)
  end

  attr_reader :size

  def empty?
    size == 0
  end

  def peak
    @heap[0]
  end
    
  def peek
    @heap[0]
  end

  def pop
    result = peak

    if size > 1
      @size -= 1
      @heap[0] = @heap[@size]
      rebalance_down(0)
    else
      @size = 0
    end

    @heap[@size] = nil

    result
  end

  def add(element)
    @heap[@size] = element
    @size += 1
    rebalance_up(size - 1)
    self
  end

  alias :<< :add

  def replace(element)
    @heap[0] = element
    rebalance_down(0)
  end

  def offer(element)
    if compare(peak, element)
      result = peak
      replace(element)
      result
    else
      element
    end
  end

  def clear
    @heap = []
    @size = 0
  end

  def to_a
    @heap.dup
  end

  private

  def initialize_compare(symbol, &fn)
    @compare = if block_given?
      fn
    elsif symbol == :< or symbol.nil?
      lambda{|a, b| a < b}
    elsif symbol == :>
      lambda{|a, b| a > b}
    else
      raise ArgumentError.new("The comparison symbol needs to be either :> or :<")
    end
  end

  def compare(a, b)
    @compare.call(a, b)
  end

  def rebalance_up(i)
    parent_i = parent(i)

    if has_parent(i) and compare(@heap[i], @heap[parent_i])
      @heap[i], @heap[parent_i] = @heap[parent_i], @heap[i]
      rebalance_up(parent_i)
    end
  end

  def rebalance_down(i)
    left_i = left(i)
    right_i = right(i)

    if has_left(i) and compare(@heap[left_i], @heap[i]) and (not has_right(i) or compare(@heap[left_i], @heap[right_i]))
      @heap[i], @heap[left_i] = @heap[left_i], @heap[i]
      rebalance_down(left_i)
    elsif has_right(i) and compare(@heap[right_i], @heap[i])
      @heap[i], @heap[right_i] = @heap[right_i], @heap[i]
      rebalance_down(right_i)
    end
  end

  def has_parent(i)
    i >= 1
  end

  def parent(i)
    ((i - 1) / 2).floor
  end

  def has_left(i)
    left(i) < size
  end

  def left(i)
    i * 2 + 1
  end

  def has_right(i)
    right(i) < size
  end

  def right(i)
    i * 2 + 2
  end
end


class MedianFinder

=begin
    initialize your data structure here.
=end
    
    attr_accessor :min_heap, :max_heap
    
    def initialize()
        @min_heap = Heap.new(:<)
        @max_heap = Heap.new(:>)
    end


=begin
    :type num: Integer
    :rtype: Void
=end
    def add_num(num)

        if min_heap.size == 0
            min_heap << num
        elsif min_heap.peek <= num
            min_heap << num
        elsif max_heap.size == 0
            max_heap << num
        elsif max_heap.peek >= num
            max_heap << num
        end

        debugger
        
        if (max_heap.size - min_heap.size).abs > 1
            if max_heap.size > min_heap.size
                el = max_heap.pop
                min_heap << el
            elsif max_heap.size < min_heap.size
                el = min_heap.pop
                max_heap << el
            end
        end
        return nil
    end


=begin
    :rtype: Float
=end
    def find_median()
        if (max_heap.size == min_heap.size)
            return (max_heap.peek.to_f + min_heap.peek.to_f)/2
        elsif (max_heap.size > min_heap.size)
            return max_heap.peek.to_f
        elsif max_heap.size < min_heap.size
            return min_heap.peek.to_f
        end
        
    end
end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()