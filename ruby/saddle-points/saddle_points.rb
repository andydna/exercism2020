Element = Struct.new(:value)

class Row
  attr_accessor :elements
  def initialize; @elements = Array.new; end

  def to_a
    elements.map(&:value)
  end

  def maxes
    elements.select{|lmnt|lmnt.value == max_value}
  end
  
  def max_value
    elements.max_by{|lmnt|lmnt.value}.value
  end
end

class Column
  attr_accessor :elements
  def initialize; @elements = Array.new; end

  def mins
    elements.select{|lmnt|lmnt.value == min_value}
  end

  def min_value
    elements.min_by{|lmnt|lmnt.value}.value
  end
end

class Matrix
  def initialize(string)
    @rows = string.lines.map do |line|
      line.split.each_with_object(Row.new) do |val, row|
        row.tap{|r|r.elements << Element.new(val.to_i)}
      end
    end
    @columns = @rows
  end

  def rows
    @rows.map(&:to_a)
  end

  def columns
    @columns.map(&:to_a)
#    0.upto(rows.map(&:length).max).with_object(Array.new) do |n, columns|
#      columns << rows.map{|row|row[n]}.filter{|o|o}
#    end
  end

  def saddle_points
    []
  end

end

__END__
It's called a "saddle point" because it is 
  greater than or equal to every element in its row
  less than or equal to every element in its column.
