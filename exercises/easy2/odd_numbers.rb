# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

(1..99).to_a.each do |num|
  if num.odd?
    puts num
  end
end

odds = 1
puts "\nagain!"
1.upto(99) do |num|  
  if odds == num
    puts num
    odds +=2
  end
end

puts "one more time!"
odd_nums = (1..99).to_a.select {|num| num.odd?}
puts odd_nums