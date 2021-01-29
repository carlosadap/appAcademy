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