graph = {
  A: [:B, :C],
  B: [:D, :E],
  C: [:F],
  D: [],
  E: [:F],
  F: []
}

def shortest_path(graph, departure:, arrival:)
  # `previous_nodes` is a hash where:
  # key - current node
  # value - previous node (from where we come from)
  # For example, we came to  B from A
  # { :B => :A }
  previous_nodes = { departure => nil }

  # 1. Find the path
  queue = [departure]

  while queue.any?
    current_node = queue.shift
    puts "Visiting: #{current_node}"

    break if current_node == arrival

    graph[current_node].each do |neighbor|
      next if previous_nodes.key?(neighbor)

      previous_nodes[neighbor] = current_node
      queue << neighbor
    end
  end

  return 'NO PATH' unless previous_nodes.key?(arrival)

  # 2. Return the shortest way
  path = build_path(previous_nodes, departure, arrival)

  puts "SHORTEST PATH: #{path}"
end

# It returns reversed path
def build_path_recursively(previous_nodes, current_node, departure, path=[])
  path << current_node

  return path if current_node == departure

  build_path(previous_nodes, previous_nodes[current_node], departure, path)
end

def build_path(previous_nodes, departure, arrival)
  path = []
  current = arrival

  while true do
    path << current
    break if current == departure
    current = previous_nodes[current_node]
  end

  path.reverse
end

shortest_path(graph, departure: :A, arrival: :F)
