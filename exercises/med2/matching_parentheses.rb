# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. # To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# def include_parentheses?(string)
#   string.include?('(') || string.include?(')')
# end
# 
# def balanced?(string)
#   if include_parentheses?(string)
#     open = string.index('(')
#     close = string.rindex(')')
#     if open.nil? || close.nil?
#       false
#     elsif open > close
#     else
#     string = string.slice(open + 1..close - 1)
#     balanced?(string)
#     end
#   else true
#   end
# end

def remove_pairs(string)
  return true if string.size == 0
  open_index = string.index('()')
  return false if open_index.nil?
  string.slice!(open_index, 2)
  string
  balanced?(string)
end

def balanced?(string)
  stripped = string.split(/[^()]/).join
  remove_pairs(stripped)
end


p balanced?('What (is) this?') #== true
p balanced?('What is) this?') #== false
p balanced?('What (is this?') #== false
p balanced?('((What) (is this))?') #== true
p balanced?('((What)) (is this))?') #== false
p balanced?('Hey!') #== true
p balanced?(')Hey!(') #== false
p balanced?('What ((is))) up(') #== false

# Note that balanced pairs must each start with a (, not a ).