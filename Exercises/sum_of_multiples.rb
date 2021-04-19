class SumOfMultiples

  def self.to(max)
    SumOfMultiples.new.to(max)
  end

  def to(max)
    count = 1
    sum = 0
    while count < max
      sum += count if @set.any? { |number| count % number == 0 }
      count += 1
    end
    sum
  end

  def initialize(default = [3, 5], *set)
    @set = Array(default) + set
  end
end


