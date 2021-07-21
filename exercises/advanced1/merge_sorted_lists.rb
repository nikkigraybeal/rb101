=begin
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

input: 2 sorted arrays
output: 1 new merged sorted array

rules: don't mutate the arrays
       don't use sort method to sort new array
       if one array is empty return the other array

initialize new array, merged
iterate through arr1 with index |i, idx|
  merged << i
  merged << arr2[idx]
  merged.each index |idx2|
    break if (idx2 + 1).nil?
    merged[idx2], merged[idx2 + 1] == merged[idx2 + 1], merged[idx2] if i2 <=> idx2 == -1
return merged
=end

def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  merged = []
  arr1.each_with_index do |i, idx|
    merged << i 
    merged << arr2[idx]
    merged.each_index do |idx2|
      break if (merged[idx2 + 1]).nil?
      merged[idx2], merged[idx2 + 1] = merged[idx2 + 1], merged[idx2] if merged[idx2] > merged[idx2 + 1]
    end
  end
  merged.compact
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
