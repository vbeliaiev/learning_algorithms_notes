def legoBlocks(n, m)
  mod = 10**9 + 7

  row_ways = Array.new(m + 1, 0)
  row_ways[0] = 1

  (1..m).each do |i|
      (1..4).each do |b|
      row_ways[i] += row_ways[i - b] if i - b >= 0
      row_ways[i] %= mod
      end
  end

  total = Array.new(m + 1) { |i| row_ways[i] ** n % mod }

  solid = Array.new(m + 1, 0)
  solid[0] = 1

  (1..m).each do |i|
    solid[i] = total[i]

    (1...i).each do |j|
      solid[i] -= (solid[j] * total[i - j]) % mod
      solid[i] %= mod
    end

    solid[i] = (solid[i] + mod) % mod
  end

  solid[m]
end
