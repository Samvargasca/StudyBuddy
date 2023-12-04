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

      MiSet<Palabra> set = MiSet(10);
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

      MiSet<Palabra> set = MiSet(10);
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

      MiSet<Palabra> set = MiSet(10);
      set.insert(palabra1);
      set.insert(palabra2);
      set.insert(palabra3);
      set.insert(palabra1);

      expect(set.size, 3);
    });

    test("Elementos ausentes", () {
      Palabra palabra1 = Palabra(
          "Hola", "Hello", "Saludo casual", ["Hello!", "Hi!", "Hey!"], "");
      Palabra palabra2 = Palabra("Adiós", "Goodbye", "Despedida casual",
          ["Goodbye!", "Bye!", "See you!"], "");
      Palabra palabra3 = Palabra("Gracias", "Thanks", "Agradecimiento",
          ["Thanks!", "Thank you!", "Thank you very much!"], "");

      MiSet<Palabra> set = MiSet(10);
      set.insert(palabra1);
      set.insert(palabra2);

      expect(set.contains(palabra1), true);
      expect(set.contains(palabra2), true);
      expect(set.contains(palabra3), false);

      expect(() => set.remove(palabra3), throwsException);
    });
    test("Conjunto vacío", () {
      MiSet<int> set = MiSet(10);
      expect(set.empty, true);
    });
  });

  group("Tiempo de inserción, búsqueda y eliminación para String", () {
    test("Tiempo de inserción, búsqueda y eliminación de 10000 datos",
        () => pruebaNDatosSet(10000));

    test("Tiempo de inserción, búsqueda y eliminación de 20000 datos",
        () => pruebaNDatosSet(20000));

    test("Tiempo de inserción, búsqueda y eliminación de 30000 datos",
        () => pruebaNDatosSet(30000));

    test("Tiempo de inserción, búsqueda y eliminación de 40000 datos",
        () => pruebaNDatosSet(40000));

    test("Tiempo de inserción, búsqueda y eliminación de 50000 datos",
        () => pruebaNDatosSet(50000));

    test("Tiempo de inserción, búsqueda y eliminación de 60000 datos",
        () => pruebaNDatosSet(60000));

    test("Tiempo de inserción, búsqueda y eliminación de 70000 datos",
        () => pruebaNDatosSet(70000));

    test("Tiempo de inserción, búsqueda y eliminación de 80000 datos",
        () => pruebaNDatosSet(80000));

    test("Tiempo de inserción, búsqueda y eliminación de 90000 datos",
        () => pruebaNDatosSet(90000));

    test("Tiempo de inserción, búsqueda y eliminación de 100000 datos",
        () => pruebaNDatosSet(100000));

    test("Tiempo de inserción, búsqueda y eliminación de 200000 datos",
        () => pruebaNDatosSet(200000));

    test("Tiempo de inserción, búsqueda y eliminación de 300000 datos",
        () => pruebaNDatosSet(300000));

    test("Tiempo de inserción, búsqueda y eliminación de 400000 datos",
        () => pruebaNDatosSet(400000));

    test("Tiempo de inserción, búsqueda y eliminación de 500000 datos",
        () => pruebaNDatosSet(500000));

    test("Tiempo de inserción, búsqueda y eliminación de 600000 datos",
        () => pruebaNDatosSet(600000));

    test("Tiempo de inserción, búsqueda y eliminación de 700000 datos",
        () => pruebaNDatosSet(700000));

    test("Tiempo de inserción, búsqueda y eliminación de 800000 datos",
        () => pruebaNDatosSet(800000));
  });
}

pruebaNDatosSet(int N) {
  print("Prueba con $N datos");
  MiSet<String> set = MiSet(N);
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  for (int i = 0; i < N; i++) {
    set.insert("palabra$i");
  }
  stopwatch.stop();
  print("Tiempo de inserción: ${stopwatch.elapsedMilliseconds} ms");
  stopwatch.reset();
  stopwatch.start();
  expect(set.contains("palabra${N ~/ 2}"), true);
  expect(set.contains("palabra${N + 1}"), false);
  stopwatch.stop();
  print("Tiempo de búsqueda: ${stopwatch.elapsedMilliseconds} ms");
  stopwatch.reset();
  stopwatch.start();
  for (int i = 0; i < N; i++) {
    set.remove("palabra$i");
  }
  stopwatch.stop();
  print("Tiempo de eliminación: ${stopwatch.elapsedMilliseconds} ms");
}
