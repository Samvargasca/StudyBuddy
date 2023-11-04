import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/avl_tree.dart';

void main() {
  group("Funcionamiento de AVL", () {
    test("Inserción correcta", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);

      expect(avl.inorder(avl.root), [1, 2, 3, 4]);
    });

    test("Eliminación correcta", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);

      avl.delete(3);

      expect(avl.inorder(avl.root), [1, 2, 4]);
    });

    test("Búsqueda correcta", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);

      expect(avl.search(3), true);
      expect(avl.search(1), true);
      expect(avl.search(2), true);
      expect(avl.search(4), true);
      expect(avl.search(5), false);
    });

    test("Mínimo correcto", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);

      expect(avl.minimum(avl.root!).data, 1);
    });

    test("Siguiente correcto", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);

      expect(avl.next(avl.root!).data, 4);
    });

    test("Rango correcto", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);

      expect(avl.rangeSearch(avl.root!, 1, 3), [1, 2, 3]);
    });

    test("Eliminación de elemento inexistente", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);

      avl.delete(5);

      expect(avl.inorder(avl.root), [1, 2, 3, 4]);
    });

    test("Balanceo correcto", () {
      AVL avl = AVL();
      avl.insert(3);
      avl.insert(1);
      avl.insert(2);
      avl.insert(4);
      avl.insert(5);
      avl.insert(6);
      avl.insert(7);
      avl.insert(16);
      avl.insert(15);
      avl.insert(14);
      avl.insert(13);
      avl.insert(12);
      avl.insert(11);
      avl.insert(10);
      avl.insert(8);
      avl.insert(9);
      expect(avl.root!.data, 7);
    });
  });
}
