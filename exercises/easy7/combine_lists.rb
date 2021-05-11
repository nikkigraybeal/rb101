# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.
require "pry"

def interleave(arr1, arr2)
  new_arr = []
  counter = 0
  loop do 
    new_arr << arr1[counter] 
    new_arr << arr2[counter]
    counter += 1
    break if counter == arr1.size
  end
  new_arr
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def interleave2(arr1, arr2)
  new_arr = arr1.zip(arr2).flatten
  new_arr
end

p interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']