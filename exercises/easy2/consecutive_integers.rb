=begin
# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

loop do 
  puts "Please enter an iteger greater than 0:"
  int = gets.chomp.to_i
  puts "Enter 's' to compute the sum, 'p' to compute the product"
  operator = gets.chomp.downcase
  if operator == 's'
    calculation = (1..int).reduce(:+)
    puts "The sum of the integers between 1 and #{int} is #{calculation}"
    break
  elsif operator == 'p'
    calculation = (1..int).reduce(:*)
    puts "The product of the itegers between 1 and #{int} is #{calculation}"
    break
  else
    puts "Enter 's' to add, 'p' to multiply."
  end
end

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

=end


puts "Enter an integer greater than 0:"
answer = gets.chomp.to_i
puts "enter a for add or m for multiply"
operator = gets.chomp
accumulator = 0
if operator == 'a'
  1.upto(answer) {|num| accumulator += num}
elsif operator == 'm'
  accumulator = 1
  1.upto(answer) {|num| accumulator *= num}
else puts "invalid entry"
end
p accumulator