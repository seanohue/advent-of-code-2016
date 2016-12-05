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
    splitStr = Enum.filter(String.split(str, " "), fn(s) -> String.length(s) > 0 end)
    parsed = Enum.map(splitStr, fn(s) -> Integer.parse(s) end)
    Enum.map(parsed, fn({ k, _ }) -> k end )
  end



  def checkString(str) do
    list = parseStringToTriangles(str)
    checked = Enum.filter(list, fn(tri) -> isLegit(tri) end)
    length(checked)
  end

end
