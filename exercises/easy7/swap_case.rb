# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.
UP = ('A'..'Z').to_a
DOWN = ('a'..'z').to_a

def swapcase(str)
  swapped_arr = str.chars.map do |char|
    if char == ' ' || char =~ /[^a-zA-Z]/
      char = char
    elsif UP.include?(char)
      char.downcase
    elsif DOWN.include?(char)
      char.upcase 
    end
  end
  p swapped_arr.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'