# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

def prompt(message)
  puts "=> #{message}"
end

prompt('What is the bill?')
bill = gets.chomp.to_f
prompt('What is the tip percentage?')
tip_rate = gets.chomp.to_f
tip = (tip_rate * 0.01) * bill
total = tip + bill
p output_tip = "The tip is %.2f" % tip
p output_total = "The total is %.2f" % total

