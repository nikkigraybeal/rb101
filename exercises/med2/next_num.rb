# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, # for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 # appears twice).
# 
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

# def featured(int)
#   loop do
#     if int >= 9_999_999_999
#       p "There are no more featured numbers."
#       break
#     end
#     next_num = int.succ
#     no_dups = next_num.to_s.chars.uniq.join.to_i
#     if next_num.odd? && next_num % 7 == 0 && no_dups == next_num
#       return next_num
#       break
#     end
#     int = next_num
#   end
# end

def featured(int)
  next_num = 0
  loop do
    next_num = int.succ
    break if next_num.odd? && next_num % 7 == 0
    int = next_num
  end
  loop do
    break if next_num >= 9_876_543_210
    if next_num.to_s.chars.uniq == next_num.to_s.chars
      return next_num
    else next_num += 14
    end
  end
  "There is no possible number that fulfills those requirements."
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements