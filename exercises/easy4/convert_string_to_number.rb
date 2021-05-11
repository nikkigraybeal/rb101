# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.


def array_to_int(array)
  num_as_int = 0
  i = 0
  while i < array.length do
    power_of = array.length - 1
    place_val = 10 ** power_of
    first_digit = array.shift
    num_as_int += place_val * first_digit
  end
  p num_as_int
end

def string_to_integer(str_num)
  digits = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
  digit_arr = str_num.split('')
  digit_arr.map! do |num|
    num = digits[num]
  end
  array_to_int(digit_arr)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570


