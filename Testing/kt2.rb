
class Move
  attr_accessor :choice, :possibilities, :number

  def initialize(number)
    @choice = nil
    @possibilities = []
    @number = number
  end

  def to_s
    "Choice: #{choice}, number#{@number}"
  end
end

class Space
  include Comparable
  attr_accessor :x, :y, :move, :freedom

  def initialize(x, y)
    @x = x 
    @y = y
    @move = nil
    @freedom = nil
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def to_s
    "X:#{x}, Y:#{y}"
  end

  def empty?
    move.nil?
  end

  def <=>(other)
    freedom <=> other.freedom
  end

end

class Board
  attr_accessor :spaces

  def initialize
    @spaces = []
    (1..8).each do |x|
      (1..8).each do |y|
        spaces << Space.new(x,y)
      end
    end
  end

  def to_s
    spaces.to_s
  end

  def legal_moves_from(current_space)
    possibilities = []
    spaces.each do |space|
      possibilities << space if current_space.x + 1 == space.x && current_space.y + 2 == space.y && space.empty?
      possibilities << space if current_space.x + 1 == space.x && current_space.y - 2 == space.y && space.empty?
      possibilities << space if current_space.x - 1 == space.x && current_space.y + 2 == space.y && space.empty?
      possibilities << space if current_space.x - 1 == space.x && current_space.y - 2 == space.y && space.empty?
      possibilities << space if current_space.x + 2 == space.x && current_space.y + 1 == space.y && space.empty?
      possibilities << space if current_space.x + 2 == space.x && current_space.y - 1 == space.y && space.empty?
      possibilities << space if current_space.x - 2 == space.x && current_space.y + 1 == space.y && space.empty?
      possibilities << space if current_space.x - 2 == space.x && current_space.y - 1 == space.y && space.empty?
    end
    possibilities
  end

end

def possibilities_from(board, move, homes)
  possibilities = board.legal_moves_from(move.choice)
  possibilities.each do |space|
    possibilities.delete(space) unless route_home(board, space, homes) #&& all_accessable(board, space, homes)
  end
  possibilities.each { |space| space.freedom = board.legal_moves_from(space).size}
  possibilities.sort_by {|space| space.freedom}
end

def all_accessable(board, space, homes)
  remaing = []
  board.spaces.each {|space| remaing << space if space.move == nil}

  accessable = board.legal_moves_from(space)
  return true if remaing.all?{|space| accessable.include?(space)}
  
  previous = accessable.size
  
  loop do 
    accessable.each do |new_space|
      accessable += board.legal_moves_from(new_space)
      accessable.uniq!
      return true if remaing.all?{|home| accessable.include?(home)}
    end
    break if previous == accessable.size
      previous = accessable.size
  end
  false
end

def route_home(board, space, homes)
  accessable = board.legal_moves_from(space)
  return true if homes.any?{|space| accessable.include?(space)}
  
  previous = accessable.size
  
  loop do 
    accessable.each do |new_space|
      accessable += board.legal_moves_from(new_space)
      accessable.uniq!
      return true if homes.any?{|home| accessable.include?(home)}
    end
    break if previous == accessable.size
      previous = accessable.size
  end
  false
end

def make_choice(move)
  move.choice.move = nil if move.choice
  move.choice = move.possibilities.shift
  move.choice.move = move
end

board = Board.new
first_move = Move.new(1)
first_move.choice = Space.new(5,5)

homes = board.legal_moves_from(first_move.choice)

moves = [first_move]

puts "here we go!"

greatest = 0

while moves.size < 64 do 
  moves << Move.new(moves[-1].number + 1)
  moves[-1].possibilities = possibilities_from(board, moves[-2], homes)
  while moves[-1].possibilities.empty? do
    moves[-1].choice.move = nil if moves[-1].choice
    moves.delete_at(-1)
  end
  make_choice(moves[-1])
  greatest = moves.size if moves.size > greatest
  puts greatest
 
end 

puts moves