actor Main
  new create(env: Env) =>
    env.out.print("Hello, world!")


class Walker
  let directions: Array[String]
  let starting: Point
  let parsedDirections: 

  var current: Point
  var heading: Direction = North

  new create(directions': String, starting': Point) =>
    directions = parseDirections(directions')
    starting = starting'
    current = starting'
  
  fun ref parseDirections(dir: String): Array[String] => dir.split_by(", ")



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