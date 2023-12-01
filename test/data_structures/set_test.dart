import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/set.dart';
import 'package:study_buddy/src/services/firestore_service.dart';

void main() {
  group("Funcionamiento del set", () {
    test("Inserción y Búsqueda", () {
      Palabra palabra1 = Palabra(
          "Hola", "Hello", "Saludo casual", ["Hello!", "Hi!", "Hey!"], "");
      Palabra palabra2 = Palabra("Adiós", "Goodbye", "Despedida casual",
          ["Goodbye!", "Bye!", "See you!"], "");
      Palabra palabra3 = Palabra("Gracias", "Thanks", "Agradecimiento",
          ["Thanks!", "Thank you!", "Thank you very much!"], "");

      MiSet set = MiSet(10);
      set.insert(palabra1);
      set.insert(palabra2);

      expect(set.contains(palabra1), true);
      expect(set.contains(palabra2), true);
      expect(set.contains(palabra3), false);
    });
    test("Eliminación", () {
      Palabra palabra1 = Palabra(
          "Hola", "Hello", "Saludo casual", ["Hello!", "Hi!", "Hey!"], "");
      Palabra palabra2 = Palabra("Adiós", "Goodbye", "Despedida casual",
          ["Goodbye!", "Bye!", "See you!"], "");
      Palabra palabra3 = Palabra("Gracias", "Thanks", "Agradecimiento",
          ["Thanks!", "Thank you!", "Thank you very much!"], "");

      MiSet set = MiSet(10);
      set.insert(palabra1);
      set.insert(palabra2);
      set.insert(palabra3);

      set.remove(palabra2);

      expect(set.contains(palabra1), true);
      expect(set.contains(palabra2), false);
      expect(set.contains(palabra3), true);
    });

    test("Unicidad", () {
      Palabra palabra1 = Palabra(
          "Hola", "Hello", "Saludo casual", ["Hello!", "Hi!", "Hey!"], "");
      Palabra palabra2 = Palabra("Adiós", "Goodbye", "Despedida casual",
          ["Goodbye!", "Bye!", "See you!"], "");
      Palabra palabra3 = Palabra("Gracias", "Thanks", "Agradecimiento",
          ["Thanks!", "Thank you!", "Thank you very much!"], "");

      MiSet set = MiSet(10);
      set.insert(palabra1);
      set.insert(palabra2);
      set.insert(palabra3);
      set.insert(palabra1);

      expect(set.size, 3);
    });
  });
}
