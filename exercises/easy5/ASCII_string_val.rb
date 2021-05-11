# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# Given a string
# break the string into individual characters
#iterate through the characters to find the ascii val of each
#add the value together

def ascii_value(string)
  if string.empty?
    0
  else
    values = string.chars.map { |char| char.ord }
    values.reduce(:+)
  end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0