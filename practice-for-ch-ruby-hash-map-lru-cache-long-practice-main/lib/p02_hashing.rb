class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    # pair the index and the element, then convert
    # them into a string then to an integer
    hs = []
    return 0.hash if self.empty?
    (0...self.length).each do |i|
      hs<<i
      hs<<self[i]
    end
    hs.join('').to_i.hash
  end
end

class String
  def hash
    str_arr = self.split('')
    hs = []
    ans=''
    (0...self.length).each do |i|
      hs << i.to_s + self[i]
    end

    hs.join('').to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end


hs = []
s=["a","b","c"]
(0...s.length).each do |i|
  hs << i.to_s + s[i]
end
p hs
