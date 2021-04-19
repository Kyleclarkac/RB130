class PerfectNumber
  attr_accessor :alequat_sum, :num

  def initialize(num)
    @num = num if valid?(num)
    @divisors = find_divisors(num)
    @alequat_sum = @divisors.sum
  end

  def self.classify(num)
    number = PerfectNumber.new(num)
    case
    when number.alequat_sum == number.num
      'perfect'
    when number.alequat_sum < number.num
      'deficient'
    when number.alequat_sum > number.num
      'abundant'
    end
  end

  def valid?(num)
    raise StandardError unless num.kind_of?(Integer) && num > 0
    num
  end

  def find_divisors(num)
    divisors = [1]
    count = 2
    while count <= num / 2
      divisors << count if num % count == 0
      count += 1
    end
    divisors
  end
end

puts PerfectNumber.classify(6)