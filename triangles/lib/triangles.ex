defmodule Triangles do
  @type triangle :: list(number)

  @spec isLegit(triangle) :: boolean
  def isLegit(tri) do
    sorted = Enum.sort(tri)
    largest = List.last(sorted)
    largest < (Enum.sum(sorted) - largest)
  end

end
