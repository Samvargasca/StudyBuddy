import 'dart:math';

import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/linked_list.dart';

void main() {
  group("Lista enlazada", () {
    test("La lista debe poder añadir elementos al principio", () {
      LinkedList linkedList = LinkedList();
      linkedList.pushFront(1);
      linkedList.pushFront(2);
      linkedList.pushFront(3);
      linkedList.pushFront(4);

      expect(linkedList.popFront(), 4);
      expect(linkedList.popFront(), 3);
      expect(linkedList.popFront(), 2);
      expect(linkedList.popFront(), 1);
    });

    test("La lista debe poder añadir elementos al final", () {
      LinkedList linkedList = LinkedList();
      linkedList.pushBack(1);
      linkedList.pushBack(2);
      linkedList.pushBack(3);
      linkedList.pushBack(4);

      expect(linkedList.popBack(), 4);
      expect(linkedList.popBack(), 3);
      expect(linkedList.popBack(), 2);
      expect(linkedList.popBack(), 1);
    });

    test("La lista no debería dejar sacar elementos cuando está vacía", () {
      LinkedList linkedList = LinkedList();
      expect(() => linkedList.popBack(), throwsException);
      expect(() => linkedList.popFront(), throwsException);
    });

    test("addAfter debe agregar elementos después del nodo especificado", () {
      LinkedList<int> lista = LinkedList<int>();
      lista.pushBack(1);
      lista.pushBack(2);
      lista.addAfter(lista.head!, 3);
      expect(lista.popFront(), equals(1));
      expect(lista.popFront(), equals(3));
      expect(lista.popFront(), equals(2));
    });
  });
}
