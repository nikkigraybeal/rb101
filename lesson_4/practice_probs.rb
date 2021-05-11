=begin

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.

new_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name) + 1
end

p new_hash


# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

accumulator = 0
iterator = 0
ages_arr = ages.to_a

loop do 
  break if iterator == ages_arr.size
  accumulator += ages_arr[iterator][1] 
  iterator += 1
end

p accumulator


# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

ages.delete_if { |k, v| v >= 100 }

p ages


# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sort[0]


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

index = 0
for name in flintstones
  if name.match?(/Be.*/)
    p index
  else
    index += 1
  end
end


# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }

p flintstones


# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
counts = Hash.new(0)

statement.delete(" ").each_char do |char|
  counts[char] += 1
end

p counts

# As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"

# Write your own version of the rails titleize implementation.

p words.split.map { |word| word.capitalize }.join(" ")



# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below


# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munsters.each do |k, v|
  case
  when v["age"] < 18
    v["age_group"] = "kid"
  when v["age"] > 17 && v["age"] < 65
    v["age_group"] = "adult"
  else 
    v["age_group"] = "senior"
  end
end
p munsters

=end

numbers = [1, 2, 4, 5, 7, 8, 10, 13, 14]
odd_numbers, even_numbers = numbers.partition do |number|
                              number.even?
                            end

p odd_numbers
p even_numbers