class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count < @store.length
      if !self.include?(key)
        self[key].push(key)
        @count+=1
      end
    else
      resize!
      if !self.include?(key)
        self[key].push(key)
        @count+=1
      end
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count-=1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    inc_size = @store.length * 2
    pre = @store
    @store = Array.new(inc_size) { Array.new }

    pre.each do |el|
      el.each do |e|
      @store[e.hash%inc_size].push(e)
      end
    end

  @store
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num = (num.hash)%num_buckets
    @store[num]
  end
end
