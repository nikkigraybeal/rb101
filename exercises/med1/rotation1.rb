# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
  new_arr = arr.clone
  first = new_arr.shift
  new_arr.push(first)
  new_arr
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

def rotate_string(str)
  rotate_array(str.chars).join
end

p rotate_string("catnap") == "atnapc"
p rotate_string("pleasesweetbabyjesusletthiswork") == "leasesweetbabyjesusletthisworkp"


def rotate_integers(int)
  rotate_array(int.to_s.chars).join.to_i
end

p rotate_integers(3746) == 7463
p rotate_integers(53) == 35