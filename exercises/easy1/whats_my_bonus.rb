=begin
#Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

#Given an positive integer called salary and a boolean#
#if bool is true then bonus is half of salray
#otherwise salray is 0

def calculate_bonus(salary, bool)
  if bool == true 
    bonus = salary / 2
  else
    salary = 0
  end
end
    

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

#The tests above should print true.

=end

def calculate_bonus(int, bool)
  bool == true ? int/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
