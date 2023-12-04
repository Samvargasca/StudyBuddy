import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/map.dart';

void main() {
  group("Funcionamiento del mapa", () {
    test("Inserción y Búsqueda", () {
      MiMap<String, int> map = MiMap(10);
      map.set("Hola", 1);
      map.set("Adiós", 2);
      map.set("Gracias", 3);

      expect(map.get("Hola"), 1);
      expect(map.get("Adiós"), 2);
      expect(map.get("Gracias"), 3);
    });

    test("Unicidad", () {
      MiMap<String, int> map = MiMap(10);
      map.set("Hola", 1);
      map.set("Adiós", 2);
      map.set("Gracias", 3);
      map.set("Hola", 4);

      expect(map.size, 3);
    });

    test("Elementos ausentes", () {
      MiMap<String, int> map = MiMap(10);
      map.set("Hola", 1);
      map.set("Adiós", 2);
      map.set("Gracias", 3);

      expect(map.get("Hello"), null);
      expect(map.get("Bye"), null);
      expect(map.get("Thanks"), null);
    });

    test("Sobreescritura de valor", () {
      MiMap<String, int> map = MiMap(10);
      map.set("Hola", 1);
      map.set("Adiós", 2);
      map.set("Gracias", 3);

      expect(map.get("Hola"), 1);

      map.set("Hola", 4);

      expect(map.get("Hola"), 4);
    });

    test("Existencia de llaves", () {
      MiMap<String, int> map = MiMap(10);
      map.set("Hola", 1);
      map.set("Adiós", 2);
      map.set("Gracias", 3);

      expect(map.hasKey("Hola"), true);
      expect(map.hasKey("Adiós"), true);
      expect(map.hasKey("Gracias"), true);
      expect(map.hasKey("De hecho"), false);
    });
  });
}
