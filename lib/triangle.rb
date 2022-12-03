class Triangle
  attr_reader :kind
 
  def initialize(side_1, side_2, side_3)
    
    sides = [side_1, side_2, side_3].sort

    if sides.find {|side| side <= 0}
      raise TriangleError
    elsif sides[0] + sides[1] <= sides[2]
      raise TriangleError
    elsif sides.uniq.length == 1
      @kind = :equilateral
    elsif sides.uniq.length == 2
      @kind = :isosceles
    elsif sides.uniq.length == 3
      @kind = :scalene
    end
  end

  def kind
    @kind
  end

  class TriangleError < StandardError
    def message
      "Not a valid triange"
    end
  end
end
