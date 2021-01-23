# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

# def coprime?(num1, num2)
#   num1_div = divisors(num1)
#   num2_div = divisors(num2)
#   num1_div.each do | n |
#     if num2_div.include?(n)
#       return false
#     end
#   end
#   return true
# end

# def divisors(num)
#   return (2...num).select { | n | num % n == 0}
# end

def coprime?(num1, num2)
  (2..num1).none? { | el | num1 % el == 0 && num2 % el == 0 }
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
