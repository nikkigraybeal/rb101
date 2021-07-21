def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]

=begin
Before adding array.size > 1 to line 4 of the method definition, the first call to my_method on line 13 returned an empty array, as expected. This is because the empty array passed to the method as an argument satisfied the first conditional of the method definition on line 2 so the method immediately returned an empty array without running the remaining code in the method definition. 
The rest of the calls to my_method on lines 14 - 16 returned nil because the call to map on line 5 was executed, but left the conditional asking "if an array" with no "then" statement, so the conditional returns nil. Because the conditional on line 4 is always triggered, nil will always be returned by the method as long as it is not passed an empty array. 
By adding array.size > 1 to line 4, the method will execute the call to map on line 5 only if the conditional on line 4 evaluates to true. This is the case with the calls to my_method on lines 15 and 16. The call to my_method on line 14 is passed an array with only one element so the conditional on line 4 evaluates to false. This causes the program to skip lines 5-7 and run the default code on line 9.
=end