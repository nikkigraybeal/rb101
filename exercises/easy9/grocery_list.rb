# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(nested_arr)
  groceries = []
  nested_arr.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times do |count|
      groceries << fruit
    end
  end
  groceries.flatten
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]