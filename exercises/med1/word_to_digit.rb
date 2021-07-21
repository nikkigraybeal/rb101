# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

=begin

def word_to_digit(str)
  to_digits = { "zero" => "0", "one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9" }

  to_digits.each_key do |key|
    str.gsub!(/\b#{key}\b/, to_digits[key])
  end
  str
end

=end

=begin
input: string 
output: self with number words replaced with digits

create array zero..nine

split string then iterate 
  if number array includes word, word = index of word in array
  join string on (' ') and return string 
=end

def word_to_digit(string)
  numbers = {"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}
  numbers.keys.each do |key|
    string.gsub!(key, numbers)
  end
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'