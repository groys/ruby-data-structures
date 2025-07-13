# ruby-data-structures

# Efficient Ruby implementation of heaps:
- MaxHeap
- MinHeap
- PriorityQueue

Supports O(1) peek, O(log n) insert/remove.

## Example Usage

```ruby
max = MaxHeap.new([5, 1, 3])
p max.pop  # => 5
min = MinHeap.new([5, 1, 3])
p min.pop  # => 1
pq = PriorityQueue.new([[3, 'C'], [1, 'A'], [2, 'B']])
p pq.pop  # => [1, "A"]
```

# Efficient Implementation of Stacks
Built in Ruby MRI Arrays which are dynamic arrays under the hood implemented in C works well

```ruby
stack = []
stack.push(1) # O(1)
stack.push(2) # O(1)
top = stack.pop # O(1)
stack.empty? # O(1)
```
