# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

def diamond(odd)
  count = odd / 2
  by_twos = 1
  count.downto(0) do |n|
    puts (' ' * n) + ("*" * by_twos)
    by_twos += 2
  end
  by_twos = odd - 2
  1.upto(count) do |n|
    puts (' ' * n) + ("*" * by_twos)
    by_twos -= 2
  end
end


def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  outline = []
  stars.chars.each_index do |index|
    if index == 0 || index == stars.size - 1
      outline << stars[index]
    else outline << ' '
    end
  end
  puts outline.join.center(grid_size)
end

def diamond2(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(1)

# *

diamond(3)

#  *
# ***
#  *

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond2(5)
diamond2(9)