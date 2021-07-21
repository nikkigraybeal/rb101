# determine if the string can be reconstructed using a substring it contains. 
# 
# if string.size.odd? return false
# loop until all possible substrings have been tried. 
# return false if length > string.size/2
# index 0, length 1 through (string.size / 2) 
# append the substring to itself until it is >= the length of the original string. 
# if string matches substring, return true
# otherwise, repeat the loop with length incremented by 1

  
=begin 
def repeated_substring_pattern(string)
  length = 0
  substring = nil
  loop do 
    length += 1
    break if length > string.size/2
    substring = string[0, length]
    loop do
      substring += substring
      substring.size < string.size ? next : break
    end
    substring == string ? break : next
  end
  substring == string ? true : false
end


p repeated_substring_pattern('abab') == true
p repeated_substring_pattern('aba') == false
p repeated_substring_pattern('aabaaba') == false
p repeated_substring_pattern('abaababaab') == true
p repeated_substring_pattern('abcabcabcabc') == true

=end

# input - an array of strings of lowercase letters
# output - and array of letters common to all strings including dups
# 
# option 1
# initialize a hash with all the letters from 1st string as keys, values set to 1
# iterate over each string
#   check if 1st hash key is in string 2
#   if it is add 1 to that letter in the hash and remove the letter from string 2
#   repeat for the rest of the strings
#   repeat for the rest of the keys in the hash
# select hash values == 3 to an array

# option 2
# iterate over the first word in the array
# if the second and third words contain the letter, push the letter to a new array
#   and delete the letter from the word
#   return the array


# def common_chars(array)
#   common_letters = []
#   array[0].each_char do |letter|
#     tally = 1
#     array.each do |word|
#       next if word == array[0]
#       if word.include?(letter)
#         tally += 1
#         word.slice!(word.index(letter), 1)
#       end
#       common_letters.push(letter) if tally == 3
#     end
#   end
#   common_letters
# end
# 
# p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# p common_chars(['cool', 'lock', 'cook'])  == ['c', 'o']
# p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
# p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrr', 'yyyzzz']) == []

=begin
input - positive integer
output - next biggest integer that contains the same digits
rule- return -1 if there is no bigger number
save integer as string
iterate backwards using reverse each
  if element is larger than the element before it, swap places and return
  else return -1
change string back into integer
=end

=begin
def next_bigger_num(int)
  int_arr = int.to_s.chars
  last_index = int_arr.size - 1
  int_arr.reverse_each do |digit|
    digit_before = int_arr[last_index - 1]
    if digit.to_i > digit_before.to_i && (last_index - 1) >= 0
    int_arr[last_index], int_arr[(last_index -1)] = int_arr[(last_index -1)], int_arr[last_index]
    else
      last_index -= 1
    end
  end
  bigger_int = int_arr.join.to_i
  bigger_int == int ? -1 : bigger_int
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
=end

=begin

input: array of integers
output: integer representing the max sum
rules 
  
  return 0 if all negative or empty array
  return sum of all integers if all positive (reduce)
initialize new array
iterate through the array with index (num, index)
  initialize accumulator to num
  push accumulator to new array
  iterate through the array with an accumulator (num2)
    if index of num2 is less than or equal to index of num, next
    accumulator += num2
    push accumulator to new array
  return largest value from new array (max)

=end

=begin

def max_sequence(array)
  return 0 if array.empty? || array.all? { |num| num < 0 } 
  return array.reduce(:+) if array.all? { |num| num >= 0 }

  new_array = []
  array.each_with_index do |num, index|
    accumulator = num
    new_array.push(accumulator)
    array.each_with_index do |num2, index2|
      next if index2 <= index
      accumulator += num2
      new_array.push(accumulator)
    end
  end
  new_array.max
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
=end

=begin
input: array of strings
output: string representing the longest common common_prefix

rule: return an empty string if there is no common prefix
iterate through the array
  push the first letter of each string to a new array
  if all the elements in that array are equal, push that letter to a new array
    repeat for letters at next index until it returns nil?
  return joined array

=end


=begin
def common_prefix(array)
  prefix = []
  max_iterations = array.min.size
  0.upto(max_iterations - 1) do |index|
    letters = []
    array.each do |word|
      letters.push(word[index])
      letters
    end
    letters.uniq!
    letters
    if letters.size == 1
      prefix.push(letters[0])
    end
  end
  prefix.join
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

=end

=begin
input: 2 strings
output: true/false

true if there is a substring that appears in both strings
rules:
  -substrings are at least 2 characters long
  -case insensitive
  -1 character or empty strings return false

  match = false
  downcase both strings
iterate over 1st string (char1, index)
  push char..index + 1 to substring array
iterate over 2nd string and do the same
iterate over substring array (sub1)
  iterate over substring array (sub2)
    if sub1 == sub2 
      match = true
return match
      
=end

=begin

def substring_test(str1, str2)
  arr1 = str1.downcase.chars
  arr2 = str2.downcase.chars
  substrings1 = []
  substrings2 = []
  match = false
  arr1.each_index do |index|
    if index <= (arr1.size - 2)
      substrings1.push(arr1[index, 2].join)
    end
  end
  arr2.each_index do |index|
    if index <= arr2.size - 2
      substrings2.push(arr2[index, 2].join)
    end
  end
  substrings1.each do |sub1|
    substrings2.each do |sub2|
      match = true if sub1 == sub2
    end
  end
  match
end


p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'llt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

=end

=begin

input: 2 strings
output: true/false

method returns true if str1 contains all of the letters from str2

rules: all lowercase
       duplicate letters must be accounhted for in str1
       if str2 is larger than str 1 return false


return false if str2 size is greater than str1 size
iterate over str2 (char1)
  iterate over str1 (char2)
    if char1 is equal to char2 delete char2 from str1 (delete!)
      return true
    else return false

def scramble(str1, str2)
  return false if str2.size > str1.size
  matches = []
  str2.each_char do |char1|
    str1.each_char do |char2|
      if char1 == char2
        matches.push(char2)
        str1.slice!(char2)
        break
      end
    end
  end
  matches.size == str2.size ? true : false
end

p scramble("javaass", "jjss") == false
p scramble("rkqodlw", "world") == true
p scramble("cedwaraaossoqqyt", "codewars") == true
p scramble("katas", "steak") == false
p scramble("scriptjava", "javascript") == true
p scramble("scriptingjava", "javascript") == true

=end

=begin
input: string
output: integer representing the longest substring that is also a palindrome

rules:
  - substrings are 1 or more chars in length
  - all lowercase
  - empty strings return 0

initialize array substrings
initialize array length
  iterate through the string with index
    iterate though the string with index
      push substrings to array substrings
  iterate through array substrings
    if reversed substring is the same as substring
      push substring size to array length
  return max length
=end


=begin
def longest_palindrome(str)
  substrings = []
  length = []
  str.chars.each_index do |idx1|
    str.chars.each_index do |idx2|
      substr = str[idx1, idx2 + 1]
      substrings.push(substr)
    end
  end
  substrings.each do |substr|
    if substr == substr.reverse
      length.push(substr.size)
    end
  end
  length.max
end 

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
=end

=begin
input: array of integers
output: index of balance point
rules: 
  -empty arrays equal 0
  -return -1 if no balance point exists
  - subarrays do not include balance point 
split array into 2 subarrays and compare sums

arr = [1,2,3,4,3,2,1]

idx 0
la = array.first(0)
ra = array.last(7)

idx 1
ra = array.first(1)
la = array.last(5) = (array.size - (idx + 1)

idx 2
la = array.first(2)
ra = array.last(4)

3 3 5
4 5 6
5 5 7

idx 6
la = array.first(7)
ra = array.last(0)

initialize result variable to -1
iterate over array with index (idx)
    left_array = array.first(idx)
    right_array = array.last(array.size - idx)
    if the sum of each array are equal 
      result = idx
      break
return result 



def find_even_index(array)
  result = -1
  array.each_index do |idx|
    left_arr = array.first(idx)
    right_arr = array.last(array.size - (idx + 1))
    left_arr = [0] if left_arr.empty?
    right_arr = [0] if right_arr.empty?
    if left_arr.flatten.reduce(:+) == right_arr.flatten.reduce(:+)
      result = idx
    end
  end
  result
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3

=end

=begin
reverse an array without using built in reverse method

input: an array
output: a new array with all elements from array reversed
initialize a new array: reversed[]
iterate from the size of array - 1 down to 0 |index|
  reversed.push(array[index])
return reversed array



def reverse_arr(array)
  reversed = []
  (array.size - 1).downto(0) do |index|
    reversed.push(array[index])
  end
  reversed
end

p reverse_arr([1,2,3,4,5,6])

=end

=begin
select an element from an array if it's a fibonacci number.
input: array of integers
output: an array containing all values that are fib numbers

1, 1, 2, 3, 5, 8, 13..

find max val in array
initialize a new array fib_nums with values [1,1]
fib_nums.push(array[-1] + array[-2]) until array[-1] >= max val




def fib_nums(array)
  max = array.max
  fibs = [1, 1]
  loop do 
    fibs.push(fibs[-1] + fibs[-2])
    break if fibs[-1] >= max
  end
  fibs = fibs.intersection(array)
  fibs.sort
end


p fib_nums([1,24,66,8,234,13])

=end

=begin
write a method to determine if a string is a palindrome without using reverse

input: string
output: boolean

change string to array
reversed = []
iterate over string aray from array.size - 1 down to 0 |index|
push array[index] to reversed 
if string is equal to joined reversed return true otherwise return false
  


def palindrome?(string)
  str_arr = string.chars
  reversed = []
  (str_arr.size - 1).downto(0) do |index|
    reversed.push(str_arr[index])
  end
  str_arr.join == reversed.join ? true : false
end

p palindrome?("tacocat") == true
p palindrome?("evan nave") == true
p palindrome?("not a palindrome") == false

=end

=begin
input: string
output: string without consecutive dups

turn string into str_arr []
initialize squeezed = []
iterate over str_arr using each with index |char, idx|
   push char to squeezed unless char == str_arr[idx + 1]
end
return squeezed.join
  
=end

def remove_dups(string)
  str_arr = string.chars
  squeezed = []
  str_arr.each_with_index do |char, idx|
    squeezed.push(char) unless char == str_arr[idx + 1]
  end
  squeezed.join
end

p remove_dups("little brown foxes hike up the tall hill..")
p remove_dups("uuuuughhhhhhh")
p remove_dups("what     about     spaces???")