import 'package:study_buddy/src/services/firestore_service.dart';
import 'package:study_buddy/src/data_structures/linked_list.dart';

class MiSet {
  late List<LinkedList<Palabra>> _buckets;
  late int _capacity;
  int _size = 0;

  // Get para size
  int get size => _size;

  // get para empty
  bool get empty => _size == 0;

  MiSet(int initialCapacity) {
    _capacity = initialCapacity;
    _buckets = List.filled(_capacity, LinkedList<Palabra>());
  }

  int _hashString(String s) {
    int hashValue = 0;
    const int base =
        31; // Se puede cambiar por cualquier otro número primo mayor a 26

    for (int i = 0; i < s.length; i++) {
      hashValue = (hashValue * base + s.codeUnitAt(i)) % _capacity;
    }

    return hashValue;
  }

  int _hash(Palabra palabra) {
    return (_hashString(palabra.espanol) ^
            _hashString(palabra.ingles) ^
            _hashString(palabra.definicion) ^
            _hashString(palabra.ejemplos[0])) %
        _capacity;
  }

  // Función resize para mapa dinámico
  void _resize() {
    _capacity *= 2;
    var newBuckets = List.filled(_capacity, LinkedList<Palabra>());

    // Rehashing
    for (var bucket in _buckets) {
      for (var palabra in bucket.getAll()) {
        var index = _hash(palabra);
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

      int index = _hash(palabra);
      _buckets[index].pushBack(palabra);
      _size++;
    }
  }

  // Eliminar un elemento
  void remove(Palabra palabra) {
    int index = _hash(palabra);
    _buckets[index].delete(palabra);
    _size--;
  }

  // Revisar si un elemento está contenido
  bool contains(Palabra palabra) {
    int index = _hash(palabra);
    return _buckets[index].search(palabra);
  }
}
