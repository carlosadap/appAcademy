def my_reject(arr, &prc)
  rejected_arr = []

  arr.each { |ele| rejected_arr << ele if !prc.call(ele) }

  rejected_arr
end

def my_one?(arr, &prc)
  new_arr = []

  arr.each { |ele| new_arr << ele if prc.call(ele) }

  new_arr.length == 1
end

def hash_select(hash, &prc)
  new_hash = {}

  hash.map { |k, v| new_hash[k] = v if prc.call(k, v) }

  new_hash
end

def xor_select(arr, prc1, prc2)
  # prc1 = Proc.new {  }
  # prc2 = Proc.new {  }

  new_arr = []

  arr.each do |ele| 
    if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
      new_arr << ele 
    end
  end

  new_arr
end

def proc_count(val, arr)

  arr.count { |prc| prc.call(val) }

end
