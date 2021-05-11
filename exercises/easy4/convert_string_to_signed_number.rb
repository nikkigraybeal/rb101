# In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.


=begin
first attempt
def remove_sign(str)
  if str.start_with?('+') || str.start_with?('-')
    str = str.reverse!.chop!.reverse!
  end
end

def replace_sign(str, num)
  if str.start_with?('-')
    num * - 1
  else
    num
  end
end


def array_to_int(array)
  num_as_int = 0
  i = 0
  while i < array.length do
    power_of = array.length - 1
    place_val = 10 ** power_of
    first_digit = array.shift
    num_as_int += place_val * first_digit
  end
  num_as_int
end

def string_to_signed_integer(str_num)
  digits = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
  str_num2 = str_num.reverse.reverse
  remove_sign(str_num2)
  digit_arr = str_num2.split('')
  digit_arr.map! do |num|
    num = digits[num]
  end
  int = array_to_int(digit_arr)
  replace_sign(str_num, int)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
=end

# second attemp after studying the solution
# use CONSTANTS for values that don't change!
DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  
  value = 0
  digits.each { |num| value = 10 * value + num }
  value
end

def string_to_signed_integer(string)
  case string[0]
  when '+'
    string_to_integer(string[1..-1])
  when '-'
    -string_to_integer(string[1..-1])
  else string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100