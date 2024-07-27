module Enumerable
  def my_all?
    all = true
    self.each do |element|
      unless yield(element)
        all = false
        break
      end
    end
    all
  end

  def my_any?
    any = false
    self.each do |element|
      if yield(element)
        any = true
        break
      end
    end
    any
  end

  def my_count
    if block_given?
      count = 0
      self.each do |value|
        if yield(value)
          count += 1
        end
      end
      count
    else
      self.size
    end
  end

  def my_each_with_index
    length = self.length
    i = 0
    while i < length
      yield(self[i],i)
      i += 1
    end
    self
  end

  def my_inject(initial_value = self[0])
    sum = initial_value
    self.each do |element|
      sum = yield(sum,element)
    end
    sum
  end


  def my_map(&block)
    new_enum = []
    self.each do |element|
      new_enum << yield(element)
    end
    new_enum
  end

  def my_none?
    none = true
    self.each do |element|
      if yield(element)
        none = false
        break
      end
    end
    none
  end

  def my_select
    selected = []
    self.each do |element|
      if yield(element)
        selected << element
      end
    end
    selected
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    length = self.length
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end
end

p [1,2,3].my_inject {|sum,s| sum + s}
