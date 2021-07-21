# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

def friday_13th(year)
  counter = 0
  1.upto(12) do |month|
     thirteenths = Time.new(year, month, 13)
     counter += 1 if thirteenths.friday?
  end
  counter
end

def extra_fridays(year)
  months = {1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December'}
  
  five_fridays = 0
  1.upto(12) do |month|
    fridays = 0
    1.upto(31) do |day|
      date = Time.new(year, month, day)
      fridays += 1 if date.friday? && months[date.mon] == months[month]
    end
    five_fridays += 1 if fridays > 4
  end
  p "There are #{five_fridays} months with 5 Fridays in #{year}."
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

extra_fridays(2015)
extra_fridays(1986)
extra_fridays(2019)