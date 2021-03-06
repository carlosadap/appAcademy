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
  return arr if !arr.is_a?(Array)
  new_arr = []

  arr.each do |ele|
    new_arr << deep_dup(ele) 
  end

  new_arr
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
robot_parts_dup = deep_dup(robot_parts)
robot_parts[1] << "LEDs"

p robot_parts
p robot_parts_dup

mixed_arr = [1, [2], [3, [4]]]
mixed_arr_dup = deep_dup(mixed_arr)
mixed_arr[1] << [2]

p mixed_arr
p mixed_arr_dup
puts "-------------"

def fib_recursive(n)
  return [1] if n < 2
  return [1, 1] if n < 3

  base_arr = fib_recursive(n-1)
  
  base_arr << base_arr[n-2] + base_arr[n-3]
end

p fib_recursive(1)
p fib_recursive(2)
p fib_recursive(3)
p fib_recursive(8)
puts "-------------"

def fib_iterative(n)
  case n
  when 1
    return [1]
  when 2
    return [1,1]
  end

  base_arr = [1, 1]
  
  while base_arr.length < n
    base_arr << base_arr[-1] + base_arr[-2]
  end
  
  base_arr
end

p fib_iterative(1)
p fib_iterative(2)
p fib_iterative(3)
p fib_iterative(8)
puts "-------------"

def bsearch(arr, target)
  start_idx = 0
  end_idx = arr.length-1

  return nil if arr.length == 0

  mid_idx = (start_idx + end_idx) / 2

  if arr[mid_idx] == target
    return mid_idx
  elsif arr[mid_idx] < target
    pos_result = bsearch(arr[mid_idx+1, end_idx], target)
    pos_result.nil? ? nil : mid_idx+1 + pos_result
  else
    return bsearch(arr[start_idx, mid_idx], target)
  end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
puts "-------------"

def merge_sort(arr)
  return arr if arr.length <= 1

  pivot = arr.first

  left_side = arr.drop(1).select { |ele| ele <= pivot }
  right_side = arr.drop(1).select { |ele| ele > pivot }

  merge_sort(left_side) + [pivot] + merge_sort(right_side)
end

arr1 = (1..10).to_a.shuffle
arr2 = (1..10).to_a.shuffle
arr3 = (1..10).to_a.shuffle
arr4 = (1..10).to_a.shuffle

p merge_sort(arr1)
p merge_sort(arr2)
p merge_sort(arr3)
p merge_sort(arr4)
puts "-------------"

def subsets(arr)
  return [[]] if arr.empty?
  
  size = arr.length-1
  
  new_arr = subsets(arr.take(size))

  new_arr += new_arr.map { |array| array + [arr[-1]] }
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
puts "-------------"

def permutations(arr)
  return [arr] if arr.length <= 1

  first = arr.shift
  perms = permutations(arr)
  total_permutations = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end
  
  total_permutations
end

p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #      [2, 1, 3], [2, 3, 1],
                        #      [3, 1, 2], [3, 2, 1]]

