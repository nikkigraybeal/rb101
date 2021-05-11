=begin attempt #1
puts "Welcome to the Mortgage Calculator!"
puts "Enter your name:"
name = gets.chomp
puts "Hello, #{name}! Let's get started..."
puts "Enter your loan amount:"
loan_amount = gets.chomp
puts "Enter the Annual Percentage Rate (APR) for your loan:"
apr = gets.chomp
puts "Enter your loan duration in years:"
duration = gets.chomp

monthly_interest_rate = (apr.to_f * 0.01) / 12
loan_duration = duration.to_f * 12
monthly_payment = loan_amount.to_f *
                  (monthly_interest_rate /
                  (1 - (1 + monthly_interest_rate)**(-loan_duration)))

puts "Your monthy payment amount will be: $#{monthly_payment.round(2)}"
=end

# atempt #2 refactored to include prompt method and validation

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  trailing_zeros = number.split('.')[1]
  case trailing_zeros
  when nil
    number = number
  when '00'
    number = number.split('.')[0]
  when /[0-9]0/
    decimal = trailing_zeros.split('')[0]
    number = number.split('.')[0] + '.' + decimal
  end
  number == number.to_f.to_s || number == number.to_i.to_s
end

prompt("Welcome to the Mortgage Calculator!")
name = ''
loop do
  prompt("Please enter your name:")
  name = gets.chomp
  name.empty? ? prompt("Make sure to enter a valid name.") : break
end

prompt("Hello, #{name}! Let's get started...")

loop do
  loan_amount = ''
  loop do
    prompt("Enter your loan amount:")
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else prompt("Hmm...That wasn't a valid number")
    end
  end

  apr = ''
  loop do
    prompt("Enter the Annual Percentage Rate (APR) for your loan:")
    apr = gets.chomp
    if valid_number?(apr)
      break
    else prompt("Hmm...That wasn't a valid number")
    end
  end

  duration = ''
  loop do
    prompt("Enter your loan duration in years:")
    duration = gets.chomp
    if valid_number?(duration)
      break
    else prompt("Hmm...That wasn't a valid number")
    end
  end

  monthly_interest_rate = (apr.to_f * 0.01) / 12
  loan_duration = duration.to_f * 12
  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration)))

  prompt("Your monthy payment amount will be: $#{monthly_payment.round(2)}")
  prompt("Would you like to calculate again?('y' to try again)")
  answer = gets.chomp
  break unless answer.downcase == 'y'
end

prompt("Thanks for using the Mortgage Calculator!")
prompt("Good bye!")
