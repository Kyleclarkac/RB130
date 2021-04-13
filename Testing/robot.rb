class Robot
  attr_accessor :name
  @@used_names = []

  def initialize
    @name = gen_name
  end

  def gen_name
    letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    name = ''
    loop do 
      2.times {name += letters[rand(25)]}
      3.times { name += rand(0..9).to_s}
      break if !@@used_names.include?(name)
    end
    @@used_names << name
    name
  end

  def reset
    self.name =gen_name
  end

end

carl = Robot.new
puts carl.name