class PageRankUtils extends Serializable {
  def computeWithCombiner(numVertices: Long, epsilon: Double, iter: Int)(
    self: PRVertex, messageSum: Option[Double], superstep: Int
  ): (PRVertex, Array[PRMessage]) = {
    val newValue = messageSum match {
      case Some(msgSum) if msgSum != 0 =>
        0.15 / numVertices + 0.85 * msgSum
      case _ => self.value
    }

    val terminate = superstep >= iter

    val outbox: Array[PRMessage] =
      if (!terminate)
        self.outEdges.map(targetId =>
          new PRMessage(targetId, newValue / self.outEdges.size))
      else
        Array[PRMessage]()

    (new PRVertex(newValue, self.outEdges, !terminate), outbox)
  }
}

class PRCombiner extends Combiner[PRMessage, Double] with Serializable {
  def createCombiner(msg: PRMessage): Double =
    msg.value
  def mergeMsg(combiner: Double, msg: PRMessage): Double =
    combiner + msg.value
  def mergeCombiners(a: Double, b: Double): Double =
    a + b
}

class PRVertex() extends Vertex with Serializable {
  var value: Double = _
  var outEdges: Array[String] = _
  var active: Boolean = _
}
