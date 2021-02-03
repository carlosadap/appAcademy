def duos(str)
  count = 0

  str.each_char.with_index { |char, idx| count += 1 if str[idx] == str[idx+1] }

  count
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0
puts "-----------"

def sentence_swap(stc, hash)
  words = stc.split(" ")

  new_words = words.map { |word| hash[word] ? hash[word] : word }

  new_words.join(" ")
end

p sentence_swap('anything you can do I can do',
  'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
  'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
  'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'
puts "-----------"

def hash_mapped(hash, prc_1, &prc_2)
  new_hash = {}

  hash.each { |key, value| new_hash[prc_2.call(key)] = prc_1.call(value) }

  new_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}
puts "-----------"

def counted_characters(str)
  hash = Hash.new(0)

  str.each_char { |char| hash[char] += 1 }

  new_arr = []
  hash.each { |key, val| new_arr << key if val > 2 }

  new_arr
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
puts "-----------"

def triplet_true(str)
  str.each_char.with_index { |char, idx| return true if str[idx] == str[idx+1] && str[idx] == str[idx+2] }

  false
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false
puts "-----------"

def energetic_encoding(str, hash)
  new_str = ""

  str.each_char do |char|
    if hash[char] 
      new_str += hash[char] 
    elsif char == " "
      new_str += char
    else
      new_str += "?"
    end
  end

  new_str
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
puts "-----------"

def uncompress(str)
  idx = 0
  new_str = ""

  while idx < str.length
    new_str += str[idx]*str[idx+1].to_i
    idx += 2
  end

  puts new_str
end

uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'
puts "-----------"

def conjunct_select(arr, *prcs)
  arr_of_truth = []

  arr.each do |ele|
    arr_of_truth << ele if prcs.all? { |prc| prc.call(ele) }
  end

  arr_of_truth
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]
puts "-----------"

def convert_pig_latin(stc)
  words = stc.split(" ")

  new_words = words.map do |word|
    if word.length < 3
      word
    else
      yay_word(word)
    end
  end

  new_words.join(" ").capitalize
end

def yay_word(word)
  vowels = "aeiou"
  chars = word.downcase.split("")
  
  return word + "yay" if vowels.include?(word[0].downcase)

  until vowels.include?(chars[0])
    chars << chars.shift
  end

  chars.join("") + "ay"
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
puts "-----------"

def reverberate(stc)
  words = stc.split(" ")

  new_words = words.map do |word|
    if word.length < 3
      word
    else
      rev_word(word)
    end
  end

  new_words.join(" ")
end

def rev_word(word)
  vowels = "aeiou"
  chars = word.split("")
  echo = ""
  
  return word + word.downcase if vowels.include?(word[-1])

  until vowels.include?(chars[-1])
    echo = chars.pop + echo
  end

  word + chars[-1] + echo
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
puts "-----------"

def disjunct_select(arr, *prcs)
  new_arr = []

  arr.each do |ele|
    new_arr << ele if prcs.any? { |prc| prc.call(ele) }
  end

  new_arr
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]
puts "-----------"

def alternating_vowel(stc)
  alternate = true
  words = stc.split(" ")

  new_words = words.map do |word|
    if alternate
      alternate = false
      remove_vowel(word, alternate)
    else
      alternate = true
      remove_vowel(word, alternate)
    end
  end

  new_words.join(" ")
end

def remove_vowel(word, state)
  vowels = "aeiou"
  chars = word.split("")

  if !state
    chars.each do |char|
      if vowels.include?(char)
        chars.delete(char)
        return chars.join("")
      end
    end
  else
    chars.reverse_each do |char|
      if vowels.include?(char)
        chars.delete(char)
        return chars.join
      end
    end
  end

  word #if a vowel is not found
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
puts "-----------"

def silly_talk(stc)
  words = stc.split(" ")


  new_words = words.map do |word|
      b_word(word)
  end

  new_words.join(" ")
end

def b_word(word)
  chars = word.split("")
  vowels = "aeiou"
  
  if vowels.include?(word[-1])
    return word + word[-1] 
  else
    new_chars = ""
    chars.each do |char|
      if !vowels.include?(char.downcase)
        new_chars += char
      else
        new_chars += char + "b" + char.downcase
      end
    end
  end

  new_chars
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

puts "-----------"

def compress(str)
  chars = str.split("")
  hash = Hash.new(0)

  chars.each { |char| hash[char] += 1}

  new_str = ""

  # hash.each { |key, val| new_str += key + val.to_s }

  hash.each { |key, val| val == 1 ? new_str += key : new_str += key + val.to_s }

  new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
puts "-----------"
