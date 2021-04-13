
class Diamond

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    size = size(letter)
    count = 1
    space_count = 1
    string = "A".center(size) + "\n"
    full = false
    loop do
      string += ((65 + count).chr + ' ' * space_count + (65 + count).chr).center(size) + "\n"
      full = true if count > size / 2 - 1
      if !full
        count +=1
        space_count += 2
      else
        count -= 1
        space_count -= 2
      end
      break if count == 0
    end
    string += "A".center(size) + "\n"
  end

  def self.size(letter)
    (letter.ord - 65) * 2 + 1
  end

end

puts Diamond.make_diamond('C')


