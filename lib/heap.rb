# GenericHeap: supports MaxHeap, MinHeap, and PriorityQueue
class GenericHeap
  def initialize(array = [], &cmp)
    @cmp = cmp || ->(a, b) { a > b }  # Default is MaxHeap
    @heap = array.dup
    (@heap.size / 2 - 1).downto(0) { |i| sift_down(i) }
  end

  def push(val)
    @heap << val
    sift_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?
    swap(0, @heap.size - 1)
    top = @heap.pop
    sift_down(0)
    top
  end

  def peek
    @heap[0]
  end

  def size
    @heap.size
  end

  def empty?
    @heap.empty?
  end

  private

  def sift_up(i)
    while i > 0
      parent = (i - 1) / 2
      break if @cmp.call(@heap[parent], @heap[i])
      swap(i, parent)
      i = parent
    end
  end

  def sift_down(i)
    n = @heap.size
    loop do
      left = 2 * i + 1
      right = 2 * i + 2
      best = i
      best = left if left < n && !@cmp.call(@heap[best], @heap[left])
      best = right if right < n && !@cmp.call(@heap[best], @heap[right])
      break if best == i
      swap(i, best)
      i = best
    end
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end

# Aliases for convenience
class MaxHeap < GenericHeap
  def initialize(array = [])
    super(array) { |a, b| a > b }
  end
end

class MinHeap < GenericHeap
  def initialize(array = [])
    super(array) { |a, b| a < b }
  end
end

class PriorityQueue < GenericHeap
  def initialize(array = [])
    super(array) { |a, b| a[0] < b[0] }  # priority is first element
  end
end

# Example usage:
# max = MaxHeap.new([5, 1, 3])
# p max.pop  # => 5
# min = MinHeap.new([5, 1, 3])
# p min.pop  # => 1
# pq = PriorityQueue.new([[3, 'C'], [1, 'A'], [2, 'B']])
# p pq.pop  # => [1, "A"]
