import 'map.dart';
import 'linked_list.dart';

class Grafo<T> {
  late MiMap<T, LinkedList<T>> _adjacencyList;

  Grafo(int longitud) {
    _adjacencyList = MiMap<T, LinkedList<T>>(longitud);
  }

  // Añadir un vértice al grafo
  void addVertex(T vertex) {
    if (!_adjacencyList.hasKey(vertex)) {
      _adjacencyList.set(vertex, LinkedList());
    }
    throw Exception('El vértice ya existe');
  }

  // Añadir una arista al grafo
  // El grafo será unidireccional, por lo que el vertex1 apuntará al vertex2 pero no viceversa
  void addEdge(T vertex1, T vertex2) {
    if (_adjacencyList.hasKey(vertex1) && _adjacencyList.hasKey(vertex2)) {
      _adjacencyList.get(vertex1)!.pushBack(vertex2);
    }
    throw Exception('El vértice no existe');
  }

  //Vecinos de un vértice
  LinkedList<T>? getNeighbors(T vertex) {
    if (_adjacencyList.hasKey(vertex)) {
      return _adjacencyList.get(vertex);
    }
    throw Exception('El vértice no existe');
  }

  // Obtener el tamaño del grafo
  int size() {
    return _adjacencyList.size;
  }

  // Obtener el grafo
  MiMap<T, LinkedList<T>> getGraph() {
    return _adjacencyList;
  }
}
