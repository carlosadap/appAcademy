def palindrome?(str) # cat
  half = str.length/2 # 1
  (0..half).each do |i|
    if str[i] != str[-1-i]
      return false
    end
  end
  return true
end

def substrings(str)
  chars = str.split("")
  strings = []
  (0...chars.length).each do | i |
    new_str = chars[i]
    (0...chars.length).each do | j |
      if j == i
        strings << new_str
      elsif (j > i)
        new_str += chars[j]
        strings << new_str
      end
    end
  end
  strings
end

def palindrome_substrings(str)
  new_arr = substrings(str)
  new_arr.select { |el| el.length > 1 && palindrome?(el)}
end
