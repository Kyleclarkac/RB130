class Octal
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 unless num.split('').all? {|number| '01234567'.include?(number)}
    digits = num.split('').map { |digit| digit.to_i}
    power = 0
    octal = 0
    until digits.empty?
      octal += 8**power * digits.pop
      power += 1
    end
    octal
  end
end


