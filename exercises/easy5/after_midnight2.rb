=begin
# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# PEDAC
  
  PROBLEM
  explicit requirements
  -write 2 methods that return an integer
    -one should return a positive integer representing minutes after midnight
    -the other should return a negative integer representing minutes before midnight
  -returned integer should be in the range 0..1439

  input: number string in 24 hour clock format 00:00
  output: integer representing minutes before or after midnight

  implicit requirements
  -leading zeros must be stripped from 24 hour clock time
  -the hour 00 and 24 are equivalent
  -hours before midnight need to convert time to number of hours before

  EXAMPLES
  before_midnight('00:30') ==> -1410
  after_midnight('24:30') ==> 30
  before_midnight('23:55') ==> -5
  after_midnight('23:55') ==> 1435
  before_midnight('00:00') ==> 0
  after_midnight('00:00') ==> 0

  DATA STRUCTURES

  none

  ALGORITHM
  
  After Midnight
  1. convert clock time to integers
     -split number string on ':'
     -SET hour and minutes variable
     -convert to integer
      -if hour = 24
        -hour = 0
    2. return minutes after midnight = hour * 60 + minutes

  Before Midnight
  1. convert clock time to integers as above
  2. convert clock hours to hours before
     -hours before midnight = 23 - hours
  3. convert clock minutes to minutes before
     - minutes before midnight = 60 - clock minutes
  4. minutes before midnight = hours before midnight * 60 + minutes before midnight

  
=end

MINUTES_IN_DAY = 60 * 24

def after_midnight(time)
  time_arr = time.split(':')
  hour = time_arr[0].to_i
  minutes = time_arr[1].to_i

  hour == 24 ? hour = 0 : hour

  total_minutes = hour * 60 + minutes
end

def before_midnight(time)
  minutes_before = MINUTES_IN_DAY - after_midnight(time)

  minutes_before == MINUTES_IN_DAY ? minutes_before = 0 : minutes_before
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0