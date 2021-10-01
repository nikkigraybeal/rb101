=begin
problem: select an element from an array if it's a fibonacci number.

input: array of integers
output: an array containing all values that are fibonacci numbers 

rules: fibonacci sequence starts with 1, 1. the next number in the sequence is the sum of the previous 2 numbers. (1, 1, 2, 3, 5, 8, 13...)

examples: [1,24,66,8,234,13] => [1, 8, 13]

data structure: array for dynamically generated fibonacci sequence

algorithm:

find the max value in the input array

generate fib sequence up to the max value

iterate over input array and select elements that are included in the fib sequence array



find the max value in the input array
  biggest = array.max

generate fib sequence up to the max value
  initialize a new array, fib_sequence [1, 1]
  n1 = 1
  n2 = 1
  loop while the max value in fib_sequence is less than or equal to biggest
    add n1 and n2 and push the sum into fib_sequence
    reassign n1 to the value of n2
    reassign n2 to the value of the last element of fib_sequence
   
  
iterate over input array and select elements that are included in the fib sequence array

Let's make sure that works...



def fib_nums(array)
  biggest = array.max

  fib_sequence = [1, 1]
  n1 = 1
  n2 = 1

  while fib_sequence.max <= biggest do
    fib_sequence << n1 + n2
    n1 = n2
    n2 = fib_sequence[-1]
  end
  fib_sequence
end

p fib_nums([1,24,66,8,234,13])  # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]


awesome- it's working!

now for the last part of my solution:

iterate over input array and select elements that are included in the fib sequence array
  I think this is pretty strightforward. I'm just going to code it.



def fib_nums(array)
  biggest = array.max

  fib_sequence = [1, 1]
  n1 = 1
  n2 = 1

  while fib_sequence.max <= biggest do
    fib_sequence << n1 + n2
    n1 = n2
    n2 = fib_sequence[-1]
  end
  array.select! do |num|
    fib_sequence.include?(num)
  end
end

p fib_nums([1,24,66,8,234,13]) == [1, 8, 13]

=end


=begin
given an array of strings consisting of all lower case letters, return an array of all letters common to all of the strings including duplicates.

input - an array of strings of lowercase letters
output - an array of letters common to all strings including dups

rules: return an empty array if no common letters are found

examples: ['bella', 'label', 'roller'] => ['e', 'l', 'l']
          ['cool', 'lock', 'cook']  => ['c', 'o']
          ['hello', 'goodbye', 'booya', 'random'] => ['o']
          ['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrr', 'yyyzzz'] => []

data structure: counts array, letters array

algorithm: 
  
  turn the first string into an array first_word  ==> I don't really need this
  initialize a counts array
  initialize a letters array
  iterate over the first word in array |letter|
    iterate over the array |word|
      count letter in word
      push number to counts array
    push letter to letters array multiplied by the smallest number in counts array
    remove all elements from counts array

  return letters array

def common_chars(array)
  counts = []
  letters = []
  array[0].each_char do |letter|
    array.each do |word|
      counts << word.count(letter)
    end
    letters << letter * counts.min
    counts.clear
  end
  letters
end

false
false
false
false

["", "e", "ll", "ll", ""]
false
["c", "o", "o", ""]
false
["", "", "", "", "o"]
false
["", "", "", "", "", "", "", ""]
false

turn the first string into an array first_word  ==> I don't really need this
  initialize a counts array
  initialize a letters array
  iterate over the first word in array |letter|
    iterate over the array |word|
      count letter in word
      push number to counts array
    check if letter is in letter array
    if it is skip to next iteration otherwise
    take the smallest number in counts array and push letter into letter array that many times
    remove all elements from counts array

  return letters array



def common_chars(array)
  counts = []
  letters = []
  array[0].each_char do |letter|
    array.each do |word|
      counts << word.count(letter)
    end
    next if letters.include?(letter)
    counts.min.times{|num| letters << letter }
    counts.clear
  end
  p letters
end

=begin
false
false
true
true

["e", "l", "l", "l", "l"]
false
["c", "o", "o"]
false
["o"]
true
[]
true



p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook'])  == ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrr', 'yyyzzz']) == []
=end



=begin
Problem: Given a string return true if the string can be reconstructed using a substring it contains.

input: string
output: boolean 

examples: 'abab' => true   
          'aba' => false 
          'aabaaba' => false
          'abaababaab' => true
          'abcabcabcabc' => true          
          'abab' => true
          'aba' => false
          'aabaaba' => false
          'abaababaab' => true
          'abcabcabcabc' => true
          'ababad' => false

rules: strings with odd size will return false

data structures: none needed

algorithm:

if sitring size is odd return false

iterate over string with index
  iterate over string again with index


#I see another rule. We don't need a double nested loop, because we only need substrings that begin with the first character of the string.

rules: strings with odd size will return false
       we only need substrings beginning with first character

algorithm:

if siring size is odd return false

iterate over string with index
  create a substring from the 1st char through index
  add substring to itself until it is the same size or greater than the string
  compare string and substring
     if they are eqivalent, return true otherwise, return false

ok, that's the bare bones. I'm just going to look it over and see if I think I can implement it without having to think about more than syntax.

algorithm:

if siring size is odd return false => return false if string size is odd

iterate over string with index  => ah, I need to turn string into an array first.
  create a substring from the 1st char through index
  add substring to itself until it is the same size or greater than the string
  compare string and substring
     if they are eqivalent, return true otherwise, return false

algorithm:

if siring size is odd return false => return false if string size is odd

turn string into an array, chars => I like to come up with variable names during this phase, not during the coding phase
iterate over chars with index 
  create a substring from the 1st char through index => this is pretty straight forward. I know I can use a range from 0 to index with slice.
  add substring to itself until it is the same size or greater than the string => this could use a little fleshing out
    loop until substring size is greater than or equal to string
      add substring to itself
  compare string and substring =>looks like a simple ternary operator can work here
     if they are eqivalent, return true otherwise, return false

time to code! If I've really taken the time to think through the problem, coding should feel like I'm just copying my algorithm word for word, but translating it into code. I like to word my algorithm so it reads like code, which is pretty easy to do in Ruby.


Def repeated_substring_pattern(string)
  return false if string.size.odd?

  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index]
    until substring.size >= string.size #=> hmmm, substring is an array here. I don't think that matters for this line of code, but it will when I need to compare them. Back to the algorithm!
end  

algorithm:

if siring size is odd return false => return false if string size is odd

turn string into an array, chars 
iterate over chars with index 

  create a substring from the 1st char through index and turn it into a string => this seems like the most logical place to change it to a string.

  add substring to itself until it is the same size or greater than the string => this could use a little fleshing out
    loop until substring size is greater than or equal to string
      add substring to itself
  compare string and substring =>looks like a simple ternary operator can work here


Def repeated_substring_pattern(string)
  return false if string.size.odd?

  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index].to_s
    until substring.size >= string.size 
      substring += substring
    end
    substring == string ? true : false # darn. This is going to return a boolean for every substring iteration so the method will always return the result of the last iteration. I think I know how to fix this. Back to the algorithm.
  end
end  

algorithm:
initialize a new variable, result with the value false  => I think there is a name for this trick?

if siring size is odd return false => return false if string size is odd

turn string into an array, chars 
iterate over chars with index 

  create a substring from the 1st char through index and turn it into a string 

  add substring to itself until it is the same size or greater than the string => this could use a little fleshing out
    loop until substring size is greater than or equal to string
      add substring to itself

  if string and substring are equivalent, change the value of result to true.
return result



def repeated_substring_pattern(string)
  return false if string.size.odd?
  result = false
  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index].to_s
    until substring.size >= string.size do # forgot 'do'
      substring += substring
    end
    result = true if string == substring
  end
  result
end  

false
true
true
false
false

so here's another pitfall- waiting to code until you have everything worked out can be dangerous too. Get one step figured out, then make sure it works before you spend a bunch of time working the rest out.

Lets back waaaay up.

algorithm:

return false if string size is odd

turn string into an array, chars
iterate over chars with index 
  create a substring from the 1st char through index => this is pretty straight forward. I know I can use a range from 0 to index with slice.
  add substring to itself until it is the same size or greater than the string => this could use a little fleshing out
    loop until substring size is greater than or equal to string
      add substring to itself
  compare string and substring =>looks like a simple ternary operator can work here
     if they are eqivalent, return true otherwise, return false

time to code...the first bit and then check to make sure it's working the way it should!



def repeated_substring_pattern(string)
  return false if string.size.odd?

  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index]
    p substring
  end    
end  

p repeated_substring_pattern('abab') == true
#output:
["a"]
["a", "b"]
["a", "b", "a"]
["a", "b", "a", "b"]
false

this seems to be working...but I need substring as a string, not an array.

algorithm:

return false if string size is odd

turn string into an array, chars
iterate over chars with index 
  create a substring from the 1st char through index and turn it into a string => this seems like the most logical place to change it to a string. 
  add substring to itself until it is the same size or greater than the string
    loop until substring size is greater than or equal to string
      add substring to itself
  compare string and substring =>looks like a simple ternary operator can work here
     if they are eqivalent, return true otherwise, return false


def repeated_substring_pattern(string)
  return false if string.size.odd?

  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index].to_s
    p substring
  end    
end  

p repeated_substring_pattern('abab') == true

output:
"[\"a\"]"
"[\"a\", \"b\"]"
"[\"a\", \"b\", \"a\"]"
"[\"a\", \"b\", \"a\", \"b\"]"
false

Well, that's not going to work. And I'm not sure why I thought it would- I'm chalking it up to middle age and a need for more coffee. I need to use join instead.

algorithm:

return false if string size is odd

turn string into an array, chars
iterate over chars with index 

  create a substring from the 1st char through index and turn it into a string with join 

  add substring to itself until it is the same size or greater than the string
    loop until substring size is greater than or equal to string
      add substring to itself
  compare string and substring =>looks like a simple ternary operator can work here
     if they are eqivalent, return true otherwise, return false


def repeated_substring_pattern(string)
  return false if string.size.odd?

  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index].join
    p substring
  end    
end  

p repeated_substring_pattern('abab') == true

output:
"a"
"ab"
"aba"
"abab"
false

Ah...much better. Ok! Now I'm ready to move on to the next bit.


algorithm:

return false if string size is odd

turn string into an array, chars
iterate over chars with index 
  create a substring from the 1st char through index and turn it into a string with join 

  add substring to itself until it is the same size or greater than the string => this could use a little fleshing out
    loop until substring size is greater than or equal to string
      add substring to itself
  compare string and substring =>looks like a simple ternary operator can work here


def repeated_substring_pattern(string)
  return false if string.size.odd?

  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index].join
    until substring.size >= string.size do 
      substring += substring
    end
    p substring
  end    
end  

p repeated_substring_pattern('abab') == true
output:
"aaaa"
"abab"
"abaaba"
"abab"
false

Awesome- this also seems to be working as it should. Time to add the boolean return value.

algorithm:
return false if string size is odd

initialize a new variable, result with value false

turn string into an array, chars
iterate over chars with index 
  create a substring from the 1st char through index and turn it into a string with join 

  add substring to itself until it is the same size or greater than the string => this could use a little fleshing out
    loop until substring size is greater than or equal to string
      add substring to itself
  set the value of result to true if string and substring are equivalent

return result

=end

def repeated_substring_pattern(string)
  return false if string.size.odd?
  result = false
  chars = string.chars
  chars.each_index do |index|
    substring = chars[0..index].join
    until substring.size >= string.size do 
      substring += substring
    end
    result = true if substring == string
  end 
  result   
end  

p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aba') == false
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true
p repeated_substring_pattern('abcabcabcabc') == true
       

