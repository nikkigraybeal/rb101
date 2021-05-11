=begin

# Select from hash

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(hash)
  produce_keys = hash.keys
  fruits = {}
  counter = 0
  loop do
    break if counter == produce_keys.size
    if hash[produce_keys[counter]] == 'Fruit'
      fruits[produce_keys[counter]] = 'Fruit'
    end
    counter += 1
  end
  fruits
end


p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# Mutating Double Numbers Method

def double_numbers!(numbers)
  counter = 0
  loop do
    numbers[counter] = numbers[counter] * 2
    counter += 1
    break if counter == numbers.size
  end
  numbers
end

my_numbers = [2,3,4,5,6,7,8]
p double_numbers!(my_numbers)
p my_numbers


# Double odd indeces

def double_odd_indeces(numbers)
  counter = 0
  doubled_odds = []
  loop do
    break if counter == numbers.size

    numbers[counter] *= 2 if counter.odd?
    doubled_odds << numbers[counter]

    counter += 1
  end
  doubled_odds
end

my_numbers = [1,2,3,4,5,6,7]
p double_odd_indeces(my_numbers)

=end

# Multiply by any number

def multiply(numbers, multiplier)
  counter = 0
  multiplied_numbers = []

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    multiplied_numbers << current_number *= multiplier

    counter += 1
  end
  multiplied_numbers
end

my_numbers = [1,2,3,4,5,6,7,8]
p multiply(my_numbers, 5)


