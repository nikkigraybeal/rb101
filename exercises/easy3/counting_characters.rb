# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

puts "=>Enter one or multiple words:"

words = gets.chomp
arr = words.split

char_count = 0

arr.each do |word|
  char_count += word.length
end

puts "There are #{char_count} characters in '#{words}'."
