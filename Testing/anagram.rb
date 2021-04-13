class Anagram
  def initialize(word)
    @word = word
    @sorted_chars = word.downcase.split('').sort
  end

  def match(array)
    matches = []
    array.each do |new_word|
      if new_word.downcase.split('').sort == @sorted_chars && @word.downcase != new_word.downcase
        matches << new_word
      end
    end
    matches
  end
end

l = Anagram.new('molp')
p l.match(['lomp'])
