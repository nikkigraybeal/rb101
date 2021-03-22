puts "Welcome to calculator"
puts "Enter a number"
number1 = gets.chomp
puts "Enter another number"
number2 = gets.chomp
puts "Enter an operator: 1)add, 2)subtract, 3)multiply, 4)divide"
operator = gets.chomp

if operator == '1'
  puts "the result is: #{number1.to_i + number2.to_i}"
elsif operator == '2'
  puts "the result is: #{number1.to_i - number2.to_i}"
elsif operator == '3'
  puts "the result is: #{number1.to_i * number2.to_i}"
else
  puts "the result is: #{number1.to_f / number2.to_f}"
end
