import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/graph.dart';

void main() {
  group("Funcionamiento de grafos", () {
    test("Inserción de nodos", () {
      Grafo<String> grafo = Grafo(10);
      grafo.addVertex("A");
      grafo.addVertex("B");
      grafo.addVertex("C");
      grafo.addVertex("D");
      grafo.addVertex("E");
      grafo.addVertex("F");
      grafo.addVertex("G");
      grafo.addVertex("H");
      grafo.addVertex("I");
      grafo.addVertex("J");

      expect(grafo.size(), 10);
    });

    test("Inserción de vértices", () {
      Grafo<String> grafo = Grafo(10);
      grafo.addVertex("A");
      grafo.addVertex("B");
      grafo.addVertex("C");
      grafo.addVertex("D");
      grafo.addVertex("E");
      grafo.addVertex("F");
      grafo.addVertex("G");
      grafo.addVertex("H");
      grafo.addVertex("I");
      grafo.addVertex("J");

      grafo.addEdge("A", "B");
      grafo.addEdge("A", "C");
      grafo.addEdge("A", "D");
      grafo.addEdge("B", "E");
      grafo.addEdge("B", "F");
      grafo.addEdge("C", "G");
      grafo.addEdge("C", "H");
      grafo.addEdge("D", "I");
      grafo.addEdge("D", "J");

      expect(grafo.getNeighbors("A")!.size, 3);
      expect(grafo.getNeighbors("B")!.size, 2);
      expect(grafo.getNeighbors("C")!.size, 2);
      expect(grafo.getNeighbors("D")!.size, 2);
      expect(grafo.getNeighbors("E")!.size, 0);
      expect(grafo.getNeighbors("F")!.size, 0);
      expect(grafo.getNeighbors("G")!.size, 0);
      expect(grafo.getNeighbors("H")!.size, 0);
      expect(grafo.getNeighbors("I")!.size, 0);
      expect(grafo.getNeighbors("J")!.size, 0);
    });

    test("Existencia de nodos", () {
      Grafo<String> grafo = Grafo(10);
      grafo.addVertex("A");
      grafo.addVertex("B");
      grafo.addVertex("C");
      grafo.addVertex("D");
      grafo.addVertex("E");
      grafo.addVertex("F");
      grafo.addVertex("G");
      grafo.addVertex("H");
      grafo.addVertex("I");
      grafo.addVertex("J");

      grafo.addEdge("A", "B");
      grafo.addEdge("A", "C");
      grafo.addEdge("A", "D");
      grafo.addEdge("B", "E");
      grafo.addEdge("B", "F");
      grafo.addEdge("C", "G");
      grafo.addEdge("C", "H");
      grafo.addEdge("D", "I");
      grafo.addEdge("D", "J");

      expect(grafo.getNodes().contains("A"), true);
      expect(grafo.getNodes().contains("B"), true);
      expect(grafo.getNodes().contains("C"), true);
      expect(grafo.getNodes().contains("D"), true);
      expect(grafo.getNodes().contains("E"), true);
      expect(grafo.getNodes().contains("F"), true);
      expect(grafo.getNodes().contains("G"), true);
      expect(grafo.getNodes().contains("H"), true);
      expect(grafo.getNodes().contains("I"), true);
      expect(grafo.getNodes().contains("J"), true);
      expect(grafo.getNodes().contains("K"), false);
    });

    test("No se puede ingresar un nodo ya existente", () {
      Grafo<String> grafo = Grafo(10);
      grafo.addVertex("A");
      grafo.addVertex("B");

      expect(() => grafo.addVertex("A"), throwsException);
    });
  });
}
