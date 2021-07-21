# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci_last(nth)
  nth -= 1
  leading = 1
  trailing = 0
  nth.times do |n|
    next_num = leading + trailing
    trailing = leading
    leading = next_num
  end
  digit_arr = leading.to_s.chars
  p digit_arr[-1].to_i
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4