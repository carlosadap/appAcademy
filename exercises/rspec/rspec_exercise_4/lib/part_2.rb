def proper_factors(num)
  factors = []

  (1...num).each { |n| factors << n if num % n == 0 }

  factors
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(num)
  new_arr = []
  i = 1

  while new_arr.length < num
    new_arr << i if perfect_number?(i)
    i += 1
  end

  new_arr
end