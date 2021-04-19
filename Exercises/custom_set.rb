class CustomSet
  attr_accessor :set

  def initialize(arr = [])
    @set = arr.uniq
  end

  def contains?(num)
    set.include?(num)
  end

  def empty?
    set.empty?
  end

  def subset?(other)
    set.all? { |ele| other.set.include?(ele) }
  end

  def disjoint?(other)
    !set.any? { |ele| other.set.include?(ele) }
  end

  def eql?(other)
    set.sort == other.set.sort
  end

  def ==(other)
    set.sort == other.set.sort
  end

  def add(num)
    set << num unless set.include?(num)
    self
  end

  def intersection(other)
    new_set = CustomSet.new
    other.set.each { |ele| new_set.add(ele) if set.include?(ele) }
    new_set
  end

  def difference(other)
    new_set = CustomSet.new
    set.each { |ele| new_set.add(ele) unless other.set.include?(ele) }
    new_set
  end

  def union(other)
    self.set = (set + other.set).uniq
    self
  end

end

