=begin
from current move find any valid move.
  -If there are no valid moves and the board is not full backtrack
  -The move is valid if it is on the board, has not been visited, 
  and does not eliminate all possibilities for a future move. 

after each move calculate possible moves starting at the end to mirror current moves
  -If the possibilties list for any move is empty, backtrack. 

=end

class Space
  attr_accessor :x, :y, :move

  def initialize(x, y)
    @x = x 
    @y = y
    @move = nil
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def to_s
    "This space has coordinates #{x}, #{y}"
  end

  def empty?
    move == nil
  end
end

class Board
  attr_accessor :unused_spaces, :used_spaces, :current, :move

  def initialize
    @unused_spaces = []
    (1..8).each do |x|
      (1..8).each do |y|
        @unused_spaces << Space.new(x,y)
      end
    end
    @used_spaces = [unused_spaces.shift]
    @current = unused_spaces[0]
    @move = 1
    current.move = 1
  end

  def to_s
    spaces.to_s
  end

  def possible_moves
    possibilities = []
    unused_spaces.each do |space|
      possibilities << space if current.x + 1 == space.x && current.y + 2 == space.y
      possibilities << space if current.x + 1 == space.x && current.y - 2 == space.y
      possibilities << space if current.x - 1 == space.x && current.y + 2 == space.y
      possibilities << space if current.x - 1 == space.x && current.y - 2 == space.y
      possibilities << space if current.x + 2 == space.x && current.y + 1 == space.y
      possibilities << space if current.x + 2 == space.x && current.y - 1 == space.y
      possibilities << space if current.x - 2 == space.x && current.y + 1 == space.y
      possibilities << space if current.x - 2 == space.x && current.y - 1 == space.y
    end
    possibilities
  end

  def make_move
  end

end

class move
  attr_accessor :choice, :remaining_options, :number
  


board = Board.new

puts board.used_spaces

puts board.current

board.make_move

puts board.used_spaces

