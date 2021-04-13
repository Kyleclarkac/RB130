class Clock
  attr_accessor :hour, :minute

  def initialize(hour = 0, minute = 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    string_hour = @hour < 10 ? "0#{@hour}" : @hour.to_s
    string_minute = @minute < 10 ? "0#{@minute}" : @minute.to_s
    string_hour + ':' + string_minute
  end

  def +(minutes)
    @minute += minutes
    while @minute > 59
      @hour += 1
      @minute -= 60
    end
    @hour = @hour % 24
    self
  end

  def -(negative_minutes)
    @minute -= negative_minutes
    while @minute.negative?
      @hour -= 1
      @minute += 60
    end
    self.hour += 24 while hour.negative?
    self
  end

  def self.at(hour = 0, minute = 0)
    new(hour, minute)
  end

  def ==(other)
    minute == other.minute && hour == other.hour
  end
end

clock = Clock.at(10)
new_clock = Clock.at(8, 10)

puts new_clock.class
puts new_clock

puts (clock - new_clock)
