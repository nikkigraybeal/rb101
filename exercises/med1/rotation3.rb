# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(int)
  index = int.to_s.size
  loop do
    int = rotate_rightmost_digits(int, index)
    index -= 1
    break if index == 0
  end
  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

def max_ro_no_helpers(int)
  digits = int.to_s.chars
  rotate = 0
  move = -1 
  digits.each do |digit|
    rotate += 1
    move += 1
    if move > 0
      digits = digits[0..move -1] + digits[rotate..-1] + [digits[move]]
    else digits = digits[rotate..-1] + [digits[move]] unless move < 0
    end
  end
  digits.join.to_i
end

p max_ro_no_helpers(735291) == 321579
p max_ro_no_helpers(3) == 3
p max_ro_no_helpers(35) == 53
p max_ro_no_helpers(105) == 15 # the leading zero gets dropped
p max_ro_no_helpers(8_703_529_146) == 7_321_609_845