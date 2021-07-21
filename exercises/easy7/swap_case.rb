# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

=begin
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
=end


=begin
input: string
output: new string with case swapped

lowers = (a..z).to_a
uppers - (A..Z).to_a
swapped = ''

iterate over string |char|
  if lowers or uppers includes char then swapcase and push to swapped
    otherwise push to swapped
=end

def swapcase(string)
  lowers = ("a".."z").to_a
  uppers = ("A".."Z").to_a
  swapped = ''
  string.each_char do |char|
    lowers.include?(char) || uppers.include?(char) ? swapped << char.swapcase : swapped << char
  end
  swapped
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
