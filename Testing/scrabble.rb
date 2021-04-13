
class Scrabble
  POINT_VALUES = {
    1 => 'AEIOULNRST',
    2 => 'DG',
    3 => 'BCMP',
    4 => 'FHVWY',
    5 => 'K',
    8 => 'JX',
    10 => 'QZ'
  }

  def self.score(string)
    Scrabble.new(string).score
  end

  def initialize(word)
    @word = word.class == String ? word : ""
  end

  def score
    tally(@word)
  end

  def tally(string)
    total = 0 
    string.each_char do |char|
      POINT_VALUES.each do |key, value|
        if value.include? (char.upcase)
          total += key
        end
      end
    end
    total
  end

end