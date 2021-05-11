# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

puts "Welcome to madlibs!"
puts "Enter a verb:"
word1 = gets.chomp
puts "Enter an adjective:"
word2 = gets.chomp
puts "Enter a type of animal:"
word3 = gets.chomp
puts "Enter an adverb:"
word4 = gets.chomp

puts "Here is your story:"
puts "Do you #{word1} your #{word2} #{word3} #{word4}? That's hilarious!"

