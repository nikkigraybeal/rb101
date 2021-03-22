#Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

#Given a valid integer#
#   -if integer % 2 is 0 then return false
#   -otherwise return true

def is_odd?(int) 
  if int % 2 == 0
    return false
  else return true
  end
end






#Keep in mind that you're not allowed to use #odd? or #even? in your solution.


#it worked but I didn't realize % 2 would = 1 for odd numbers...duh. And I don't understand the diff between modulo and remainder:/ Here goes...

#Further Exploration
#This solution relies on the fact that % is the modulo operator in Ruby, not a remainder operator as in some other languages. Remainder operators return negative results if the number on the left is negative, while modulo always returns a non-negative result if the number on the right is positive.

#modulo	remainder
#5 mod 2 == 1	5 rem 2 == 1
#-5 mod 2 == 1	-5 rem 2 == -1
#5 mod -2 == -1	5 rem -2 == 1
#-5 mod -2 == -1	-5 rem -2 == -1

#If you weren't certain whether % were the modulo or remainder operator, how would you rewrite #is_odd? so it worked regardless?

def is_odd2?(int) 
  if int < 0
    int = int * -1
  end
  int % 2 == 1
end

#The Integer#remainder method performs a remainder operation in Ruby. Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.

def is_odd3?(int)
  if int.remainder(2) == 0
    return false
  else
    return true
  end
end

#Well, it works, but I don't understand at all. The documentation shows this: x.remainder(y) means x-y*(x/y).truncate. I don't get 0s or 1s when I use that formula. Will leave for later...


puts is_odd3?(2)    # => false 0
puts is_odd3?(5)    # => true 1
puts is_odd3?(-17)  # => true -1
puts is_odd3?(-8)   # => false 0
puts is_odd3?(0)    # => false 0
puts is_odd3?(7)    # => true 1

