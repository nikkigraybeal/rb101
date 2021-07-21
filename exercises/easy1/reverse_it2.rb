=begin
#Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

#Given a string#
#split the string into individual words
#iterate through the string to find and reverse words that are 5 or more characters long
#print joined words

def reverse_words(str)
  words = str.split
  words.each do |item|
    if item.length >= 5
      item.reverse!
    else next
    end
  end
  words.join(" ")
end



puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

=end

def reverse_words(str)
  reversed = str.split.map do |word|
    word.size >= 5 ? word.reverse : word
  end
  reversed.join(' ')
end

puts reverse_words('Professional')          == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School')         == "hcnuaL loohcS"