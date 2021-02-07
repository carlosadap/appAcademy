require 'byebug'

class Array
  def my_each(&prc)
    idx = 0

    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end

    self
  end

  def my_select(&prc)
    new_arr = []

    self.my_each { |ele| new_arr << ele if prc.call(ele) }

    new_arr
  end

  def my_reject(&prc)
    new_arr = []

    self.my_each { |ele| new_arr << ele if !prc.call(ele) }

    new_arr
  end

  def my_any?(&prc)
    self.my_each { |ele| return true if prc.call(ele) }

    false
  end

  def my_all?(&prc)
    self.my_each { |ele| return false if !prc.call(ele) }

    true
  end

  def my_flatten
    return [self] if !self.is_a?(Array)

    flat_arr = []

    self.my_each do |ele|
      # debugger
      if ele.is_a?(Array)
        flat_arr += ele.my_flatten
      else
        flat_arr += [ele] 
      end

    end
    flat_arr

  end

  def my_zip(*args)
    new_arr = []

    (0...self.length).each do |idx_1|
      new_arr << [self[idx_1]]
      (0...args.length).each do |idx_2|
        new_arr[idx_1] << args[idx_2][idx_1]
      end
    end

    new_arr
  end

  def my_rotate(n = 1)
    new_arr = self

    if n > 0
      n.times do 
        first_element = new_arr.shift
        new_arr.push(first_element)
      end
    else
      n = -n
      n.times do 
        last_element = new_arr.pop
        new_arr.unshift(last_element)
      end
    end

    new_arr
  end

  def my_join(separator = "")
    new_str = ""
    
    self.each { |char| new_str += char + separator}

    new_str.slice!(-1) if separator != "" 

    new_str
  end

  def my_reverse
    new_arr = []

    self.reverse_each { |ele| new_arr << ele }

    new_arr
  end
end