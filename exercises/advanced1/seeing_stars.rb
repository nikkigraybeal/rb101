#Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

=begin
input: odd integer
output: 8 pointed start in an nxn grid

rules:
  -the smallest value for n is 7
 -the center row of the star is n *s long
 -the top and bottom rows begin and end with *s and have 1 * in the center position
 -the outer stars in subsequent rows begin and end 1 space closer to center until there are no spaces left and there are 3 *s

n = 7
string = ' ' * n
first = 0
iterate from 1 up to n / 2 |count|
row = string[n - (n-first)] = * + string[n/2] = * + string[n - count]
first += 1

p "*" * n

iterate from n / 2 down to 1 |count|

row = n - (n-first)                n/2                     n- count
first -= 1

=end

def star(n)
  string = " " * n
  first = 0
  1.upto(n/2) do |count|
    string[n - (n - first)] = "*"
    string[n/2] = "*"
    string[n - count] = "*"
    puts string
    string = " " * n
    first += 1
  end
  puts "*" * n
  first = 2
  (n/2).downto(1) do |count|
    string[n - (n - first)] = "*"
    string[n/2] = "*"
    string[n - count] = "*"
    puts string
    string = " " * n
    first -= 1
  end
end


star(7)


star(9)

