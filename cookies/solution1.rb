def cookies(min_swetness, a)
  return -1 if a.size == 0 || a.sum < min_swetness

  a = a.sort
  i = 0

  while true

    unless a[1] # if array size is 1 -> return either operations count number or -1
      a[0] >= min_swetness ? (return i) : (return -1)
    end

    f_cookie, s_cookie = a[0], a[1]

    # When the 1st and 2nd ellements are greatest than min swetness
    # It means all cookies are sweet enough
    return i if f_cookie >= min_swetness && s_cookie >= min_swetness



    value = f_cookie + 2 * s_cookie
    a.shift(2)

    if a.size <= 1
      a.push(value)
    else
      # this can't work with an array.size =< 1
      index = find_index(value, a)
      a.insert(index, value)
    end
    i += 1
  end
end

def find_index(el, a)
  down_index = 0
  top_index = a.size - 1
  counter = 0

  return top_index + 1 if el >= a[top_index]
  return down_index if el <= a[down_index]

  loop do
    median_index = down_index + (top_index - down_index) / 2

    # good condition
    if el >= a[median_index - 1] && el <= a[median_index]
      return median_index
    end

    if el > a[median_index]
      down_index = median_index
    else
      top_index = median_index
    end
  end
end