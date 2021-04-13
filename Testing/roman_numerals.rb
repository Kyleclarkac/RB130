
class RomanNumeral

  def initialize(number)
    @number = number
  end

  def to_roman
    result = ''
    chars = @number.to_s.split('').reverse.map { |num| num.to_i }
    chars.each.with_index do |char, index|
      case index
      when 0
        case
        when char < 4
          result.prepend('I' * char)
        when char == 4
          result.prepend('IV')
        when char == 5
          result.prepend('V')
        when char == 9
          result.prepend('IX')
        else
          result.prepend('V' + 'I' * (char - 5))
        end
      when 1
        case
        when char < 4
          result.prepend('X' * char)
        when char == 4
          result.prepend('XL')
        when char == 5
          result.prepend('L')
        when char == 9
          result.prepend('XC')
        else
          result.prepend('L' + 'X' * (char - 5))
        end
  
      when 2
        case
        when char < 4
          result.prepend('C' * char)
        when char == 4
          result.prepend('CD')
        when char == 5
          result.prepend('D')
        when char == 9
          result.prepend('CM')
        else
          result.prepend('D' + 'C' * (char - 5))
        end
      when 3
        case
        when char < 4
          result.prepend('M' * char)
        end
      end
    end
    result
  end
end

c = RomanNumeral.new(27)
p c.to_roman