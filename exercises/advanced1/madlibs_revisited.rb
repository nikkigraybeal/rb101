# Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.
# 
# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.
# 
# The challenge of this program isn't about writing your program; it's about choosing how to represent your data. Choose the right way to structure your data, and this problem becomes a whole lot easier. This is why we don't show you what the input data looks like; the input representation is your responsibility.

# Example output:
# 
# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

# Example replacement words
# 
# adjectives: quick lazy sleepy ugly
# nouns: fox dog head leg
# verbs: jumps lifts bites licks
# adverb: easily lazily noisily excitedly

file = File.read("madlibs.txt")


ADJECTIVES = ["sunny", "soft", "slimy", "gruesome", "friendly"]
VERBS = ["run", "swim", "jump", "leap"]
NOUNS = ["cat", "fox", "kid", "bear", "dog"]
ADVERBS = ["happily", "lazily", "deftly", "nimbly", "creakily"]

def randomize_hash(hash)
  hash = { :adjective => ADJECTIVES.sample, 
           :verb => VERBS.sample, 
          :noun => NOUNS.sample, 
          :adverb => ADVERBS.sample }
end


file.each_line do |line|
  words = randomize_hash(words) 
  puts sprintf(line , words)
end