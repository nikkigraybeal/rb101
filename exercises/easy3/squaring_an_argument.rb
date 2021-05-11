def multiply(a, b)
  a * b
end

def squaring(c)
  multiply(c, c)
end

def exponential(num, exp)
  multiply(num, 1) ** exp
end

p squaring(5)
p exponential(2, 3)
