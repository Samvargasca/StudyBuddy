import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/binary_search_tree.dart';

void main() {
  group("Prueba de funcionamiento de BST", () {
    test("Se debe poder insertar un elemento en el BST", () {
      BST bst = BST();
      bst.insert(3);
      bst.insert(1);
      bst.insert(2);
      bst.insert(4);

      expect(bst.inorder(bst.root), [1, 2, 3, 4]);
    });

    test("Se debe poder eliminar un valor", () {
      BST bst = BST();
      bst.insert(3);
      bst.insert(1);
      bst.insert(2);
      bst.insert(4);

      bst.delete(3);

      expect(bst.inorder(bst.root), [1, 2, 4]);
    });

    test("Se debe poder buscar un elemento en el arbol", () {
      BST bst = BST();
      bst.insert(3);
      bst.insert(1);
      bst.insert(2);
      bst.insert(4);

      expect(bst.search(3), true);
      expect(bst.search(1), true);
      expect(bst.search(2), true);
      expect(bst.search(4), true);
      expect(bst.search(5), false);
    });

    test("Se debe poder buscar el mínimo", () {
      BST bst = BST();
      bst.insert(3);
      bst.insert(1);
      bst.insert(2);
      bst.insert(4);

      expect(bst.minimum(bst.root!).data, 1);
    });

    test("Se debe poder buscar el siguiente", () {
      BST bst = BST();
      bst.insert(3);
      bst.insert(1);
      bst.insert(2);
      bst.insert(4);

      expect(bst.next(bst.root!).data, 4);
    });

    test("Se debe poder buscar un rango", () {
      BST bst = BST();
      bst.insert(3);
      bst.insert(1);
      bst.insert(2);
      bst.insert(4);

      expect(bst.rangeSearch(1, 3, bst.root), [1, 2, 3]);
    });
  });
}
