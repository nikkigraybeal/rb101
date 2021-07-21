# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters # that were neither of those two. Now we want to go one step further.
# 
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string # that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.
# 
# You may assume that the string will always contain at least one character.

=begin
def percent(whole, part)
  ((part.to_f / whole.to_f) * 100).round(1)
end

def letter_percentages(string)
  neither = string.split(/[A-Za-z]/).delete_if {|i| i.empty?}.join.size
  uppers = string.split(/[^A-Z]/).delete_if {|i| i.empty?}.join.size
  lowers = string.split(/[^a-z]/).delete_if {|i| i.empty?}.join.size
  total = string.size
  percentages = { lowercase: percent(total, lowers), uppercase: percent(total, uppers), neither: percent(total, neither) }
end

=end

=begin
input: string
output: hash key = lowers, uppers, others. vals = % of characters in ddd.d format
rules: string will always include at least one char
      spaces count as char

initialize a new hash: counts
change string to char array
iterate through chars
count lowers, push to counts hash. val = count#/array.size
count uppers push to hash
count others push to hash
return hash
=end

def letter_percentages(string)
  counts = {}
  string.count("a-z") != 0 ? counts[:lowercase] = (string.count("a-z").to_f/string.size.to_f).round(1) * 100 : counts[:lowercase] = 0.to_f.round(1)
  string.count("A-Z") != 0 ? counts[:uppercase] = (string.count("A-Z").to_f/string.size.to_f).round(1) * 100 : counts[:uppercase] = 0.to_f.round(1)
  string.count("^a-zA-Z") != 0 ? counts[:neither] = (string.count("^a-zA-Z").to_f/string.size.to_f).round(1) * 100 : counts[:neither] = 0.to_f.round(1)
  p counts
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }