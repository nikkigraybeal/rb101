# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(string)
 string == string.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

def arr_pal(array)
  array == array.reverse
end

p arr_pal([1,2,3,4,5]) == false
p arr_pal([1,2,3,2,1]) == true
p arr_pal(["a", "b", "c", "b", "a"]) == true
p arr_pal(["a", "b", "c", "d"]) == false

def obj_pal(obj)
  obj == obj.reverse
end

p obj_pal("madam") == true
p obj_pal("Madam") == false
p obj_pal([1,2,3,2,1]) == true
p obj_pal(["a", "b", "c", "d"]) == false