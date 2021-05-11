# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

def regex_cleanup(string)
  p string.gsub(/[^a-zA-Z]/, ' ').gsub(/\s+/, ' ')
end

def cleanup(string)
  alphabet = ('a'..'z').to_a
  clean_arr = []

  string.each_char do |char|
    alphabet.include?(char) ? clean_arr << char : clean_arr << ' '
  end
  
  clean_arr.join.gsub(/\s+/, ' ')
end



p cleanup("---what's my +*& line?") == ' what s my line '

