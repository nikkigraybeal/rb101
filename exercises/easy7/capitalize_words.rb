# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

def word_cap(str)
  str.split.each { |word| word.capitalize! }.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


def word_cap2(str)
  capitalized = []
  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a
  letters = Hash[lowercase.zip uppercase]

  words = str.split
  
  words.each do |word|
    chars = word.chars
    chars.map! do |ele|
      if ele == chars[0] && ele =~ /[a-z]/
        ele = letters[chars[0]]
      elsif ele =~ /[A-Z]/
        ele = letters.invert[ele]
      else
        ele
      end
    end
    capitalized << chars.join
  end
  capitalized.join(' ')
end

p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap3(str)
  capitalized = []
  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a
  letters = Hash[lowercase.zip uppercase]

  words = str.split
  
  words.each do |word|
    if word[0] =~ /[a-z]/
      chars = word.chars
      chars[0].gsub!(/[a-z]/, letters)
      word = chars.join
      word
    end
    chars = word.chars
    chars.each do |ele|
      if ele != chars[0] && ele =~ /[A-Z]/
        ele.gsub!(/[A-Z]/, letters.invert)
      end
    end
    word = chars.join
    capitalized << word
  end 
  capitalized.join(' ')
end

p word_cap3('four score and seven') == 'Four Score And Seven'
p word_cap3('the javaScript language') == 'The Javascript Language'
p word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'