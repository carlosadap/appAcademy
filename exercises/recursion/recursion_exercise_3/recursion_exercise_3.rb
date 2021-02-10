def range_recursive(start_num, end_num)
  return [] if end_num <= start_num

  [start_num] + range_recursive(start_num+1, end_num)
end

p range_recursive(1, 5) # => [1, 2, 3, 4]
p range_recursive(2, 10) # => [2, 3, 4, 5, 6, 7, 8, 9]
p range_recursive(5, 1) # => []
puts "-------------"

def sum_recursive(arr)
  return arr.first || 0 if arr.length <= 1

  arr.first + sum_recursive(arr[1..-1])
end

p sum_recursive([1, 2, 3, 4]) # => 10
p sum_recursive([2, 3, 4, 5, 6, 7, 8, 9]) # => 44
p sum_recursive([]) # => 0
puts "-------------"

def sum_iterative(arr)
  sum = 0

  arr.each { |ele| sum += ele }

  sum
end

p sum_iterative([1, 2, 3, 4]) # => 10
p sum_iterative([2, 3, 4, 5, 6, 7, 8, 9]) # => 44
p sum_iterative([]) # => 0
puts "-------------"

def exp(num_1, num_2)
  idx = 0
  puts idx
  return 1 if num_2 == 0

  num_1 * exp(num_1, num_2 - 1)
end

def exp_2(num_1, num_2)
  idx = 0
  puts idx
  return 1 if num_2 == 0
  return num_1 if num_2 == 1

  if num_2.even?
    return exp_2(num_1, num_2 / 2) ** 2
  else
    return num_1 * exp_2(num_1, (num_2 - 1) / 2) ** 2
  end
end

p exp(2, 2)
p exp_2(2, 2)
puts "-------------"
p exp(2, 3)
p exp_2(2, 3)
puts "-------------"
p exp(2, 4)
p exp_2(2, 4)
puts "-------------"
p exp(2, 5)
p exp_2(2, 5)
puts "-------------"
p exp(2, 6)
p exp_2(2, 6)
puts "-------------"
p exp(2, 7)
p exp_2(2, 7)
puts "-------------"
p exp(2, 8)
p exp_2(2, 8)
puts "-------------"
p exp(2, 9)
p exp_2(2, 9)
puts "-------------"
p exp(2, 10)
p exp_2(2, 10)
puts "-------------"
p exp(2, 11)
p exp_2(2, 11)
puts "-------------"
p exp(2, 12)
p exp_2(2, 12)
puts "-------------"
p exp(2, 256)
p exp_2(2, 256)
puts "-------------"

def deep_dup(arr)
  return [arr] if !arr.is_a?(Array)
  new_arr = []

  arr.each do |ele|
    new_arr += deep_dup(ele) 
  end

  new_arr
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
mixed_arr = [1, [2], [3, [4]]]
p deep_dup(robot_parts)
p robot_parts

p deep_dup(mixed_arr)
p mixed_arr