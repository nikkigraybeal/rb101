# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

require "pry"
require "byebug"

def letter_case_count(str)
  counts = {lowercase: 0, uppercase: 0, neither: 0}
  up_count = 1
  low_count = 1
  neither_count = 1
  chars_arr = str.chars
  chars_arr.each do |char|
   # binding.pry
    if char =~ /[A-Z]/
      counts[:uppercase] = up_count
      up_count += 1
    elsif char =~ /[a-z]/
      counts[:lowercase] = low_count
      low_count += 1
    else
      counts[:neither] = neither_count
      neither_count += 1
    end
  end
  counts
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }