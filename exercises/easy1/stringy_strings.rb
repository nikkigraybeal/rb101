#Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

#Given a positive integer called num#
#set an empty array called arr
#if num is even divide it in half and push "10" n times to arr
#if num is odd 
  #subtract 1 and call it evenized
  #divide evenized in half and push "10" evenized times to arr
  #push "1" to arr
#join arr

def stringy(num) 
  arr = []
  if num.even?
    half = num / 2
    half.times do 
      arr.push("10")
    end
  elsif num.odd?
    evenized = num - 1
    half2 = evenized / 2
    half2.times do 
      arr.push("10")
    end
    arr.push("1")
  end
  arr.join
end

    
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
#The tests above should print true.

#Further Exploration
#Modify stringy so it takes an additional optional argument that defaults to 1. If the method is called with this argument set to 0, the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy2(size, start = 1)
  numbers = []
  if start == 0
    size.times do |index|
      number = index.even? ? 0 : 1
      numbers << number
    end
  else
    size.times do |index|
      number = index.even? ? 1 : 0
      numbers << number
    end
  end
  numbers.join
end

puts stringy2(6) == '101010'
puts stringy2(6, 0) == '010101'
puts stringy2(9) == '101010101'
puts stringy2(9, 0) == '010101010'