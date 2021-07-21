=begin
#Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

#Given a string
#separate the words in the string into an array
#iterate backwards through the arrray
#  iterator = array.length - 1
#  if iterator is >= 0 then push element at space "iterator" in array to a new array
#  subtreact 1 from iterator
#join the words in the new array
#print the new array

def reverse_sentence(str)
  array = str.split
  i = array.length - 1
  new_array = []
  while i >= 0 
    new_array.push(array[i])
    i -= 1
  end
  new_array.join(" ")
end
  

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
#The tests above should print true.
=end


def reverse_sentence(str)
  words = str.split(' ')
  reversed = []
  words.each do |word|
    reversed.unshift(word)
  end
  p reversed.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'