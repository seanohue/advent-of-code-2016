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
    splitByLine = String.split(str, "\n")
    trimmedLines = Enum.map(splitByLine, fn(line) -> String.trim(line) end)
    Enum.map(trimmedLines, fn(line) -> parseStringToTriangle(line) end)   
  end

  def parseStringToTriangle(str) do
    splitStr = Enum.filter(String.split(str, " "), fn(s) -> String.length(s) > 0 end)
    parsed = Enum.map(splitStr, fn(s) -> Integer.parse(s) end)
    Enum.map(parsed, fn({ k, _ }) -> k end )
  end

  def checkString(str) do
    list = parseStringToTriangles(str)
    checked = Enum.filter(list, fn(tri) -> isLegit(tri) end)
    length(checked)
  end

  def checkStringTransposed(str) do
    list = parseStringToTriangles(str)
    transposedList = transposeListOfTriangles(list)
    checked = Enum.filter(transposedList, fn(tri) -> isLegit(tri) end)
    length(checked)
  end

  def transposeListOfTriangles(list) do
    pickTrianglesFromTransposed(List.flatten(Transpose1.transpose(list)))
  end

  def pickTrianglesFromTransposed(list) do
    Enum.chunk(list, 3)
  end

end
