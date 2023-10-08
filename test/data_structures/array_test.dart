import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/array.dart';

void main() {
  group("Prueba de funcionamiento de un arreglo", () {
    test("El arreglo debe poder añadir elementos al final", () {
      Array<int> array = Array<int>(4);
      array.insert(1);
      array.insert(2);
      array.insert(3);
      array.insert(4);

      expect(array.pop(), 4);
      expect(array.pop(), 3);
      expect(array.pop(), 2);
      expect(array.pop(), 1);
    });

    test("El arreglo debe poder buscar elementos", () {
      Array<int> array = Array<int>(4);
      array.insert(1);
      array.insert(2);
      array.insert(3);
      array.insert(4);

      expect(array.search(1), true);
      expect(array.search(2), true);
      expect(array.search(3), true);
      expect(array.search(4), true);
      expect(array.search(5), false);
    });

    test("El arreglo debe poder eliminar elementos", () {
      Array<int> array = Array<int>(4);
      array.insert(1);
      array.insert(2);
      array.insert(3);
      array.insert(4);

      array.remove(1);
      array.remove(2);
      array.remove(3);
      array.remove(4);

      expect(array.length, 0);
      expect(array.search(1), false);
      expect(array.search(2), false);
      expect(array.search(3), false);
      expect(array.search(4), false);
    });
  });
}
