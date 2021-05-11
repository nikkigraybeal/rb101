def xor?(n1, n2)
  if n1.even? && n2.even? || n1.odd? && n2.odd?
    false
  else
    true
  end
end


p xor?(4,6)
p xor?(9,1)
p xor?(3,8)
p xor?(2,7)

def xor2?(n1, n2)
  if n1 == true && n2 == true || n1 ==false && n2 == false
    false
  else
    true
  end
end

p xor2?(5.even?, 4.even?)
p xor2?(5.odd?, 4.odd?)
p xor2?(5.even?, 4.odd?)
p xor2?(5.odd?, 4.even?)