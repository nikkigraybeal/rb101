# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Given an integer greater than 1 called num
# Define a range between 1 and num and transform it to an array called range_arr 
# iterate over range_arr pushing each num that is divisible by 3 to an array called multiples
# do the same for multiples of 5
# remove duplicate items in multiples
# add all of the values in multiples together and return the total

def multisum(num)
  range_arr = (1..num).to_a
  threes = range_arr.select {|n| n % 3 == 0}
  fives = range_arr.select {|n| n % 5 == 0}
  mults = threes + fives
  mults.uniq.reduce(:+)
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168