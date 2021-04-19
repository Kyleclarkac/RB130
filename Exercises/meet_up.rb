# frozen_string_literal: true

require 'date'
require 'chronic'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, number)
    day = convert_weekday(weekday)
    start_date = Date.civil(@year, @month, 1)
    end_date = Date.civil(@year, @month, -1)

    case number.downcase
    when 'teenth'
      start_date.upto(end_date) do |date|
        return date if date.wday == day && (13..19).include?(date.day)
      end
    when 'last'
      end_date.downto(start_date) { |date| return date if date.wday == day }
    else
      intended_count = convert_number(number.downcase)
      count = 0
      start_date.upto(end_date) do |date|
        count += 1 if date.wday == day
        return date if count == intended_count
      end
      nil
    end
  end

  def convert_weekday(weekday)
    case weekday.downcase
    when 'sunday'
      0
    when 'monday'
      1
    when 'tuesday'
      2
    when 'wednesday'
      3
    when 'thursday'
      4
    when 'friday'
      5
    when 'saturday'
      6
    end
  end

  def convert_number(number)
    case number
    when 'first'
      1
    when 'second'
      2
    when 'third'
      3
    when 'fourth'
      4
    when 'fifth'
      5
    when 'teenth'
    end
  end
end

meetup = Meetup.new(2021, 4)

p meetup.day('Monday', 'First')
