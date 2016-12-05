defmodule Triangles do
  require Transpose1
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
    splitStr = Enum.filter(String.split(str, " "), fn(s) -> String.length(s) > 0 end)
    parsed = Enum.map(splitStr, &Integer.parse/1)
    Enum.map(parsed, fn({ k, _ }) -> k end )
  end

  @spec checkString(String.t) :: integer
  def checkString(str) do
    list = parseStringToTriangles(str)
    checked = Enum.filter(list, &(isLegit(&1)))
    length(checked)
  end

  @spec checkStringTransposed(String.t) :: integer
  def checkStringTransposed(str) do
    list = parseStringToTriangles(str)
    transposedList = transposeListOfTriangles(list)
    checked = Enum.filter(transposedList, &(isLegit(&1)))
    length(checked)
  end

  @spec transposeListOfTriangles(list(triangle)) :: list(triangle)
  def transposeListOfTriangles(list) do
    list
    |> Transpose1.transpose
    |> List.flatten
    |> pickTrianglesFromTransposed
  end

  @spec pickTrianglesFromTransposed(list(any)) :: list(triangle)
  def pickTrianglesFromTransposed(list) do
    Enum.chunk(list, 3)
  end

end
