actor Main
  new create(env: Env) =>
    env.out.print("Hello, world!")


class Walker
  let directions: String
  let starting: Point
  var current: Point
  new create(directions': String, starting': Point) =>
    directions = directions'
    starting = starting'
    current = starting'
    heading = North

class Point
  let x: U64
  let y: U64

primitive North
primitive South
primitive East
primitive West
type Direction is (North | South | East | West)