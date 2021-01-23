# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  count = 1
  arr = str.split("")
  new_arr = []
  (0...arr.length).each do |i|
    if arr[i] == arr[i+1]
      count += 1
    else
      count == 1 ? new_arr << arr[i] : new_arr << count.to_s + arr[i]
      count = 1
    end
  end
  return new_arr.join


end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
