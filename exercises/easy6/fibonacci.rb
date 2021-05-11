# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

=begin
PROBLEM
Input: integer that represents the number of digits a Fibonacci number has
Output: an integer representing the index of the first fib number with that number of digits

Explicit Requirements:
-the index of the first fib number is 1
-fibonacci sequence is produced by adding the previous 2 digits together 1 1 2 3 5 8 13

Implicit Requirements:
-the first array item will be 0
-

EXAMPLES
DATA STRUCTURES
dynamically generated array of fibonacci numbers

ALGORITHM
1. generate array of fib nums
   -set array[0, 1, 1]
   -iterate over array 
     -next number = (array[-1] + array[-2]
     -add next number to array
     turn next number var into a string
     -if the length of next number string == num of digits then break
   -return index of number turned back into an integer

=end

def find_fibonacci_index_by_length(int)
  fib_arr = [0, 1, 1]
  next_num = 0
  loop do |num|
    next_num = fib_arr[-1] + fib_arr[-2]
    fib_arr.push(next_num)
    next_num.to_s.length >= int ? break : next
  end
  fib_arr.index(next_num.to_i)
end



p  find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
# You may assume that the argument is always greater than or equal to 2.