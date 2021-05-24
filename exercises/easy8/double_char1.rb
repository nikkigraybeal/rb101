# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(str)
  doubled = []
  str.chars.map do |char|
    doubled << char * 2
  end
  doubled.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''