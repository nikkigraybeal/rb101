# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# Given an array of numbers
# initialize counter = 0
# iterate through the array
  # -for each number add its value to counter and then push that value to a new array 
# return the new array

def running_total(array)
  counter = 0
  new_arr = []
  array.each do |num| 
    counter += num
    new_arr.push(counter)
  end
  new_arr
end

def running_total2(array)
  counter = 0
  array.map {|num| counter += num}
end

def running_total3(array)
  counter = 0
  array.each_with_object([]) do |i, a| 
    a << counter += i
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

p running_total2([2, 5, 13]) == [2, 7, 20]
p running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total2([3]) == [3]
p running_total2([]) == []

p running_total3([2, 5, 13]) == [2, 7, 20]
p running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total3([3]) == [3]
p running_total3([]) == []