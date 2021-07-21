=begin

#Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

#Given an array of integers called numbers#
#iterate through numbers adding each item to running_total
#divide running_total by size of numbers array

def average(numbers)
  running_total = 0
  numbers.each do |number|
    running_total += number
  end
  puts running_total.to_f / numbers.size.to_f
  running_total / numbers.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
#The tests above should print true.
=end

def average(array)
  array.reduce(:+) / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
#The tests above should print true.