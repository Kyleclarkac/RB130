class DNA
  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def hamming_distance(other)
    count = 0 
    distance = 0
    while count < @string.size && count < other.size do
      distance += 1 unless string[count] == other[count]
      count += 1
    end
    distance
  end
end
