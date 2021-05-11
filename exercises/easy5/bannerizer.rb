# Write a method that will take a short line of text, and print it within a box.


def print_in_box(string)
  padding = string.size + 2
  
  puts "+" + "-" * padding + "+" 
  puts "|" + " " * padding + "|"
  puts "| #{string} |"
  puts "|" + " " * padding + "|"
  puts "+" + "-" * padding + "+" 
end


print_in_box('To boldly go where no one has gone before.')
#+--------------------------------------------+
#|                                            |
#| To boldly go where no one has gone before. |
#|                                            |
#+--------------------------------------------+

print_in_box('')
#+--+
#|  |
#|  |
#|  |
#+--+

# You may assume that the input will always fit in your terminal window.