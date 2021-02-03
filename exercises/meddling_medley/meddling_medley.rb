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



puts "-----------"
puts "-----------"
