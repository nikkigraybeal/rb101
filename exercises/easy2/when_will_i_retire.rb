# Build a program that displays when the user will retire and how many years she has to work till retirement.

def prompt(message)
  puts "=> #{message}"
end

prompt('What is your age?')
age = gets.chomp.to_i
prompt('At what age would you like to retire?')
retirement_age = gets.chomp.to_i

t = Time.now  
current_year = t.year   
retirement_year = current_year + (retirement_age - age)
prompt("It's #{current_year}. You will retire in #{retirement_year}.")
prompt("You only have #{retirement_age - age} years of work to go!")     
