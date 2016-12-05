defmodule Triangles do
  @type triangle :: list(number)

  @spec isLegit(triangle) :: boolean
  def isLegit(tri) do
    sorted = Enum.sort(tri)
    largest = List.last(sorted)
    largest < (Enum.sum(sorted) - largest)
  end

  @spec parseStringToTriangles(String.t) :: list(triangle)
  def parseStringToTriangles(str) do
    splitByLine = String.split(str, "\n")
    trimmedLines = Enum.map(splitByLine, fn(line) -> String.trim(line) end)
    Enum.map(trimmedLines, fn(line) -> parseStringToTriangle(line) end)   
  end

  def parseStringToTriangle(str) do
    splitStr = String.split(str, " ")
    parsed = Enum.map(splitStr, fn(s) -> Integer.parse(s) end)
    Enum.map(parsed, fn({ k, v }) -> k end)
  end

end
