require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle'

class AboutTriangleProject < Neo::Koan
  def test_equilateral_triangles_have_equal_sides
    assert_equal triangle(3, 3, 3), triangle(2, 2, 2)
    assert_equal triangle(2, 2, 2), triangle(10, 10, 10)
  end

  def test_isosceles_triangles_have_exactly_two_sides_equal
    assert_equal triangle(2, 5, 5), triangle(3, 4, 4)
    assert_equal triangle(4, 4, 3), triangle(4, 3, 4)
    assert_equal triangle(4, 3 ,4), triangle(4, 4, 3)
    assert_equal triangle(2, 10, 10), triangle(10, 10, 2)
  end

  def test_scalene_triangles_have_no_equal_sides
    assert_equal triangle(5, 3, 4), triangle(3, 4, 5)
    assert_equal triangle(12, 10, 11), triangle(10, 11, 12)
    assert_equal triangle(2, 5 ,4), triangle(5, 4, 2)
  end
end
