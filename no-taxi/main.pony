actor Main
  new create(env: Env) =>
    env.out.print("Hello, world!")


class Walker
  let directions: Array[String]
  let starting: Point

  var current: Point
  var heading: Direction = North

  new create(directions': String, starting': Point) =>
    directions = parseDirections(directions')
    starting = starting'
    current = starting'
  
  fun parseDirections(dir: String): Array[String] => dir.split_by(", ")

  fun ref walkOne(dir: String): => 
    let clockwise: Bool = dir.contains("R")
    let steps: String = dir.substring(1)

    heading = findNewHeading(clockwise)
    
    

  fun walk(): =>
  """
  Walk the whole array of directions. Called by main.
  """

  fun findNewHeading(clockwise: Bool) =>
    if heading == North then
      if clockwise then
        return East
      else 
        return West

    if heading == South then
      if clockwise then
          return West
        else 
          return East

    if heading == East then
        if clockwise then
          return North
        else 
          return South

    if heading == West then
        if clockwise then
          return South
        else 
          return North

class Point
  let x: U64
  let y: U64
  new create(x': U64, y': U64) =>
    x = x'
    y = y'

primitive North
primitive South
primitive East
primitive West
type Direction is (North | South | East | West)

primitive DirectionList 
  fun tag apply(): Array[Direction] =>
    [ North, East, South, West ] // Clockwise