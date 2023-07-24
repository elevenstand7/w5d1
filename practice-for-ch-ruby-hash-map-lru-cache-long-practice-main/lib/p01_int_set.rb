require "byebug"

class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = []
    (0...max).each do |i|
      @store[i]= false
    end
    raise " cannot modify the length" if @store.length != max
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    return true if num < @store.length and num >= 0
    false
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }

  end

  def insert(num)
    # debugger
    # @store[num%num_buckets].push(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num = num%num_buckets
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count < @store.length
      if !self[num].include?(num)
        self[num].push(num)
        @count += 1
      end
    else
      resize!

      if !self[num].include?(num)
        self[num].push(num)
        @count += 1
      end
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    inc_size = @store.length * 2
    pre = @store
    @store = Array.new(inc_size) { Array.new }

    pre.each do |el|
      el.each do |e|
      @store[e%inc_size].push(e)
      end
    end

  @store
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num = num%num_buckets
    @store[num]
  end
end
