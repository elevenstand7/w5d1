require "byebug"

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end

end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    self[1]
  end

  def last
    self[-2]
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    if !empty?
      curr = @head.next
      while curr.next != nil
        if curr.val != key
          curr = curr.next
        else
          return curr
        end
      end
    end
  end

  def include?(key)
    # debugger
    curr = @head.next
    while curr.next != nil
      if curr.val != key
        curr = curr.next
      else
        return true
      end
    end
    return false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    if self.empty?
      @head.next = new_node
      @tail.prev = new_node
      new_node.prev = @head
      new_node.next = @tail
    else
      @tail.prev.next = new_node
      new_node.prev = @tail.prev
      @tail.prev = new_node
      new_node.next = @tail
    end
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    # debugger
    arr = []
    curr = @head.next
    while curr.next != nil
      arr << curr.val
      curr = curr.next
    end
    arr
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
