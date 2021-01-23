# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
  (2..num).reverse_each do |i|
    
    if is_prime?(i) && is_divisor?(num, i)
      return i
    end
  end
end

def is_prime?(num)
  return false if num < 2

  (2...num).each do | i |
    if num % i == 0
      return false
    end
  end

  return true
end

def is_divisor?(num, div)
  return num % div == 0
end


def unique_chars?(str)
  (0...str.length-1).each do | i |
    (i+1...str.length).each do | j |
      if str[i] == str[j]
        return false
      end
    end
  end
  return true
end

def dupe_indices(arr)
  # hash = {}
  hash = Hash.new { |h, k| h[k] = [] }

  (0...arr.length-1).each do | i |
    (i+1...arr.length).each do | j |
      # debugger
      if arr[i] == arr[j]
        # hash[arr[i]] << i
        # hash[arr[j]] << j
        hash[arr[i]] += [i, j]
        hash[arr[i]].uniq!
      end
    end
  end

  hash
end

def ana_array(arr_1, arr_2)

  (0...arr_1.length).each do | i |
    if arr_2.none?(arr_1[i])
      return false
    end
  end

  (0...arr_2.length).each do | i |
    if arr_1.none?(arr_2[i])
      return false
    end
  end

  return true
end

