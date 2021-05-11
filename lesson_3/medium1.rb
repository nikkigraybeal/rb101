=begin

# Question 1
# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

10.times { |num| puts " " * num + "The Flinstones rock!" }


# Question 3
# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.
=end

def factors(number)
  factors = []
  (1..number).each { |num| number % num == 0 ? factors << num : next }
  factors
end

p factors(20)

# Bonus 1
# What is the purpose of the number % divisor == 0 ?
  #it checks if the divisor is a factor of number

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
# it returns the array