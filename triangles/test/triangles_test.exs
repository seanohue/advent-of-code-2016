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

  test "should be able to find out how many triangles are legit in a big list string" do
    triangleStr = "5 10 25
    5 10 12"
    assert Triangles.checkString(triangleStr) == 1
  end

  test "should be able to read string of triangles by column as well" do
    triangleStr = "  566  477  376
  575  488  365
   50   18  156"

    assert Triangles.checkStringTransposed(triangleStr) == 3
  end

end
