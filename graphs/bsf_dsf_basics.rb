graph = {
  A: [:B, :C],
  B: [:D, :E],
  C: [:F],
  D: [],
  E: [:F],
  F: []
}

def bsf(starting_point:, graph:)
  # Note: on big graphs it's better to use Set because
  # .include? in array is O(n)
  visited = []
  queue = [starting_point]

  while queue.any?
    current_node = queue.shift
    puts "Visiting: #{current_node}"
    visited << current_node

    graph[current_node].each do |neighbor|
      queue << neighbor unless visited.include?(neighbor) || queue.include?(neighbor)
    end
  end
end

puts "BSF algorithm:"
bsf(starting_point: :A, graph: graph)


def dfs(starting_point:, graph:)
  # Note: on big graphs it's better to use Set because
  # .include? in array is O(n)
  visited = []
  stack = [starting_point]

  while stack.any?
    current_node = stack.pop
    next if visited.include?(current_node)
    puts "Visiting: #{current_node}"
    visited << current_node

    # Add .reverse to keep order
    graph[current_node].reverse.each do |neighbor|
      stack.push(neighbor) unless visited.include?(neighbor)
    end
  end
end

puts "DFS algorithm:"
dfs(starting_point: :A, graph: graph)
