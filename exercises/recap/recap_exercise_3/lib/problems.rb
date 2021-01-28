# General Problems

## no_dups?

### Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

# def no_dupes?(arr)

#   sole_hash = Hash.new(0)
#   arr.each { |ele| sole_hash[ele] += 1 }

#   sole_hash.select { |k, v| v == 1 } .keys.to_a
# end

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])

## no_consecutive_repeats?

### Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.

# def no_consecutive_repeats?(arr)
#   (0...arr.length-1).each { |idx| return false if arr[idx] == arr[idx+1] }

#   true
# end

# # Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

## char_indices

### Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

# def char_indices(str)
#   char_hash = Hash.new { |h, k| h[k] = [] }
  
#   str.each_char.with_index { |char, idx| char_hash[char] << idx }

#   char_hash
# end

# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}