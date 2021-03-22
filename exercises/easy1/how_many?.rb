#Given an array
#take each item of the array and compare it to the other items in the array
#  if the items are the same add 1 to count
#  add the item and count value to a new array
#print the array

def count_occurrences(array)
  new_arr = []
  count = 0
  i = 0
  while i < array.length
    array.each do |item|
      if item == array[i]
        count += 1
      end
    end
    new_arr.push("#{array[i]} => #{count}")
    count = 0
    i += 1
  end
  puts new_arr.uniq!
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'  

count_occurrences(vehicles)


#The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

#Expected output:
#car => 4
#truck => 3
#SUV => 1
#motorcycle => 2