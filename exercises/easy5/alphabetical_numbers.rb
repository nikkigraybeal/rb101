# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

=begin
def alphabetic_number_sort(array)
  num_hash = Hash.new(0)
  counter = 0
  WORDS.each do |word|
    num_hash[counter] = word
    counter += 1
  end
  
  array = array.each_with_object([]) do |num, arr|
    arr << num_hash[num]
  end

  array.sort.map do |num|
    num_hash.key(num)
  end
end
=end

def alphabetic_number_sort(array)
  array.sort_by { |obj| WORDS[obj] }
end


p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]