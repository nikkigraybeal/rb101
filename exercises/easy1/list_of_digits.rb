=begin
#Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

#Given a positive integer called num
#convert num to a string
#set digits = []
#set iterator = 0
#while iterator <= length of num
#  convert the value in num at the space "iterator" to an integer 
#  push the value to digits


def digit_list(num)
  num = num.to_s
  digits = []
  i = 0
  while i < num.length
    digits.push(num[i].to_i)
    i += 1
  end
  digits 
end

    


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
=end

def digit_list(num)
  num.to_s.chars.map {|digit| digit.to_i}
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true