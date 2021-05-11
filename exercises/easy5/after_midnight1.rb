# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

def remove_sign(int)
  int < 0 ? int = int * -1 : int
end

def calculate_hours(mins)
  hours = 0
  if mins < 60
    hours = 0
  else
    hours = mins / 60
  end
end

def calculate_minutes_remaining(mins)
  minutes_remaining = 0
  if mins < 60
    minutes_remaining = mins
  else
    minutes_remaining = mins % 60
  end
end


def calculate_time(hours, minutes)
  if minutes == 0 && hours < 0 
    hours = 24 - (remove_sign(hours) % 24) 
  elsif minutes < 0
    hours = 23 - (remove_sign(hours) % 24)
    minutes = 60 - remove_sign(minutes)
  else
    hours = hours % 24
  end

  hours = sprintf("%.2d", hours)
  minutes = sprintf("%.2d", minutes)
  time = "#{hours}:#{minutes}"
end

def time_of_day(minutes)
  mins = remove_sign(minutes)
  
  minutes < 0 ? hours = -calculate_hours(mins) : hours = calculate_hours(mins)
  minutes < 0 ? minutes_remaining = -calculate_minutes_remaining(mins) : minutes_remaining =    calculate_minutes_remaining(mins)

  calculate_time(hours, minutes_remaining)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# Disregard Daylight Savings and Standard Time and other complications.