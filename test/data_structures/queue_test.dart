import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/queue.dart';

void main() {
  group("Cola", () {
    test("La cola no deja sacar elementos cuando está vacía", () {
      Queue queue = Queue<int>(3);
      expect(() => queue.dequeue(), throwsException);
    });

    test("La cola no deja entrever elementos cuando está vacía", () {
      Queue queue = Queue<int>(3);
      expect(() => queue.peek(), throwsException);
    });
    test("La cola no deja insertar elementos cuando está llena", () {
      Queue queue = Queue<int>(3);
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      expect(() => queue.enqueue(4), throwsException);
    });

    test("La cola funciona correctamente (FIFO).", () {
      Queue queue = Queue<int>(4);
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      queue.enqueue(4);
      expect(queue.dequeue(), 1);
      expect(queue.dequeue(), 2);
      expect(queue.dequeue(), 3);
      expect(queue.dequeue(), 4);
    });

    test("La búsqueda funciona correctamente", () {
      Queue queue = Queue<int>(4);
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      queue.enqueue(4);
      expect(queue.search(1), true);
      expect(queue.search(2), true);
      expect(queue.search(3), true);
      expect(queue.search(4), true);
      expect(queue.search(5), false);
    });
  });
}
