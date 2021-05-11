# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

DIGITS = Hash.new {|h,k| h[k] = k}
(0..9).each { |num| DIGITS[num] = num.to_s }

def remove_sign(int)
  int < 0 ? int = int * -1 : int
end


def signed_integer_to_string(integer)
  array = remove_sign(integer).digits.map { |num| DIGITS[num] }
  case 
  when integer < 0
    array.join.reverse!.prepend('-')
  when integer > 0 
    array.join.reverse!.prepend('+')
  else
    array.join.reverse!
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'