require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'
Minitest::Reporters.use!
SimpleCov.start

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@list.size, 3)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todos.slice(1..-1), @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_typeError
    assert_raises(TypeError) do 
      @list << 5
    end
  end

  def test_shovel
    @list << @todo1
    assert_equal(@list.to_a[-1], @todo1)
  end

  def test_add
    @list.add(@todo1)
    assert_equal(@list.to_a[-1], @todo1)
  end

  def test_item_at
    assert_equal(@todos[1], @list.item_at(1))
    assert_raises(IndexError) {@list.item_at(12)}
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert(@list.to_a[1].done?)
    assert_raises(IndexError) {@list.item_at(12)}
  end

  def test_mark_undone_at
    @list.mark_undone_at(1)
    assert(!@list.to_a[1].done?)
    assert_raises(IndexError) {@list.item_at(12)}
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError){@list.remove_at(100)}
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each {|todo| result << todo.done?}
    assert_equal([false, false, false], result)
  end

  def test_each_return
    assert_equal(@list, @list.each{})
  end

  def test_select
    assert_equal(@todos, @list.select{|todo| !todo.done?}.to_a)
  end






  # Your tests go here. Remember they must start with "test_"

end