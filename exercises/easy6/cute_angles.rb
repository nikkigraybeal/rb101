# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

# Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

# You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

def strip_decimals(float)
  stripped_deci = float.to_f.to_s.split('.') [1]
  string_float = "0." + stripped_deci
end

def minutes(float)
  minutes_float = strip_decimals(float)
  (minutes_float.to_f * 60).to_i
end

def seconds(float)
  minutes_string = strip_decimals(float)
  minutes_float = minutes_string.to_f * 60
  seconds_float = strip_decimals(minutes_float)
  (seconds_float.to_f * 60).to_i
end

def format_zeros(int)
  if int < 10
    sprintf("%.2d", int)
  else
    int
  end
end

def dms(float) 
  degrees = float.to_i
  minutes = minutes(float)
  minutes = format_zeros(minutes)
  seconds = seconds(float)
  seconds = format_zeros(seconds)

  %(#{degrees}#{DEGREE}#{minutes}'#{seconds}")
end


p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")