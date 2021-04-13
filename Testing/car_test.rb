require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_car_exists
    assert(@car)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize
    assert_raises(ArgumentError) do
      Car.new(name: 'Joey')
    end
  end
end
