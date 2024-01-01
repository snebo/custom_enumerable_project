module Enumerable
  # Your code goes here
  def my_count
    return self.length unless block_given?
    cnt = 0
    for i in self
      if yield(i)
        cnt += 1
      end
    end
    cnt
  end

  def my_each_with_index
    for i in 0..self.length-1 do
      yield self[i], i
    end
    self
  end

  def my_any?(&blk)
    my_each { |item| return true if blk.call(item) }
    false
  end

  def my_all?
    if block_given?
      my_each { |item| return false unless yield item }
    end
    true
  end

  def my_none?
    if block_given?
      my_each { |item| return false if yield item }
    else
      for item in self
        return false if item
      end
    end
    true
  end

  def my_select
    rtn = []
    my_each {|item| rtn.push(item) if yield item}
    rtn
  end

  def my_inject(ini_val = 0)
    if block_given?
      for item in self
        ini_val = yield ini_val, item
      end
      ini_val
    end
  end

  def my_map
    val = []
    my_each {|item| val.push(yield item)}
    val
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end
