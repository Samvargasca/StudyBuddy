import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/disjoint_sets.dart';

void main() {
  group("Funcionamiento de conjuntos disjuntos", () {
    test("Unión", () {
      DisjointSets disjointSets = DisjointSets(10);
      disjointSets.union(1, 2);
      disjointSets.union(2, 3);
      disjointSets.union(4, 5);
      disjointSets.union(6, 7);

      expect(disjointSets.find(2) == disjointSets.find(3), true);
      expect(disjointSets.find(4) == disjointSets.find(3), false);
    });

    test("Contar elementos de un conjunto", () {
      DisjointSets disjointSets = DisjointSets(10);
      disjointSets.union(1, 2);
      disjointSets.union(2, 3);
      disjointSets.union(4, 5);

      expect(disjointSets.lengthSet(2), 3);
      expect(disjointSets.lengthSet(4), 2);
    });
  });
}
