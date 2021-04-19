class BeerSong
  def self.verses(start, finish)
    song = ""
    (finish..start).to_a.reverse.each do |verse|
      if verse == 0 
        song += "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      elsif verse == 1
        song += "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n" \
        "\n"
      else
        song +=  "#{verse} bottles of beer on the wall, #{verse} bottles of beer.\n" \
        "Take one down and pass it around, #{verse - 1} bottles of beer on the wall.\n" \
        "\n"
      end
    end
    song
  end

  def self.verse(bottles)
    song = ""
      if bottles == 0 
        song += "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      elsif bottles == 1
        song += "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n" \
        "\n"
      else
        song +=  "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
        "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n" \
        "\n"
      end
    song
  end

  def self.lyrics
    verses(99, 0)
  end
end
