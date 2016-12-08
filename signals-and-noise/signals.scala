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
    println(decodeMostLikely(contents))
    println(decodeLeastLikely(contents))
  }

  def decodeMostLikely(noise:String): String = {
    return decode(noise, true)
  }

  def decodeLeastLikely(noise:String): String = {
    return decode(noise, false)
  }

  def decode(noise: String, isMostLikely: Boolean): String = {
    val signalMatrix = noise.split(EOL).map(signal => signal.trim.split("")).filter(signal => signal.length > 1)
    val transposed = signalMatrix.transpose
    return if (isMostLikely) findMostLikely(transposed) else findLeastLikely(transposed) 
  }

  def findMostLikely(transposed: Array[Array[String]]): String = { 
    return transposed.map(signal => signal.groupBy(identity).mapValues(_.size).maxBy(_._2)).map(_._1).mkString("")
  }

  def findLeastLikely(transposed: Array[Array[String]]): String = { 
    return transposed.map(signal => signal.groupBy(identity).mapValues(_.size).minBy(_._2)).map(_._1).mkString("")
  }
}