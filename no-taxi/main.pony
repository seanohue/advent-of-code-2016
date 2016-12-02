actor Main
  new create(env: Env) =>
    let starting: Point = Point()
    let dirs: String = "R2, L2"
    let walker: Walker = Walker(dirs, starting)
    walker.walk()
    walker.printCurrentCoords(env)

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

  fun ref walkOne(dir: String): Direction => 
    let clockwise: Bool = dir.contains("R")
    let steps: String = dir.substring(1)

    heading = findNewHeading(clockwise)

    

  fun walk(): None =>
  """
  Walk the whole array of directions. Called by main.
  """


  
  fun printCurrentCoords(env: Env): None => env.out.print("UNIMPLEMENTED;;;")


  fun findNewHeading(clockwise: Bool): Direction =>
    if heading == North then
      if clockwise then
        return East
      else 
        return West
      end
    end

    if heading == South then
      if clockwise then
          return West
        else 
          return East
      end
    end

    if heading == East then
        if clockwise then
          return North
        else 
          return South
        end
    end

    if heading == West then
        if clockwise then
          return South
        else 
          return North
        end
    end

class Point
  let x: U64
  let y: U64
  new create(x': U64, y': U64) =>
    x = x'
    y = y'
  new starting() =>
    x = 0
    y = 0

primitive North
primitive South
primitive East
primitive West
type Direction is (North | South | East | West)

primitive DirectionList 
  fun tag apply(): Array[Direction] =>
    [ North, East, South, West ] // Clockwise