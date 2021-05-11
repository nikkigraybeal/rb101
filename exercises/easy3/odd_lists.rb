# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(array)
  new_arr = []
  array.each_index do |index|
    if index.even?
      new_arr.push(array[index])
    end
  end
  new_arr
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def evenites(array)
  new_arr = []
  array.each_index do |index|
    if index.odd?
      new_arr.push(array[index])
    end
  end
  new_arr
end

p evenites([2, 3, 4, 5, 6]) == [3, 5]
p evenites([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenites(['abc', 'def']) == ['def']
p evenites([123]) == []
p evenites([]) == []

def oddities2(array)
  new_arr = []
  index = 0
  while index < array.length do 
    new_arr.push(array[index])
    index += 2
  end
  new_arr
end

p oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities2(['abc', 'def']) == ['abc']
p oddities2([123]) == [123]
p oddities2([]) == []

def oddities3(array)
  array.select { |element| array.index(element).even? }
end

p oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities3(['abc', 'def']) == ['abc']
p oddities3([123]) == [123]
p oddities3([]) == []