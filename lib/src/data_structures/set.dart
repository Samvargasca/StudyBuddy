import 'package:study_buddy/src/services/firestore_service.dart';
import 'package:study_buddy/src/data_structures/linked_list.dart';

class MiSet {
  late List<LinkedList<Palabra>> _buckets;
  late int _capacity;
  int _size = 0;

  // Get para size
  int get size => _size;

  MiSet(int initialCapacity) {
    _capacity = initialCapacity;
    _buckets = List.filled(_capacity, LinkedList<Palabra>());
  }

  int _hash(String key) {
    // Simple función de hash para demostración
    return key.length % _capacity;
  }

  // Función resize para mapa dinámico
  void _resize() {
    _capacity *= 2;
    var newBuckets = List.filled(_capacity, LinkedList<Palabra>());

    // Rehashing
    for (var bucket in _buckets) {
      for (var palabra in bucket.getAll()) {
        var index = _hash(palabra.espanol);
        newBuckets[index].pushBack(palabra);
      }
    }

    _buckets = newBuckets; // Reemplazar el arreglo viejo
  }

  // Insertar un elemento
  void insert(Palabra palabra) {
    // Revisar si es necesario hacer resize
    if (!contains(palabra)) {
      if (_size >= _capacity) {
        _resize();
      }

      int index = _hash(palabra.espanol);
      _buckets[index].pushBack(palabra);
      _size++;
    }
  }

  // Eliminar un elemento
  void remove(Palabra palabra) {
    int index = _hash(palabra.espanol);
    _buckets[index].delete(palabra);
    _size--;
  }

  // Revisar si un elemento está contenido
  bool contains(Palabra palabra) {
    int index = _hash(palabra.espanol);
    return _buckets[index].search(palabra);
  }
}
