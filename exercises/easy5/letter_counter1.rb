# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

=begin
PROBLEM
INPUT : string
OUTPUT : hash

explicit requirements:
-take a string and count the number of chracters in each word
-create a hash with keys of each size of word and value of how many words are that size

implicit requirements:
-input will be a string of words
-non alpha-numberic characters count
-empty string will return an empty hash

EXAMPLES
DATA STRUCTURES
-array from string input
-hash 

ALGORITHM

1. turn string into an array split on white space
2. set counter to 0, create empty hash
3. loop over array
    -return new collection of word sizes
4. loop over word size array
    -add 1st element to hash with value 1
    -check if element is equal to rest of array elements adding 1 to value in hash for every match
    -remove elements with value of 1st element
    -repeat for new first element
5. return hash

=end 

def word_sizes(string)
  words = string.split(' ')
  size_hash = {}

  sizes = words.map do |word|
    word.size
  end
  
  sizes.each do |size|
    if size_hash[size]
      size_hash[size] += 1
    else size_hash[size] = 1
    end
  end
  size_hash
end

p word_sizes('Four score and seven.') == {3 =>1, 4=>1, 5=>1, 6=>1}
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}