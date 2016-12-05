defmodule Triangles do
  @type triangle :: [number, number, number]

  @spec isLegit(triangle) :: boolean
  def isLegit(tri) do
    sorted = Enum.sort(tri)
    largest = List.last(sorted)
    largest < (Enum.sum(sorted) - last)
  end

end

