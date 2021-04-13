# This should do

class Triangle
  def initialize(first, second, third)
    @sides = [first, second, third].sort
    check_valid_input
  end

  def kind
    case @sides.uniq.size
    when 3
      'scalene'
    when 2
      'isosceles'
    when 1
      'equilateral'
    end
  end

  def check_valid_input
    raise ArgumentError if @sides.any? { |side| side <= 0 }
    raise ArgumentError if @sides[0] + @sides[1] <= @sides[2]
  end
end
