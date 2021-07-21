# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:
=begin
def substrings(string)
  result = []
  counter = 0
  loop do 
    break if counter == string.size
    counter.upto(string.size - 1) do |index|
      result << string[counter..index]
    end
    counter += 1
  end
  p result
end
=end

=begin
input: string
output: new array of all possible substrings
rules: list substrings in order and from shortest to longest

substrings = []
iterate over string.size.times |idx|
  iterate over stirng.size.times |idx2|
    substrings << string[idx..idx2]
return substrings

=end

def substrings(string)
  substrs = []
  string.size.times do |idx|
    string.size.times do |idx2|
      substrs << string[idx..idx2]
    end
  end
  substrs.delete('')
  substrs
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]