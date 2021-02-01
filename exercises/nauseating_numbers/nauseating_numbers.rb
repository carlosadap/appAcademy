require "byebug"

def strange_sums(arr)
  count = 0
  
  (0...arr.length-1).each do |i|
    (i...arr.length).each do |j|
      count += 1 if (arr[i] + arr[j] == 0)
    end
  end

  count
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
puts "----------"

def pair_product(arr, product)

  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] * arr[j] == product
    end
  end

  false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false
puts "----------"

def rampant_repeats(str, hash)
  chars = str.split("")
  new_str = ""

  chars.each do |char|
    if hash[char]
      new_str += char * hash[char]
    else
      new_str += char
    end
  end

  new_str
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'
puts "----------"

def perfect_square(num)
  factor = 1
  product = factor * factor

  while product <= num
    return true if product == num
    factor += 1
    product = factor * factor
  end

  false
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false
puts "----------"

def anti_prime?(num)
  hash = { }

  (1..num).each { |n| hash[n] = n_divisors(n) }

  hash.max_by{|k,v| v} [0] == num

end

def n_divisors(num)
  count = 0

  (1..num).each { |n| count += 1 if num % n == 0 }

  count
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false
puts "----------"

def matrix_addition(arr1, arr2)
  row_length = arr1.length
  col_length = arr1[0].length
  sum_arr = Array.new(row_length) {Array.new(col_length)}

  (0...row_length).each do |row|
    (0...col_length).each do |col|
      # debugger
      sum_arr[row][col] = arr1[row][col] + arr2[row][col]
    end
  end

  sum_arr
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
puts "----------"

def mutual_factors(*nums)
  factors_arr = []

  (1..nums.min).each do |factor|
    factors_arr << factor if nums.all? { |num| num % factor == 0 }
  end

  factors_arr
end
  p mutual_factors(50, 30)            # [1, 2, 5, 10]
  p mutual_factors(50, 30, 45, 105)   # [1, 5]
  p mutual_factors(8, 4)              # [1, 2, 4]
  p mutual_factors(8, 4, 10)          # [1, 2]
  p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
  p mutual_factors(12, 24, 64)        # [1, 2, 4]
  p mutual_factors(22, 44)            # [1, 2, 11, 22]
  p mutual_factors(22, 44, 11)        # [1, 11]
  p mutual_factors(7)                 # [1, 7]
  p mutual_factors(7, 9)              # [1]
  puts "----------"

def tribonacci_number(num)
  fib_arr = [1, 1, 2]
  
  if num < 4
    return fib_arr[num - 1]
  end

  (4..num).each do |n|
    fib_arr << fib_arr[n - 2] + fib_arr[n - 3] + fib_arr[n - 4]
  end

  fib_arr[num - 1]
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274
puts "----------"

def matrix_addition_reloaded(*arrs)  
  return nil if arrs.any? { |arr| arr.length != arrs[0].length }
    
  arrs.each do |matrix|
    # debugger
    return nil if matrix.any? { |col| col.length != matrix[0].length }
  end

  arrs.inject do |accu, matrix|
      matrix_addition(accu, matrix)
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]
matrix_f = [[0 , 0], [12, 4, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_f)    # nil
puts "----------"

def squaragonal?(arr)
  length = arr.length
  diagonal_1 = []
  diagonal_2 = []

  (0...length-1).each do |idx|
    diagonal_1 << arr[idx][idx]
    diagonal_2 << arr[idx][length-1-idx]
  end

  diagonal_1.uniq.size == 1 || diagonal_2.uniq.size == 1

end

  p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true


p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
puts "----------"

def pascals_triangle(n)
  base_arr = [[1], [1,1]]

  if n == 1
    return [[1]]
  elsif n == 2
    return base_arr
  end

  row = 2

  while base_arr.length < n
    base_arr << [1]

    (0...row-1).each do |idx|
      base_arr[row] << base_arr[row-1][idx] + base_arr[row-1][idx+1]
    end

    base_arr[row] << 1
    row += 1    
  end

  base_arr

end


p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

puts "----------"

def mersenne_prime(n)
  new_arr = []
  num = 3

  while new_arr.length < n
    new_arr << num if prime?(num) && one_less_power2?(num) 
    num += 1
  end

  new_arr[-1]
end

def prime?(n)
  return false if n < 2

  (2...n).each { |div| return false if n % div == 0 }

  true
end

def one_less_power2?(n)
  num = 2

  while num < n
    num *= 2
  end
  
  num -1 == n
end


p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
puts "----------"