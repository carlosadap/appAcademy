# General Problems

## no_dups?

### Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

def no_dupes?(arr)

  sole_hash = Hash.new(0)
  arr.each { |ele| sole_hash[ele] += 1 }

  sole_hash.select { |k, v| v == 1 } .keys.to_a
end

# Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])

## no_consecutive_repeats?

### Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
  (0...arr.length-1).each { |idx| return false if arr[idx] == arr[idx+1] }

  true
end

# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

## char_indices

### Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

def char_indices(str)
  char_hash = Hash.new { |h, k| h[k] = [] }
  
  str.each_char.with_index { |char, idx| char_hash[char] << idx }

  char_hash
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

## longest_streak

### Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
  streak = ""
  streaks = []
  (0...str.length).each do |idx|
    if str[idx] == str[idx+1]
      streak += str[idx]
    else
      streak += str[idx]
      streaks << streak
      streak = ""
    end
  end

  streaks.sort_by(&:length)[-1]

  #max { |a, b| a.length <=> b.length }.last
end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('bbbaaa')      # => 'aaa'
p longest_streak('abc')         # => 'c'
p longest_streak('acb')         # => 'b'

## bi_prime?
### Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

### For Example:

### 14 is a bi-prime because 2 * 7
### 22 is a bi-prime because 2 * 11
### 25 is a bi-prime because 5 * 5
### 24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(num)
  factors = []

  (2...num).each { |n| factors << n if num % n == 0 }

  # p factors

  if factors.length == 0
    return false
  end

  (0..(factors.length/2)).each do |idx|
    if (factors[idx] * factors[-1-idx] == num) && (prime?(factors[idx])) && (prime?(factors[-1-idx]))
      return true
    end
  end

  false
end

def prime?(num)
  return false if num < 2

  (3...num).each { |n| return false if num % n == 0 }

  true
end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
p bi_prime?(2)   # => false
p bi_prime?(3)   # => false
p bi_prime?(4)   # => true

## vigenere_cipher

### A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

### A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

### Message:  b a n a n a s i n p a j a m a s
### Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
### Result:   c c q b p d t k q q c m b o d t

### Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(msg, keys)
  alpha = ('a'..'z').to_a
  arr_msg = msg.split("")
  keys_idx = 0

  cipher_arr = arr_msg.map do |ele|
    old_idx = alpha.index(ele)
    new_idx = (old_idx + keys[keys_idx]) % alpha.length
    keys_idx = (keys_idx+1) % keys.length
    alpha[new_idx]
  end

  cipher_arr.join
end

# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

## vowel_rotate

### Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.

def vowel_rotate(str)
  vowels = "aeiou"

  the_last_vowel = last_vowel(str)
  a_vowel = ""
  
  word_arr = str.split("")
  rotated_arr = []
  word_arr.each do |ele|
    if vowels.include?(ele)
      rotated_arr << the_last_vowel
      the_last_vowel = ele
    else
      rotated_arr << ele
    end
  end

  rotated_arr.join("")
end

def last_vowel(str)
  vowels = "aeiou"

  str.split("").reverse_each { |ele| return ele if vowels.include?(ele) }
end

### Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"