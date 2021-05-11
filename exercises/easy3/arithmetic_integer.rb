# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

def prompt(message)
  puts "=>#{message}"
end

def add(a, b)
  prompt("#{a} + #{b} = #{a + b}")
end

def subtract(a, b)
  prompt("#{a} - #{b} = #{a - b}")
end

def multiply(a, b)
  prompt("#{a} * #{b} = #{a * b}")
end

def divide(a, b)
  prompt("#{a} / #{b} = #{a / b}")
end

def remainder(a, b)
  prompt("#{a} % #{b} = #{a % b}")
end

def exponential(a, b)
  prompt("#{a} ** #{b} = #{a ** b}")
end

def all_the_math
  prompt("Enter the first number:")
  a = gets.chomp.to_i
  b = ''
  loop do 
    prompt("Enter the second number:")
    b = gets.chomp.to_i
    b == 0 ? (puts "enter a number that isn't 0.") : break
  end

  add(a, b)
  subtract(a, b)
  multiply(a, b)
  divide(a, b)
  remainder(a, b)
  exponential(a, b)
end

all_the_math