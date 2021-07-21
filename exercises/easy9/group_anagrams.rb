# Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

words.each do |word|
  anagrams = []
  letters = word.chars.sort.join
  words.each do |word2|
    letters2 = word2.chars.sort.join
    if letters == letters2
      anagrams << word2
    end
  end
  p anagrams
end

# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)