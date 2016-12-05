defmodule Triangles do
  import Transpose1, only: [transpose: 1]
  @type triangle :: list(number)

  @spec isLegit(triangle) :: boolean
  def isLegit(tri) do
    largest = tri 
      |> Enum.sort 
      |> List.last
    largest < (Enum.sum(tri) - largest)
  end

  @spec parseStringToTriangles(String.t) :: list(triangle)
  def parseStringToTriangles(str) do
    str 
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&(parseStringToTriangle(&1)))   
  end

  @spec parseStringToTriangle(String.t) :: triangle
  def parseStringToTriangle(str) do
    str
    |> String.split(" ")
    |> Enum.filter(fn(s) -> String.length(s) > 0 end)
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn({ k, _ }) -> k end )
  end

  @spec checkString(String.t) :: integer
  def checkString(str) do
    str
    |> parseStringToTriangles
    |> Enum.filter(&(isLegit(&1)))
    |> length
  end

  @spec checkStringTransposed(String.t) :: integer
  def checkStringTransposed(str) do
    str 
    |> parseStringToTriangles
    |> transposeListOfTriangles
    |> Enum.filter(&(isLegit(&1)))
    |> length
  end

  @spec transposeListOfTriangles(list(triangle)) :: list(triangle)
  def transposeListOfTriangles(list) do
    list
    |> transpose
    |> List.flatten
    |> pickTrianglesFromTransposed
  end

  @spec pickTrianglesFromTransposed(list(any)) :: list(triangle)
  def pickTrianglesFromTransposed(list) do
    Enum.chunk(list, 3)
  end

end
