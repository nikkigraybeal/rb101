# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# Round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
# 
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].
=begin
def toggle_lights(int)
  lights = (1..int).to_a.map { |item| item = 'on' }
  divisor = 2
  lights_on = []
  loop do 
    lights.each_index do |index|
      if (index + 1) % divisor == 0 && lights[index] == 'on'
        lights[index] = 'off' 
      elsif (index + 1) % divisor == 0 && lights[index] == 'off'
        lights[index] = 'on' 
      else lights[index] = lights[index] 
      end
    end
    divisor += 1
    break if divisor == int + 1
  end
  lights.each_index do |index|
    if lights[index] == 'on'
      lights_on << index + 1
    end
  end
  p lights_on
end

=end

=begin
input: integer representing total number of switches
output: array of switches that are "on" after toggling
round 1: every light is turned on
# Round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].


toggle method
  return "on" if "off"
  otherwise return "on"

create an array of n elements, all "off"
iterate 1 upto n |num|
 iterate through array with index
   toggle switch if (index + 1) % num == 0 
  


=end

def toggle(switch)
  switch == "ON" ? "OFF" : "ON"
end

def toggle_lights(n)
  lights = (1..n).to_a.map{|switch| switch = "OFF"}
  1.upto(n) do |num|
    lights.each_index do |idx|
      lights[idx] = toggle(lights[idx]) if (idx + 1) % num == 0
    end
  end
  on = []
  lights.each_with_index do |switch, idx|
    on << (idx + 1) if switch == "ON"
  end
  on
end

p toggle_lights(5)
p toggle_lights(10)