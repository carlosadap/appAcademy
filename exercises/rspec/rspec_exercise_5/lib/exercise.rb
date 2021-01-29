def zip (*arrs)
  new_arr = Array.new(arrs[0].length) { Array.new }

  (0...arrs[0].length).each do |idx|
    arrs.each { |subarray| new_arr[idx] << subarray[idx] }
  end

  new_arr
end

def prizz_proc(arr, prc1, prc2)
  new_arr = []

  arr.each do |ele|
    new_arr << ele if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
  end

  new_arr
end

def zany_zip(*arrs)
  arrs_length = arrs.map { |subarray| subarray.length }

  highest_length = arrs_length.max

  new_arr = Array.new(highest_length) { Array.new }

  (0...highest_length).each do |idx|
    arrs.each { |subarray| subarray[idx] ? new_arr[idx] << subarray[idx] : new_arr[idx] << nil }
  end

  new_arr
end

def maximum(arr, &prc)

  arr.inject { |acc, ele| prc.call(acc) > prc.call(ele) ? acc : ele }

end

def my_group_by(arr, &prc)

  new_hash = Hash.new { |h, k| h[k] = [] }

  arr.each { |ele| new_hash[prc.call(ele)] << ele }

  new_hash
end

def max_tie_breaker(arr, prc1, &prc2)
  return nil if arr.empty?

  arr.inject do |acc, ele|
    if prc2.call(acc) > prc2.call(ele)
      acc
    elsif prc2.call(acc) < prc2.call(ele)
      ele
    else
      prc1.call(acc) >= prc1.call(ele) ? acc : ele
    end
  end
end

def silly_syllables(sentence)
  words = sentence.split(" ")
  cut_words = []
  vowels = "aeiou"

  first_vowel_idx = 0
  last_vowel_idx = 0

  words.each do |word| 
    (0...word.length).each { |idx| last_vowel_idx = idx if vowels.include?(word[idx]) }
    (0...word.length).reverse_each { |idx| first_vowel_idx = idx if vowels.include?(word[idx]) }
    
    first_vowel_idx == last_vowel_idx ? cut_words << word : cut_words << word[first_vowel_idx..last_vowel_idx]     

    # cut_words << word[first_vowel..last_vowel]     

    # p cut_words
  end

  cut_words.join(" ")
end
