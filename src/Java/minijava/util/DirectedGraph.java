package minijava.util;

import java.io.PrintStream;
import java.util.*;

public class DirectedGraph<Node> {

  private final Set<Node> nodes;
  private Map<Node, Set<Node>> successors;
  // invariant: any node in {@code nodes} is mapped by {@code successors} to a non-null set.

  /**
   * Constructs a new empty graph
   */
  public DirectedGraph() {
    this.nodes = new HashSet<>();
    this.successors = new HashMap<>();
  }

  /**
   * Returns the unmodifiable set of nodes in the graph.
   */
  public Set<Node> nodeSet() {
    return Collections.unmodifiableSet(nodes);
  }

  /**
   * Returns the unmodifiable set of successors of a node.
   * Only guaranteed to work correctly for nodes that are in the graph.
   */
  public Set<Node> successors(Node n) {
    Set<Node> s = successors.get(n);
    if (s == null) {
      return Collections.emptySet();
    } else {
      return Collections.unmodifiableSet(s);
    }
  }

  /**
   * Adds a node to the graph.
   * Assumes that the node is not in the graph already.
   */
  public void addNode(Node n) {
    nodes.add(n);
    successors.put(n, new HashSet<>());
  }

  /**
   * Removes a node from the graph.
   * Assumes that the node is actually in the graph already.
   */
  public void removeNode(Node n) {
    nodes.remove(n);
    successors.remove(n);
    for (Node m : nodes) {
      successors.get(m).remove(n);
    }
  }

  /**
   * Adds an edge to the graph.
   * Assumes that both nodes are actually in the graph.
   */
  public void addEdge(Node src, Node dst) {
    successors.get(src).add(dst);
  }

  /**
   * Removes an edge from the graph.
   * Assumes that both nodes are actually in the graph.
   */
  public void removeEdge(Node src, Node dst) {
    successors.get(src).remove(dst);
  }

  /**
   * Prints the graph in dot representation. The output can be opened
   * with dotty (<code>dotty output.dot</code>) or converted to PDF
   * with dot (<code>dot -Tpdf output.dot > output.pdf</code>).
   * Siehe: http://www.graphviz.com
   */
  public void printDot(PrintStream out) {
    out.println("digraph G {");
    for (Node n : this.nodeSet()) {
      out.println("\"" + n + "\";");
    }
    for (Node n : this.nodeSet()) {
      for (Node m : this.successors(n)) {
        out.println("\"" + n + "\"  -> \"" + m + "\"");
      }
    }
    out.println("}");
  }
}
