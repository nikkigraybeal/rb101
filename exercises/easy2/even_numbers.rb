# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(1..99).to_a.each do |num|
  if num.even?
    puts num
  end
end

evens = 2
puts "\nagain!"
1.upto(99) do |num|  
  if evens == num
    puts num
    evens +=2
  end
end

puts "one more time!"
even_nums = (1..99).to_a.select {|num| num.even?}
puts even_nums