# frozen_string_literal: true

# I've changed some things!

# Space class to define space attributes.
class Space
  include Comparable
  attr_accessor :x, :y, :move, :possibilities

  def initialize(x_coord, y_coord)
    @x = x_coord
    @y = y_coord
    @move = nil
    @possibilities = nil
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def to_s
    "X:#{x}, Y:#{y}, Move:#{move}"
  end

  def empty?
    move.nil?
  end
end

# This board class will do all the heavy lifting.
class Board
  attr_accessor :spaces, :moves

  def initialize
    @moves = nil
    @spaces = []
    (1..8).each do |x|
      (1..8).each do |y|
        spaces << Space.new(x, y)
      end
    end
  end

  def legal_moves_from(current_space)
    # finds the legal moves from a specific space.
    x1 = current_space.x
    y1 = current_space.y
    spaces.select do |space|
      x1 != space.x &&
        y1 != space.y &&
        [1, 3].include?(((x1 + y1) - (space.x + space.y)).abs) &&
        space.empty?
    end
  end

  def next_move(moves)
    # picks the next move to add
    moves << moves[-1].possibilities.shift
    moves[-1].move = moves[-2].move + 1
    generate_possibilities_from(moves[-1])
  end

  def generate_possibilities_from(space)
    # creates a list of possible moves from a space.
    space.possibilities = legal_moves_from(space).sort_by { |possible| legal_moves_from(possible).size }
  end

  def make_guesses
    while moves.size < 64
      while moves[-1].possibilities.empty?
        moves[-1].move = nil
        moves.delete_at(-1)
      end
      next_move(moves)
    end
  end

  def find_tour_from(x_coord, y_coord)
    # finds a tour from starting x and y coordinates.
    self.moves = spaces.select { |space| space.x == x_coord && space.y == y_coord }
    moves[0].move = 1
    generate_possibilities_from(moves[0])
    make_guesses
    puts moves
    initialize
  end
end

board = Board.new
board.find_tour_from(1, 1)
