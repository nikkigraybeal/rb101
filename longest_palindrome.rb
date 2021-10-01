=begin
Given a string consisting of 1 or more lower case letters, write a method that returns an integer representing the length of longest substring that is also a palindrome without using the reverse method.

input: string
output: integer representing the longest substring that is also a palindrome

rules:
  - substrings are 1 or more chars in length
  - all lowercase

algorithm 1st pass:
find all substrings in string
check each substring to see if it is a palindrome
if it is a palindrome, push it's size to an array
return the max value from the array

#well, that was easy! Seems a promising start at the very least.
#Hmm, time to flesh this out a little more though...(scratches head, gets up to make coffee).

(clock, coffee, smiley)
algorithm 2nd pass:
find all substrings in string
  iterate over string
    take the first element by itself
    then take the 1st through 2nd, then 1st through 3rd...
  check if each substring is a palindrome
    iterate over the substring backwards
      push each letter to a new string
      compare the new string to the old sub string
      if they are eqivalent..
  if it's a palindrome, push it's size to an array
  return the max value from the array


#ok! I'm ready to commit. How can something that feels so right be wrong?! Time to write some code!

def longest_palindrome(string)
  string.each_index |idx|
    substring = string.slice(idx, 0)
end

#oh wait...I need to be able to increment the length of my substring! I need a nested loop!


def longest_palindrome(string)
  string.size.times do |length|
    string.each_index |idx|
      substring = string.slice(idx, length)
    end
  end
end

#ah. that looks better. Maybe I should go back and...nah. everything is great! I''m sure it will all work out...

#Public service announcement: Please just scroll through the train wreck below. much like my love life in my twenties, it's just one long stream of questionable choices followed by regret and embarrassment.

def longest_palindrome(string)
  string.size.times do |length|
    string.each_index |idx|
      substring = string.slice(idx, length)
      substring.each_char do |char|
      end   
    end
  end
end

#ah, shoot. It just dawned on me that's not gonna work, duh. I"m trying to use an array method on a string, silly me! I need to change the string into an array from the get-go...no problem!
#Just a slight adjustment, doesn't really change anything crucial...no need to revisit that algorithm!

def longest_palindrome(string)
  chars = string.chars
  chars.size.times do |length|
    chars.each_index |idx|
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|   
    end
  end
end

#lookiing good! I see no problems here. Onward! 

def longest_palindrome(string)
  chars = string.chars
  chars.size.times do |length|
    chars.each_index |idx|
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
    end
  end
end

#hmm...looks like I need to initialize an empty string somewhere...well, if I just put it at the top of the method definition, it will be available throughout the whole method...brilliant!

def longest_palindrome(string)
  reversed = ''
  chars = string.chars
  chars.size.times do |length|
    chars.each_index |idx|
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
      if reversed == substring
        size_arr << reversed.size
      end
    end
  end
end

# oops...gotta initialize that size_arr as well...

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars
  chars.size.times do |length|
    chars.each_index |idx|
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
end


#and now for the final touch...

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars
  chars.size.times do |length|
    chars.each_index do |idx|
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  size_arr.max
end

#whoop! let's run this thang. 


false
false
false
false
false
false
#sad face. Though not unexpected, because this is how I roll. Let's see what our output really looks like. 


def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars
  chars.size.times do |length|
    chars.each_index do |idx|
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  p size_arr.max
end


nil
false
nil
false
nil
false
nil
false
nil
false
nil
false



# nil?? well, that's curious. I didn't see that coming, for some reason...(head scratch)
# what exactly is in size_arr anyway??

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars
  chars.size.times do |length|
    chars.each_index do |idx|
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  p size_arr
  size_arr.max
end
[]
false
[]
false
[]
false
[]
false
[]
false
[]
false

#well, nothing, of course. sigh.


#what the heck is going on herer?? Maybe there is something more fundamentally wrong with my code?? It may be time for some deeper reflection, I suppose. Time to comb through each line and figure out where I went wrong. Go back and look at my algorithm??...that will take too long! I'm sure it will just take a minute to fix.

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars         #turn that string into an array
  chars.size.times do |length|  #iterate over it- length will iterate from 0 to the last index...+ 1...might this be the problem?? 
    chars.each_index do |idx|   
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  size_arr.max
end


#how do I even test for that?! Lazy (wo)man's way, of course! I can just subtract 1 from size. That way it's a non issue and I don't have to think too hard. (halo)

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars         #turn that string into an array
  (chars.size - 1).times do |length|  #iterate over it- length will iterate from 0 to the last index...+ 1...might this be the problem?? 
    chars.each_index do |idx|   
      substring = chars.slice(idx, length)
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  p size_arr.max
end

#well, that changed nothing:/

nil
false
nil
false
nil
false
nil
false
nil
false
nil
false

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars         #turn that string into an array
  (chars.size - 1).times do |length|  #iterate over it- length will iterate from 0 to the last index 
    chars.each_index do |idx|          #iterate over chars array with index
      substring = chars.slice(idx, length)  #create sub array from idx (0,1,2,3) and length(0)....OH! that's the problem. My logic is reversed here. Length and idx need to be switched.
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  p size_arr.max
end



def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars         #turn that string into an array
  (chars.size - 1).times do |idx|  #iterate over chars array- idx will iterate from 0 to the last index 
    chars.each_index do |length|          #iterate over chars array with index- index is length
      substring = chars.slice(idx, length)  
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  p size_arr.max
end

#Pleaseohpleaseohpleaseohleaseletthiswork(praying hands)

nil
false
nil
false
nil
false
nil
false
nil
false
nil
false

(doh)


#Time to put p's everywhere. I'm sure that's how the pros do it.

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  chars = string.chars         #turn that string into an array
  p chars
  (chars.size - 1).times do |idx|  #iterate over chars array- idx will iterate from 0 to the last index 
    chars.each_index do |length|        #iterate over chars array with index- index is length
      p idx
      p length
      substring = chars.slice(idx, length)
      p substring 
      substring.reverse_each do |char|
        reversed << char
        p reversed
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  size_arr.max
end


p longest_palindrome('a') == 1
output:
["a"]  #chars
       #ummm...shouldn't there be an idx and length here?! Um, no. chars.size - 1 doesn't work for an array with a single element. 
false   #return of method call. 

p longest_palindrome('aa') == 2
output:
["a", "a"]  #chars
0   #idx. 
0  #length. ugh...length is 0 on the first pass so it's not creating a substring the first time around and it never makes it to the last array element
[] #substring. Yep, it has nothing because nothing was passed to it 
   #where is reversed?? calling an iterative method on an empty array doesn't accomplish much, as it turns out. 
0 #idx. still 0. Thank God. Something is working the way I think it should.
1 #length
["a"] #substring. 
"a"  #reversed. This seems like it's working at this point.
false

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  return 1 if string.size == 1  # we'll just take care of that single-element-array-problem right up front.
  chars = string.chars        
  (chars.size - 1).times do |idx|  
    chars.each_index do |length|        
      substring = chars.slice(idx, length + 1) # might this be the magical fix??
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  size_arr.max
end

true
false
false
false
false

# Fat chance. The first one is working though! I'm taking it as a win. 

#ok...moving down the line. Yeah, I know, I don't really know if my "magical fix" worked. Duly noted. Moving on, I say.
#let's see what reversed has in it.


def longest_palindrome(string)
  reversed = ''
  size_arr = []
  return 1 if string.size == 1 .
  chars = string.chars        
  (chars.size - 1).times do |idx|  
    chars.each_index do |length|        
      substring = chars.slice(idx, length + 1) 
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring
    end
  end
  p reversed
  size_arr.max
end

#hmmm, somethings not quite right with reversed. shocking. 
true
"aaa"
false
"babaabaaaaa"
false
"aaabaaababa"
false
"babaabbaabcbaabdcbaabaaabaacbaadcbaadcbaaabacbadcbadcbadcbabcbdcbdcbdcbdcbcdcdcdcdcdc"
false


#I think I need to empty reversed at the end of every iteration of the .times method call. 

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  return 1 if string.size == 1  #we'll just take care of that single-element-array-problem right up front.
  chars = string.chars         #turn that string into an array
  (chars.size - 1).times do |idx|  #iterate over chars array- idx will iterate from 0 to the last index 
    chars.each_index do |length|        #iterate over chars array with index- index is length
      substring = chars.slice(idx, length + 1) #might this be the magical fix??
      substring.reverse_each do |char|
        reversed << char
      end
      p reversed
      p substring
      size_arr << reversed.size if reversed == substring
      reversed.clear
    end
  end
  size_arr.max
end

true #still working (muscle)
"a"  #reversed
["a"] #substring...ah. I have to join substring! That's why they're never are equivalent and size_arr returns nil! Eueeka!
"aa"
["a", "a"]
false
"b"
["b"]
"ab"
["b", "a"]
"aab"
["b", "a", "a"]
"a"
["a"]
"aa"
["a", "a"]
"aa"
["a", "a"]
false



def longest_palindrome(string)
  reversed = ''
  size_arr = []
  return 1 if string.size == 1  #we'll just take care of that single-element-array-problem right up front.
  chars = string.chars         #turn that string into an array
  (chars.size - 1).times do |idx|  #iterate over chars array- idx will iterate from 0 to the last index 
    chars.each_index do |length|        #iterate over chars array with index- index is length
      substring = chars.slice(idx, length + 1) #might this be the magical fix??
      substring.reverse_each do |char|
        reversed << char
      end
      size_arr << reversed.size if reversed == substring.join #now we're comparing apples to apples...er...strings to strings.
      reversed.clear
    end
  end
  size_arr.max
end

true
true
true
true
true

#I'm a coding genius!!! (frankenstein gif)

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4

#Yeah, no. No, I'm not. Although the basic ideas in my original algorithm are still present in my solution, there are crucial details missing from the logic that tripped me up and took tons of time to hack my through. Let's make a side-by-side comparison.

def longest_palindrome(string)
  reversed = ''
  size_arr = []
  return 1 if string.size == 1  
  chars = string.chars         
  (chars.size - 1).times do |idx|                               #find all substrings in string
    chars.each_index do |length|                                #iterate over string
      substring = chars.slice(idx, length + 1)                  #take the first element by itself then take the 1st through 2nd,
                                                                #then 1st through 3rd...
                                                                #check if each element is a palindrome
      substring.reverse_each do |char|                          #iterate over the substring backwards
        reversed << char                                        #push each letter to a new string                
      end                         
      size_arr << reversed.size if reversed == substring.join   #compare the new string to the old sub string
                                                                #if they are eqivalent push it's size to an array
      reversed.clear
    end
  end
  size_arr.max                                                  #return the max value from the array
end

#By my count there are 8 added method calls or adjustments to the logic of my original algorithm in my solution. Also, I'm not convinced this is the best solution. There has to be a better way to deal with stings of 1 character at the very least. And a triple nested loop? really??


#Let's just try this whole process again, but this time, the right way. The way the pros do it. Ya know, with a logical plan AND the willingness to adjust that logic when things fail to go as planned. 


#let's start with that algorithm again:

=begin
algorithm 2nd pass:
find all substrings in string
  iterate over string
    take the first element by itself
    then take the 1st through 2nd, then 1st through 3rd...
  check if each substring is a palindrome
    iterate over the substring backwards
      push each letter to a new string
      compare the new string to the old sub string
      if they are eqivalent..
  if it's a palindrome, push it's size to an array
  return the max value from the array

Maybe a 3rd pass is in order:

Find all substrings in string
  size_arr = []
  change string into array
  initialize an index var to 0
  iterate from 1 upto array.size |length|
    substring = array[index, length]
    check if substring is a palindrome
    use map on substring to return an array of the reversed substring characters
    initialize a new var, last_idx to the size of substring
    call map on substring, decrement index and return substring[index]. save the result in reversed
    compare substring and reversed
    if they are equivalent, push it's size to size_arr
return max value from size_arr



def longest_palindrome(string)
  size_arr = []
  chars = string.chars
  index = 0
  1.upto(chars.size) do |length|
    substring = chars[index, length]
    last_idx = substring.size
    reversed = substring.map do |char|
      last_idx -= 1
      substring[last_idx]
    end
    size_arr << substring.size if substring == reversed
  end
  size_arr.max
end

true
true
false
true
true



#well, that is interesting. Lets see what that 3rd test case is doing...

def longest_palindrome(string)
  size_arr = []
  chars = string.chars
  index = 0
  1.upto(chars.size) do |length|
    substring = chars[index, length]
    last_idx = substring.size
    reversed = substring.map do |char|
      last_idx -= 1
      substring[last_idx]
    end
    p substring
    p reversed
    size_arr << substring.size if substring == reversed
  end
  size_arr.max
end

["b"]     #substring
["b"]     #reversed
["b", "a"]  #subsring
["a", "b"]  #reversed
["b", "a", "a"]  #substring
["a", "a", "b"]  #reversed
false

#looks like my upto loop isn't working the way I thought it should. Ooo! I could just go tweak my code real quick and I'm sure it will just be a quick fix!!...
#No! Stay strong. We're doing this the right way, remember? Just focus on the algorithm.

Find all substrings in string
  size_arr = []
  change string into array
  initialize an index var to 0

  iterate from 1 upto array.size |length|
    substring = array[index, length]
    check if substring is a palindrome
    use map on substring to return an array of the reversed substring characters
    initialize a new var, last_idx to the size of substring
    call map on substring, decrement index and return substring[last_idx]. save the result in reversed
      compare substring and reversed
      if they are equivalent, push it's size to size_arr
    Increment index
  return max value from size_arr


#Aha! I forgot to increment index. Phew, no logic problem, just inattention to detail. I actually had to look at my code to see this, BUT I'm going to go straight to my algorithm and make the change there first.

def longest_palindrome(string)
  size_arr = []
  chars = string.chars
  index = 0

  1.upto(chars.size) do |length|
    substring = chars[index, length]
    last_idx = substring.size
    reversed = substring.map do |char|
      last_idx -= 1
      substring[last_idx]
    end
    p substring
    p reversed
    size_arr << substring.size if substring == reversed
  index += 1
  end
  size_arr.max
end

#now lets see what that 3rd test case returns (fingers crossed)
=begin
["b"]
["b"]
["a", "a"]
["a", "a"]
["a"]
["a"]
true

#hand claps

#and the rest of the test cases just to be sure:

true
false
true
false
false

#NOOOOOOO

["b"]
["b"]
["a", "a"]
["a", "a"]
["a", "b", "c"]
["c", "b", "a"]
["b", "c", "d"]
["d", "c", "b"]
["c", "d"]
["d", "c"]
["d"]
["d"]
false
#I think I incremented index in the wrong place:/ It's advancing to the second index before it creates all the substrings beginning at the first index. Time to write each iteration out:

upto length = 1, index = 0
  substirng = chars[0, 1]

upto length = 2, index = 1
  substring = chars[2, 1]

Well, this is the problem. I need another inner loop. I was really hoping to avoid that, but the more I think about it, the more it seems necessary but honestly, I'm having a hard time articulating why. This is when the temptation to hack my way through is strongest. It will take me EFFORT to really think through this problem and create a mental picture of what is going on here. I'm not wired to be a visual thinker, but I do believe it's a skill I can aquire with practice. So, it's time for me to get out some paper. Maybe I'm just old, but there is something about working things out on paper. The act of writing is fundamentally different from typing as well. The more parts of yourself you involve in learning anything, the better you will learn it. Using words and pictures to describle the problem/solution seem obvious, but Something magical happens when I add a kinesthetic facet to the mix. Writing on paper often is key for me. I've been experimenting with developing an inner physical sensation to accompany my thoughts and pictures. I got the idea from a friend who is, by all accounts, brilliant. This is one of those people who reads books in hours, not days and retains the vast majority of what they read. A strong aspect of his learning process involves a physical componenet. He actually creates a physical sensation that represents an idea. Like, whoa! I never even considered that as a possibility! So, aim for words, pictures AND sensation when creating that "mental model". In this case, I imagine myself holding the numbers of each variable in my hands. Index is in my left hand, Length is in my right. As I picture the loops I use words to describe what is going on and I imagine swapping the numbers in my hands as I go through each loop.   


#back to the algorithm:
Find all substrings in string
  size_arr = []
  change string into array

  iterate array.size times over array |index|
    length = 1
    loop
      substring = array[index, length]
      
      initialize a new var, last_idx to the size of substring
      call map on substring, decrement last_idx and return substring[last_idx]. save the result in reversed

      compare substring and reversed
      if they are equivalent, push it's size to size_arr
      Increment length until length is greater than substring size
  return max value from size_arr



def longest_palindrome(string)
  size_arr = []
  chars = string.chars

  chars.size.times do |index|
    length = 1
    loop do
      substring = chars[index, length]

      last_idx = substring.size
      reversed = substring.map do |char|
        last_idx -= 1
        substring[last_idx]
      end

      size_arr << substring.size if substring == reversed
      length += 1
      break if length > substring.size
    end
  end
  size_arr.max
end

#I just noticed there is a problem with my length variable without even running it. See? I'm getting smarter already (nerd) It's incrementing in the loop from size 1 to the size of the string but the substrings should start from the current index, so their length with gradually become shorter and shorter as we near the last iteration of the times method. Time for more thinking. In words: Length needs to begin at 1 and end at substring size - index, so instead of breaking out of the loop with substring.size, I need to break if length is greater than substring size - the current index. AND, I see I need to clear reversed after each iteration of the loop as well.

Yeah...turns out I don't know how break works. Dang. 
(clock)
...ok. Break exits from the current method, not just the loop. SO, 

Find all substrings in string
  size_arr = []
  change string into array
   
  iterate array.size times over array |index|
    iterate over array again from 1 upto size of array - 1 |length|
      substring = array[index, length]
      
      initialize a new var, last_idx to the size of substring
      call map on substring, decrement last_idx and return substring[last_idx]. save the result in reversed

      compare substring and reversed
      if they are equivalent, push it's size to size_arr
      clear reversed array
      Increment length until length is greater than substring.size - current index
  return max value from size_arr


=end

def longest_palindrome(string)
  size_arr = []
  chars = string.chars

  chars.size.times do |index|
    chars.each_index do |length|
      length += 1
      substring = chars[index, length]
     
      last_idx = substring.size
      reversed = substring.map do |char|
        last_idx -= 1
        substring[last_idx]
      end
      size_arr << substring.size if substring == reversed
      reversed.clear
    end
  end
  size_arr.max
end

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4