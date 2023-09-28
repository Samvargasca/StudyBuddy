import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/stack.dart';

void main() {
  group("Pila", () {
    test("La pila no deja desapilar elementos si está vacía", () {
      Stack stack = Stack<int>(10);
      expect(() => stack.pop(), throwsException);
    });

    test("La pila no deja entrever elementos si está vacía", () {
      Stack stack = Stack<int>(10);
      expect(() => stack.peek(), throwsException);
    });

    test("La pila apila, entreve y desapila en el orden esperado (LIFO).", () {
      Stack stack = Stack<int>(10);
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.push(4);
      stack.push(5);
      expect(stack.peek(), 5);
      expect(stack.peek(), 5);
      expect(stack.pop(), 5);
      expect(stack.pop(), 4);
      expect(stack.pop(), 3);
      expect(stack.pop(), 2);
      expect(stack.pop(), 1);
    });

    test("La pila no debe dejar insertar elementos cuando está llena.", () {
      Stack stack = Stack<int>(3);
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(() => stack.push(4), throwsException);
    });
  });
}
