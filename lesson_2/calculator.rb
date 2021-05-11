=begin
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
=end

# Refactored

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.match?(/[0-9+[^a-zA-Z]/)
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

number1 = ''
number2 = ''
operator = ''

prompt("Welcome to calculator! Enter your name:")

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hello, #{name}")

loop do
  loop do
    prompt("Enter a number")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmmm...that doesn't look like a valid number.")
    end
  end

  loop do
    prompt("Enter another number")
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmmm...that doesn't look like a valid number.")
    end
  end
  
  operator_prompt = <<-MSG
  What operation would you like to perform?
     enter 1 for addition
     enter 2 for subtraction
     enter 3 for multiplication
     enter 4 for division
  MSG

  prompt(operator_prompt)

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
            number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("the result is: #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using calculator. Good bye!")