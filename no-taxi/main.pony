actor Main
  new create(env: Env) =>
    let starting: Point = Point(0, 0)
    let dirs: String = "L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2"
    let walker: Walker = Walker(dirs, starting, env)
    try walker.walk() end
    

class Walker
  let directions: String
  let starting: Point
  let env: Env

  var distance: Point
  var heading: Direction = North

  new create(directions': String, starting': Point, env': Env) =>
    directions = directions'
    starting = starting'
    distance = starting'
    env = env'
  
  fun ref walk(): Point ? =>
    let parsedDirections: Array[String] = parseDirections()
    env.out.print("Number of steps: " + parsedDirections.size().string())
    for step in parsedDirections.values() do
      env.out.print("This step is: " + step)
      env.out.print("Is there a next step? " + parsedDirections.values().has_next().string())
      if step.eq("") then continue else walkOne(step) end
    end
    env.out.print(printCurrentCoords())
    distance
    
  fun parseDirections(): Array[String] => directions.split(", ")

  fun ref walkOne(dir: String): Point ? => 
    env.out.print("Walking through one step. Step is... " + dir)
    let clockwise: Bool = dir.contains("R")
    var steps: String = dir.substring(1)

    env.out.print("Are we turning clockwise? " + clockwise.string())
    env.out.print("Old heading is " + heading.string())

    heading = findNewHeading(clockwise)
    env.out.print("New heading is " + heading.string())
    
    env.out.print("Old distance is " + distance.result())
    distance = changeDistanceWalked(steps)
    env.out.print("New distance... ".add(distance.result()))
    distance


  fun ref findNewHeading(clockwise: Bool): Direction =>
    env.out.print("Calculating the current heading...")
    match heading
    | North => return if clockwise then East else West end
    | South => return if clockwise then West else East end
    | East  => return if clockwise then South else North end
    | West  => return if clockwise then North else South end
    else 
      North
    end
  
  fun ref changeDistanceWalked(steps: String): Point ? => 
    env.out.print("Calculating distance walked...")
    env.out.print("Steps are (string): " + steps)
    let walked: I64 = steps.i64() 
    env.out.print("Got past the walked deal thing...")
    var x: I64 = distance.x
    var y: I64 = distance.y
    env.out.print("x is " + x.string() + " and y is " + y.string())
    env.out.print("Steps converted to: ".add(walked.string()))
    match heading
    | North => return Point(x, y + walked)
    | South => return Point(x, y - walked)
    | East  => return Point(x + walked, y) 
    | West  => return Point(x - walked, y)
    else 
      env.out.print("everything is a lie")
      return Point(distance.x, distance.y)
    end
  
  fun printCurrentCoords(): String => distance.result()
      

class Point
  let x: I64
  let y: I64
  new create(x': I64, y': I64) =>
    x = x'
    y = y'

  fun result(): String => x.string().add(", ").add(y.string())

primitive North fun string(): String => "N"
primitive South fun string(): String => "S"
primitive East  fun string(): String => "E"
primitive West  fun string(): String => "W"
type Direction is (North | South | East | West)