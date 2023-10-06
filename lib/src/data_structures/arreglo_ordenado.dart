// Arreglo que guarda los elementos en orden

class ArregloOrdenado<T extends Comparable<T>> {
  //Constructor
  ArregloOrdenado(int n) {
    capacidad = n;
    _arreglo = List<T?>.filled(n, null);
  }

  // El tipo T debe ser comparable
  List<T?> _arreglo = [];
  int cantidad = 0;
  int capacidad = 0;

  //Métodos
  bool isEmpty() => cantidad <= 0;
  bool isFull() => cantidad >= capacidad;

  void insert(T dato) {
    if (isFull()) throw Exception("El arreglo está lleno");

    int index = cantidad - 1;
    while (index >= 0 && _arreglo[index]!.compareTo(dato) > 0) {
      _arreglo[index + 1] = _arreglo[index];
      index--;
    }
    _arreglo[index + 1] = dato;
    cantidad++;
  }
}
