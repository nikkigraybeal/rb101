# Rewrite your recursive fibonacci method so that it computes its results without recursion.


def fibonacci(nth)
  nth -= 1
  leading = 1
  trailing = 0
  nth.times do |n|
    next_num = leading + trailing
    trailing = leading
    leading = next_num
  end
  leading
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501