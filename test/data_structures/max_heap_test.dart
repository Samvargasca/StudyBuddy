import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/max_heap.dart';

void main() {
  group("Funcionamiento de max heap", () {
    test("Inserción correcta de elementos", () {
      MaxHeap heap = MaxHeap(10);
      heap.insert(2);
      heap.insert(3);
      heap.insert(1);
      heap.insert(5);
      heap.insert(4);
      heap.insert(6);

      expect(heap.extractMax(), 6);
      expect(heap.extractMax(), 5);
      expect(heap.extractMax(), 4);
      expect(heap.extractMax(), 3);
      expect(heap.extractMax(), 2);
      expect(heap.extractMax(), 1);
    });

    test("No deja extraer si  está vacía", () {
      MaxHeap heap = MaxHeap(10);
      expect(() => heap.extractMax(), throwsException);
    });
    test("Cambia la prioridad de un elemento", () {
      MaxHeap heap = MaxHeap(10);
      heap.insert(2);
      heap.insert(3);
      heap.insert(1);
      heap.insert(5);
      heap.insert(4);
      heap.insert(6);

      heap.changePriority(
          3, 10); // Cambia la prioridad del elemento en el índice 3 a 10
      expect(heap.extractMax(), 10);
      expect(heap.extractMax(), 6);
      expect(heap.extractMax(), 5);
      expect(heap.extractMax(), 4);
      expect(heap.extractMax(), 3);
      expect(heap.extractMax(), 1);
    });

    test("Remueve un elemento", () {
      MaxHeap heap = MaxHeap(10);
      heap.insert(2);
      heap.insert(3);
      heap.insert(1);
      heap.insert(5);

      heap.remove(2); // Elimina el elemento en el índice 2

      expect(heap.extractMax(), 5);
      expect(heap.extractMax(), 3);
      expect(heap.extractMax(), 2);
    });
  });
}
