graph = {
  A: { B: 4, C: 2 },
  B: { E: 3 },
  C: { B: 1, D: 4 },
  D: { E: 1 },
  E: {}
}

def find_cheaper_path(graph, departure:, arrival:)
  # 1. Initialize initial costs
  costs = {}
  graph.keys.each do |key|
    costs[key] = Float::INFINITY
    costs[key] = 0 if key == departure
  end

  # 2. Initialize Parents and Processed
  parents = { departure => nil }
  processed = []

  # 3. Initialize first node
  node = find_lowest_cost_node(costs: costs, processed: processed)

  # 4. Find the parents (to build the path in the next step)
  # and less costs to arrive to the final destination
  while node
    cost = costs[node]

    # NOTE: parent - from where did we come, neighbor - to where could we go
    # For each neighbor of the given node
    graph[node].each do |neighbor, weight|
      # calculate new cost to get the neighbor through the current node
      new_cost = cost + weight

      # if the new cost is more effective -> update parents and costs
      # otherwise keep as original
      if new_cost < costs[neighbor]
        costs[neighbor] = new_cost
        parents[neighbor] = node
      end
    end

    # mark the given node as processed because we already checked all its neighbors
    processed << node

    # find the next unprocessed node with the lowest cost
    node = find_lowest_cost_node(costs: costs, processed: processed)
  end

  cost = costs[arrival]
  return 'NO PATH' if costs[arrival] == Float::INFINITY

  path = build_path(parents: parents, departure: departure, arrival: arrival)

  { path: path, cost: cost }
end

# Example input costs
# costs = {
#   A: 0,
#   B: 4,
#   C: 2,
#   D: Float::INFINITY,
#   E: Float::INFINITY
# }
#
# The result is the key of the node ex: :A
def find_lowest_cost_node(costs:, processed:[])
  min_key = nil
  min_value = nil

  costs.each do |k, v|
    next if processed.include?(k)

    if min_key == nil || min_value > v
      min_key = k
      min_value = v
    end
  end

  min_key
end

# Example of the parents:
# {:A=>nil, :B=>:C, :C=>:A, :D=>:C, :E=>:B}
#
# departure: :A, arrival: :E
def build_path(parents:, departure:, arrival:)
  path = []
  current = arrival

  while current
    path << current
    break if current == departure

    current = parents[current]
  end

  path.reverse
end

puts find_cheaper_path(graph, departure: :A, arrival: :E)
