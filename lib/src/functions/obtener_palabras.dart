import 'dart:convert';
import 'dart:io';

class Palabra {
  String ingles;
  String espanol;
  List<String> ejemplos;
  String definicion;

  Palabra(this.ingles, this.espanol, this.ejemplos, this.definicion);
}

Future<List<dynamic>> getDataFromJson(String filePath) async {
  final file = File(filePath);
  final contents = await file.readAsString();
  final jsonData = json.decode(contents);
  return jsonData;
}

void main() {
  getDataFromJson('assets/json/10000_datos.json').then((data) {
    print(data[0].runtimeType);
  });
}
