# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

range = (20..200).to_a
age = range.sample

def valid_name?(name)
  if name == ''
    name = 'Teddy'
  else
    name
  end
end

puts 'Enter your name:'
answer = gets.chomp
puts "#{valid_name?(answer)} is #{age} years old!"
