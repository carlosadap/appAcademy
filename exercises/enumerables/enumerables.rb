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
    flat_arr = []

    self.my_each do |ele|
      debugger
      if !ele.is_a?(Array)
        flat_arr += [ele] 
      else
        ele.my_each { |arr| arr.my_flatten }
      end

    end

    flat_arr
  end
end