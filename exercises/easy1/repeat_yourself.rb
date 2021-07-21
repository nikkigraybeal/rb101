
=begin
#Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Given a string and a positive integer #

#iterate through program the same number of times as the integer
   #set iterator to 1
   #if iterator <= integer then puts string
   #if iterator > integer stop
   #add 1 to iterator

def repeat(str, num)
  iterator = 1
  while iterator <= num
    puts str
    iterator += 1
  end
end
   

repeat('I did it', 7)


def repeat2(str, num)
  num.times do puts str
  end
end
repeat2('I did it another way', 3)

=end

def repeat(str, int)
  p str * int
end 

repeat('I did it', 7)