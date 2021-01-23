def hipsterfy(str)
  vowels = "aeiou"
  arr = str.split("")
  removed = false
  i = str.length-1
  while (!removed && i >= 0)
    if vowels.include?(arr[i])
      removed = true
      arr.delete_at(i)
    end
    i -= 1
  end
  return arr.join
end

def vowel_counts(str)
  hash = Hash.new(0)
  vowels = "aeiou"
  str.downcase.each_char do | char |
    if vowels.include?(char)
      hash[char] += 1
    end
  end
  return hash
end

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  
  str.each_char.with_index do | char, i | 
    if alphabet.include?(char)
      old_idx = alphabet.index(char)
      new_idx = (num + old_idx) % alphabet.length
      str[i] = alphabet[new_idx]
    end
  end
  str
end