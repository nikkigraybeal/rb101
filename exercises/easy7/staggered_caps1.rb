# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

require "pry"
require "byebug"

def staggered_case(str)
  char_arr = []
  str.downcase.chars.each_with_index do |char, index|
    if index.even?
      if char =~ /[^a-zA-Z]/
        char_arr << char
      else 
        char_arr << char.upcase
      end
    else
      char_arr << char
    end
  end
  char_arr.join
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case2(str, start:)
  result = ''
  start == "up" ? needs_upper = true : needs_upper = false
  str.chars.each do |char|
    if needs_upper == true
      result += char.upcase
    else 
      result += char.downcase
    end
    needs_upper = !needs_upper
  end
  result
end

p staggered_case2('I Love Launch School!', start: 'up') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS', start: 'down') == 'aLl_cApS'
p staggered_case2('ignore 77 the 444 numbers', start: 'up') == 'IgNoRe 77 ThE 444 NuMbErS'