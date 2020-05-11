require 'pry'
require 'minitest/autorun'
require_relative 'saddle_points.rb'

def lmnt(n)
  Element.new(n)
end

class RowTest < MiniTest::Test
  def row
    Row.new.tap{|r| r.elements << lmnt(1) << lmnt(2) << lmnt(2)}
  end

  def test_max_value
    assert_equal 2, row.max_value
  end

  def test_maxes
    assert_equal 2, row.maxes.count
  end
end

class ColumnTest < MiniTest::Test
  def column
    Column.new.tap{|c| c.elements << lmnt(1) << lmnt(1) << lmnt(2)}
  end

  def test_min_value
    assert_equal 1, column.min_value
  end

  def test_mins
    assert_equal 2, column.mins.count
  end
end
