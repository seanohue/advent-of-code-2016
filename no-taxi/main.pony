actor Main
  new create(env: Env) =>
    let starting: Point = Point(0, 0)
    let dirs: String = "L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2"
    let walker: Walker = Walker(dirs, starting)
    walker.walk()
    env.out.print(walker.printCurrentCoords())

class Walker
  let directions: String
  let starting: Point

  var current: Point
  var heading: Direction = North

  new create(directions': String, starting': Point) =>
    directions = directions'
    starting = starting'
    current = starting'
  
  fun parseDirections(): Array[String] => directions.split(", ")

  fun ref walkOne(dir: String): Direction => 
    let clockwise: Bool = dir.contains("R")
    let steps: String = dir.substring(1)

    heading = findNewHeading(clockwise)

  fun walk(): String => "lol"
  """
  Walk the whole array of directions. Called by main.
  """


  
  fun printCurrentCoords(): String => "UNIMPLEMENTED;;;"


  fun findNewHeading(clockwise: Bool): Direction =>

    match heading
    | North => return if clockwise then East else West end
    | South => return if clockwise then West else East end
    | East  => return if clockwise then South else North end
    | West  => return if clockwise then North else South end
    else 
      North
    end
      

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