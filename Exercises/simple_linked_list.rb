class Element
  attr_accessor :datum

  def initialize(datum, next_ele = nil)
    @datum = datum
    @following = next_ele
  end

  def tail?
    @following.nil?
  end

  def next
    @following
  end
end

class SimpleLinkedList

  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(datum)
    @list << Element.new(datum, @list[-1])
  end

  def peek
    @list[-1].datum unless @list[-1].nil?
  end

  def head
    @list[-1]
  end

  def pop
    @list.pop.datum
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    array.reverse.each { |ele| new_list.push(ele)} if array.kind_of?(Array)
    new_list
  end

  def to_a
    @list.map { |ele| ele.datum}.reverse
  end

  def reverse
    array = @list.map { |ele| ele.datum}.reverse
    @list = []
    array.each { |ele| push(ele)}
    self
  end

end