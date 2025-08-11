### Some explications for the algorithm

## 1.
# left part * right part = total wall (ways) divided by 2 parts
# => bad (bad even if each part is good e.g. no breaklines)

#
# |------- w---------|
# |---i----|
#          |-(w - i)-|
# ===================
# =        |        =
# =        |        =
# =        |        =
# ===================

## 2
# In the 1st step it's only one of many cases where breakline could be.
# The breakline can move, so for each step of the line we should calculate left * right

## 3
# - We already know the total of possible combinations (ways) for the wall. It's counted as nb_ways for single line in a power of height. (nb_ways ** height)
# - For the given wall width, good combinations (ways) are: all combinations - bad (unsolid/splitted) combinations. (good = total - bad)

# General formula:
#
# good = total[w] - sum(bad)
#
# "good" - good possible combinations (ways)
# "total" - all possible combinations
# "bad" - combinations with breaklines (unsolid)
# w - width of the wall (the total[w] means the number of all combinations for the wall size w)

# Sum calculates as:
# from breakline_index = 1 to (width - 1) do:
#   left[breakline_index] * right[width - breakline_index]

## Problem [!]
# bad layouts could be calculated tiwce for the same layout if it has 2 breaklines

# |------- w---------|
# |---i----|
# |------j-------|
# ====================
# =        |     |   =
# =        |     |   =
# =        |     |   =
# ====================

## Solution:
# This resolves when the left part is always good (e.g. no breaklines)
# The correct sum formula looks like:
#
# from breakline_index = 1 to (width - 1) do:
#   good[breakline_index] * total[width - breakline_index]


def blocks(height, width)
  #1 Calculate possible combinations for the single line from 0 up to width
  max_row_ways = max_possible_combinations(width)

  #2 calculate max possible total (bad + good) walls
  total_ways = max_row_ways.map { |nb_ways| nb_ways ** height }

  #3 calculate final result (more details in comments above the method)
  good_ways = Array.new(width + 1, 0)
  good_ways[0] = 1
  good_ways[1] = 1

  2.upto(good_ways.size - 1) do |curr_wall_width|

    sum = 0
    1.upto(curr_wall_width - 1) do |breakline_index|
      sum += good_ways[breakline_index] * total_ways[curr_wall_width - breakline_index]
    end

    good_ways[curr_wall_width] = total_ways[curr_wall_width] - sum
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
