import 'package:test/test.dart';
import 'package:study_buddy/src/data_structures/linked_list.dart';
import 'package:study_buddy/src/functions/obtener_palabras.dart';

void main() {
  group("Lista enlazada", () {
    test("La lista debe poder añadir elementos al principio", () {
      LinkedList linkedList = LinkedList<int>();
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
      LinkedList linkedList = LinkedList<int>();
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
      LinkedList linkedList = LinkedList<int>();
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

    test("Tiempo de inserción, búsqueda y elimninación de 10000 datos",
        () async => pruebaNDatosLInkedList(10000));

    test("Tiempo de inserción, búsqueda y elimninación de 20000 datos",
        () async => pruebaNDatosLInkedList(20000));

    test("Tiempo de inserción, búsqueda y elimninación de 30000 datos",
        () async => pruebaNDatosLInkedList(30000));

    test("Tiempo de inserción, búsqueda y elimninación de 40000 datos",
        () async => pruebaNDatosLInkedList(40000));

    test("Tiempo de inserción, búsqueda y elimninación de 50000 datos",
        () async => pruebaNDatosLInkedList(50000));

    test("Tiempo de inserción, búsqueda y elimninación de 60000 datos",
        () async => pruebaNDatosLInkedList(60000));

    test("Tiempo de inserción, búsqueda y elimninación de 70000 datos",
        () async => pruebaNDatosLInkedList(70000));

    test("Tiempo de inserción, búsqueda y elimninación de 80000 datos",
        () async => pruebaNDatosLInkedList(80000));

    test("Tiempo de inserción, búsqueda y elimninación de 90000 datos",
        () async => pruebaNDatosLInkedList(90000));

    test("Tiempo de inserción, búsqueda y elimninación de 100000 datos",
        () async => pruebaNDatosLInkedList(100000));
  });
}

pruebaNDatosLInkedList(int N) async {
  String ruta;
  switch (N) {
    case 10000:
      print("Prueba con 10000 datos");
      ruta = 'assets/json/10000_datos.json';
      break;
    case 20000:
      print("Prueba con 20000 datos");
      ruta = 'assets/json/20000_datos.json';
      break;
    case 30000:
      print("Prueba con 30000 datos");
      ruta = 'assets/json/30000_datos.json';
      break;
    case 40000:
      print("Prueba con 40000 datos");
      ruta = 'assets/json/40000_datos.json';
      break;
    case 50000:
      print("Prueba con 50000 datos");
      ruta = 'assets/json/50000_datos.json';
      break;
    case 60000:
      print("Prueba con 60000 datos");
      ruta = 'assets/json/60000_datos.json';
      break;
    case 70000:
      print("Prueba con 70000 datos");
      ruta = 'assets/json/70000_datos.json';
      break;
    case 80000:
      print("Prueba con 80000 datos");
      ruta = 'assets/json/80000_datos.json';
      break;
    case 90000:
      print("Prueba con 90000 datos");
      ruta = 'assets/json/90000_datos.json';
      break;
    case 100000:
      print("Prueba con 100000 datos");
      ruta = 'assets/json/100000_datos.json';
    default:
      throw Exception("No se ha encontrado la ruta");
  }

  LinkedList<Palabra> lista = LinkedList<Palabra>();
  List palabras = await getDataFromJson(ruta);
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  for (int i = 0; i < palabras.length; i++) {
    Map<String, dynamic> json = palabras[i] as Map<String, dynamic>;
    Palabra palabra = Palabra.fromJson(json);
    lista.pushBack(palabra);
  }
  stopwatch.stop();
  print("Tiempo de inserción: ${stopwatch.elapsedMilliseconds} ms");
  stopwatch.reset();
  stopwatch.start();
  expect(
      lista.search(Palabra(
          "casa", "house", "edificio para vivir", ["I live in a house"])),
      true);
  expect(
      lista.search(Palabra("Dortmund", "Tottenham", "definición", ["Ejemplo"])),
      false);
  stopwatch.stop();
  print("Tiempo de búsqueda: ${stopwatch.elapsedMilliseconds} ms");
  stopwatch.reset();
  stopwatch.start();
  for (int i = 0; i < palabras.length; i++) {
    // ignore: unused_local_variable
    Palabra palabra = lista.popBack();
  }
  stopwatch.stop();
  print("Tiempo de eliminación: ${stopwatch.elapsedMilliseconds} ms");
}
