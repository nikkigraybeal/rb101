# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

def prompt(message)
  puts "=>#{message}"
end

def get_numbers(empty_arr)
  nominals = ['1st', '2nd', '3rd', '4th', '5th', 'last']
  nominals.each do |nom|
    prompt("Enter the #{nom} number:")
    num = gets.chomp.to_i
    empty_arr.push(num)
  end
  empty_arr
end

def check_last_value(arr)
  last_value = arr.pop
  if arr.include?(last_value)
      puts "The number #{last_value} appears in #{arr}"
  else
      puts "The number #{last_value} does not appear in #{arr}"
  end
end
    
new_arr = []
get_numbers(new_arr)
check_last_value(new_arr)

