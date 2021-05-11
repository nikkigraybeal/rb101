# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

def ordinalize(num_str)
  if num_str[-2] == '1'
    "#{num_str}th"
  else
    case num_str[-1]
    when '0' || '4' || '5' || '6' || '7' || '8' || '9' 
      "#{num_str}th"
    when '1'
      "#{num_str}st"
    when '2'
      "#{num_str}nd"
    when '3'
      "#{num_str}rd"
    end
  end
end

def century(year)
  str = year.to_s
  if str.length <= 2
    "1st"
  elsif str.end_with?('00')
    cent = year / 100
    ordinalize(cent.to_s)
  else
    str = str.chop.chop
    cent = str.to_i + 1
    ordinalize(cent.to_s)
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'