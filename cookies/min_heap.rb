class MinHeap
  def initialize
    @data = []
  end

  def push(value)
    @data << value
    sift_up(@data.size - 1)
  end

  def pop
    return nil if @data.empty?
    swap(0, @data.size - 1)
    min = @data.pop
    sift_down(0)
    min
  end

  def peek
    @data[0]
  end

  private

  def sift_up(index)
    parent = (index - 1) / 2
    return if index <= 0 || @data[parent] <= @data[index]
    swap(parent, index)
    sift_up(parent)
  end

  def sift_down(index)
    left  = 2 * index + 1
    right = 2 * index + 2
    smallest = index

    smallest = left  if left  < @data.size && @data[left]  < @data[smallest]
    smallest = right if right < @data.size && @data[right] < @data[smallest]

    if smallest != index
      swap(index, smallest)
      sift_down(smallest)
    end
  end

  def swap(i, j)
    @data[i], @data[j] = @data[j], @data[i]
  end
end

# Example:
heap = MinHeap.new
heap.push(5)
heap.push(3)
heap.push(8)
heap.push(1)

p heap.pop  # => 1
p heap.pop  # => 3
p heap.pop  # => 5
p heap.pop  # => 8
