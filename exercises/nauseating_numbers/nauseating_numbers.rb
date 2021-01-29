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