# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.


=begin
def uppercase?(str)
  str.upcase == str
end
=end

=begin
input: string
output: bool, true if all chars are uppers

if string.upcase == string return true
=end

def uppercase? (string)
  string.upcase == string ? true : false
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true