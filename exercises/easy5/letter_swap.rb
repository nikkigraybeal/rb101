# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

def swap(string)
  words = string.split()
  swapped = []
  for word in words
    first = word[0]
    last = word[-1]
    word = word.chars.slice(1..-1).prepend(last).slice(0..-2).append(first).join()
    swapped << word
  end
  swapped.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'