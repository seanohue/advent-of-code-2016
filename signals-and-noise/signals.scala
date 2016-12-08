import scala.compat.Platform.EOL
import scala.io.Source


object SignalDecoder {
 
  def main(args: Array[String]): Unit = {
    val filename = "signal_input.txt"
    var contents = ""
    
    for (line <- Source.fromFile(filename).getLines) {
      contents = contents ++ EOL ++ line
    }

    println("DECODED")
    println(decode(contents))
  }

  def decode(noise: String): String = { 
    val signalMatrix = noise.split(EOL).map(signal => signal.trim.split("")).filter(signal => signal.length > 1)
    val transposed = signalMatrix.transpose
    val decoded = transposed.map(signal => signal.groupBy(identity).mapValues(_.size).maxBy(_._2)).map(_._1).mkString("")
    return decoded
  }
}