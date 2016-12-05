defmodule TrianglesTest do
  use ExUnit.Case
  doctest Triangles

  test "checking good triangles" do
    goodTriangle = [5, 10, 12]
    assert Triangles.isLegit(goodTriangle)
  end

  test "checking bad triangles" do
    badTriangle = [5, 10, 25]
    assert not Triangles.isLegit(badTriangle)
  end

  test "parsing string into triangles" do
    triangleStr = "5 10 25
    5 10 12"
    expected = [[5, 10, 25], [5, 10, 12]]
    assert Triangles.parseStringToTriangles(triangleStr) == expected
  end
  
  test "parse string of single triangle to triangle" do
    triangleStr = "5 10 25"
    expected = [5, 10, 25]
    assert Triangles.parseStringToTriangle(triangleStr) == expected
  end
  
end
