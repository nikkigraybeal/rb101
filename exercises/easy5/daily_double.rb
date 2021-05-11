# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

=begin
PROBLEM
INPUT: string
OUTPUT: new string

Explicit requirements:
  -remove all consecutive duplicate characters from string input

Implicit requirements:
  -ignore case sensitivity
  -spaces count as characters
  -empty string returns empty string

DATA STRUCTURES


ALGORITHM
1. change string into an array 
2. iterate through array
   -for each character iterate through the array
     -if character matches, keep going
     -if character doesn't match, return character or character concatenated to previous return val
     
=end

def crunch(string)
  string == '' ? new_str = '' : new_str = string[0]
  string.each_char do |char|
    char == new_str[-1] ? next : new_str = new_str + char
  end
  new_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''