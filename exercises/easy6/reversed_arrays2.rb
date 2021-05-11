# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

def reverse(arr)
  new_arr = []
  index = -1
  loop do 
    break if new_arr.size == arr.size
    new_arr.push(arr[index])
    index -= 1
  end
  new_arr
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

 def reverse2(arr)
  arr.inject([]) { |memo, ele| memo.unshift(ele) }
 end

 p reverse2([1,2,3,4]) == [4,3,2,1]          # => true
p reverse2(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse2(['abc']) == ['abc']              # => true
p reverse2([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse2(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

 def reverse3(arr)
  arr.each_with_object([]) { |ele, new_arr| new_arr.unshift(ele) }
 end

p reverse3([1,2,3,4]) == [4,3,2,1]          # => true
p reverse3(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse3(['abc']) == ['abc']              # => true
p reverse3([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse3(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true