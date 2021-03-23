#Write a method that takes one argument, a positive integer, and returns the sum of its digits.

#Given a positive integer#
#convert the integer to a string
#split the string
#iterate over the string array
  #convert item to an integer
  #add item to running_total
#return running_total

def sum(int)
  running_total = 0
  int.to_s.split("").each do |num|
    running_total += num.to_i
  end
  running_total
end



puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
#The tests above should print true.

#For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

#UGH - my solution is painful. will come back to this later!


def sum2(int)
  num_strings = int.to_s.split("")
  total = 0
  size = num_strings.size
  total += num_strings[size - 1].to_i
  if size - 1 == 0
    return total
  else
    total += num_strings[size - 2].to_i
  end
  if size - 2 == 0
    return total
  else total += num_strings[size -3].to_i
  end
  if size - 3 == 0
    return total
  else total += num_strings[size -4].to_i
  end
  if size - 4 == 0
    return total
  else total += num_strings[size -5].to_i
  end
  if size - 5 == 0
    return total
  else total += num_strings[size -6].to_i
  end
  if size - 6 == 0
    return total
  else total += num_strings[size -7].to_i
  end
  if size - 7 == 0
    return total
  else total += num_strings[size -8].to_i
  end
  if size - 8 == 0
    return total
  else total += num_strings[size -9].to_i
  end
  if size - 9 == 0
    return total
  else total += num_strings[size -10].to_i
  end
end


p sum2(3478)
p sum2(587345)
p sum2(1)
p sum2(98734523123)



