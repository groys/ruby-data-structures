# spec/heap_spec.rb
require_relative '../lib/heap'
require 'rspec'

RSpec.describe 'Heaps' do
  context MaxHeap do
    it 'returns maximum element first' do
      heap = MaxHeap.new([3, 1, 5, 2])
      expect(heap.pop).to eq(5)
      expect(heap.pop).to eq(3)
    end

    it 'pushes and pops correctly' do
      heap = MaxHeap.new
      heap.push(10)
      heap.push(4)
      expect(heap.pop).to eq(10)
      expect(heap.pop).to eq(4)
    end

    it 'peeks at the top element' do
      heap = MaxHeap.new([7, 2, 9])
      expect(heap.peek).to eq(9)
      expect(heap.size).to eq(3)
    end
  end

  context MinHeap do
    it 'returns minimum element first' do
      heap = MinHeap.new([3, 1, 5, 2])
      expect(heap.pop).to eq(1)
      expect(heap.pop).to eq(2)
    end
  end

  context PriorityQueue do
    it 'returns elements based on priority' do
      pq = PriorityQueue.new([[3, 'C'], [1, 'A'], [2, 'B']])
      expect(pq.pop).to eq([1, 'A'])
      expect(pq.pop).to eq([2, 'B'])
      expect(pq.pop).to eq([3, 'C'])
    end
  end
end
