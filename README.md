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

## Example USage
```ruby
stack = []
stack.push(1) # O(1)
stack.push(2) # O(1)
top = stack.pop # O(1)
stack.empty? # O(1)
```


# Efficient Implementation of Queues 
Built in Ruby MRI Arrays which are dynamic arrays under the hood and the `shift` operation for dequeing is O(N). 


non-standard options available via containers gem, with O(1) Enqueue, dequeue, length and empty. Caveat need to implement peek yourself

## Containers/dequeue backed by doubly linkedlist

```ruby
# Install the gem if needed: gem install containers
require 'containers/deque'

# Create a new deque (double-ended queue)
deque = Containers::Deque.new

# Push elements to both ends
# recommend use push_back -> push
# recommend use pop_front -> pop
deque.push_front(1)   # front → 1
deque.push_back(2)    # front → 1, back → 2
deque.push_back(3)    # front → 1, back → 3

# Pop elements from both ends
puts deque.pop_front  # => 1
puts deque.pop_back   # => 3

# Current front element
deque.push_front(0)
deque.push_back(9)

# No built-in peek, but you can dequeue and reinsert if needed
def qpeek()
    raise IndexError, "peek_front from empty deque" if deque.empty?
    front = deque.pop_front
    deque.push_front(front)
    front
end

# Check size and emptiness
    puts "Size: #{deque.length}"   # => 2
    puts "Empty? #{deque.empty?}"  # => false
```
