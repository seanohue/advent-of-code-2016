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
  
end
