def partition(arr, n)
  part_arr = [[],[]]
  arr.each do |el|
    if el < n
      part_arr[0] << el
    else
      part_arr[1] << el
    end
  end
  part_arr
end

def merge(hash_1, hash_2)
  new_hash = {}
  hash_1.each do | k, v |
    new_hash[k] = v
  end
  hash_2.each do | k, v |
    new_hash[k] = v
  end
  new_hash
end

def censor(sentence, arr)
  vowels = "aeiou"
  words = sentence.split(" ")
  censored_arr = []

  words.each do |word|
    censored_word = ""

    if arr.include?(word.downcase)
      word.each_char do |char|
        if vowels.include?(char.downcase)
          char = "*"
        end
        censored_word += char
      end
    else
      censored_word = word
    end

    censored_arr << censored_word
  end

  censored_arr.join(" ")
end

def power_of_two?(num)
  (0..num/2).any? { |n| 2 ** n == num}
end
