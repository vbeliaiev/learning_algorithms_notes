# Some updates to compare with solution1:
# Significant change:
#  - replace default power method by method that works with mod. That makes HackerRank tests pass.
#
# Minor changes:
# - rename main function to legoBlocks
# - add mod inside of legoBlocks method calculations

def legoBlocks(height, width)
  mod = 10**9 + 7
  #1 Calculate possible combinations for the single line from 0 up to width
  max_row_ways = max_possible_combinations(width)

  #2 calculate max possible total (bad + good) walls
  total_ways = max_row_ways.map { |nb_ways| pow_mod(nb_ways, height, mod) }

  #3 calculate final result (more details in comments above the method)
  good_ways = Array.new(width + 1, 0)
  good_ways[0] = 1
  good_ways[1] = 1

  2.upto(good_ways.size - 1) do |curr_wall_width|

    sum = 0
    1.upto(curr_wall_width - 1) do |breakline_index|
      sum += good_ways[breakline_index] * total_ways[curr_wall_width - breakline_index]
    end

    good_ways[curr_wall_width] = (total_ways[curr_wall_width] - sum) % mod
  end

  good_ways[width]
end


# Returns an array where index is a size of the line and a value is a possible ways to build that line
def max_possible_combinations(size)
  building_blocks = [1,2,3,4]

  result = Array.new(size + 1, 0)
  result[0] = 1

  (1..size).each do |current_size|
    building_blocks.each do |block|
      result[current_size] += result[current_size - block] if current_size - block >= 0
    end
  end

  result
end

## Optimized power method
def pow_mod(base, exp, mod)
  result = 1
  base = base % mod
  while exp > 0
    result = (result * base) % mod if exp.odd?
    base = (base * base) % mod
    exp >>= 1
  end
  result
end
