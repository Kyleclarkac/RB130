class Player
  attr_accessor :name, :health

  def initialize(name, initial_health = 50)
    @name = name.capitalize
    @health = initial_health
  end

  def to_s
    if health > 0
      "I'm #{name} with health = #{health}."
    else
      "I was #{name}, now I am dead :(."
    end
  end

  def boost
    raise NoMethodError if dead?
    self.health += 20
  end

  def hurt
    raise NoMethodError if dead?
    self.health -= 10
  end

  def dead?
    health < 0
  end
end
