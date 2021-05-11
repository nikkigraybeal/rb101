# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(str)
  result = ''
  needs_upper = true
  str.chars.each do |char|
    if char =~ /[^a-z^A-Z]/ || char == ' '
      result += char
    elsif needs_upper == true
      result += char.upcase 
      needs_upper = !needs_upper
    else
      result += char.downcase 
      needs_upper = !needs_upper
    end
  end
  result
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'



def staggered_case2(str, alphabetic_only:)
  result = ''
  needs_upper = true
  str.chars.each do |char|
    if char =~ /[a-z]/i
      needs_upper ? result += char.upcase : result += char.downcase
      needs_upper = !needs_upper
    else
      if alphabetic_only == 'yes'
        result += char
      else
        needs_upper ? result += char.upcase : result += char.downcase
        needs_upper = !needs_upper
      end
    end
  end
  result
end


p staggered_case2('I Love Launch School!', alphabetic_only: 'yes') == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS', alphabetic_only: 'no') == 'AlL CaPs'
p staggered_case2('ignore 77 the 444 numbers', alphabetic_only: 'yes') == 'IgNoRe 77 ThE 444 nUmBeRs'