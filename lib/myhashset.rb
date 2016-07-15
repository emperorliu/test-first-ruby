class MyHashSet
  attr_accessor :store

  def initialize
    @store = {}
  end

  def insert(el)
    store[el] = true
  end

  def include?(el)
    store.keys.include?(el)
  end

  def delete(el)
    store.delete(el) ? true : false
  end

  def to_a
    store.keys
  end

  def union(set2)
    union = MyHashSet.new
    self.to_a.each { |key| union.insert(key) }
    set2.to_a.each { |key| union.insert(key) }
    union
  end

  def intersect(set2)
    intersect = MyHashSet.new
    self.to_a.each { |key| intersect.insert(key) if set2.include?(key) }
    intersect
  end

  def minus(set2)
    minus = MyHashSet.new
    self.to_a.each { |key| minus.insert(key) if !set2.include?(key) }
    minus
  end

  def symmetric_difference(set2)
    symmetric = MyHashSet.new
    self.to_a.each { |key| symmetric.insert(key) }
    set2.to_a.each { |key| symmetric.insert(key) }
    symmetric.minus(self.intersect(set2))
    symmetric
  end

  def ==(object)
    if object.is_a?(MyHashSet) && self.to_a.size == object.to_a.size && self.to_a.sort == object.to_a.sort
      true
    else
      false
    end  
  end
end
