import 'dart:convert';
import 'dart:io';

class Palabra {
  String ingles;
  String espanol;
  List<String> ejemplos;
  String definicion;

  Palabra(this.ingles, this.espanol, this.ejemplos, this.definicion);

  factory Palabra.fromJson(Map<String, dynamic> json) {
    return Palabra(
        json['ingles'] as String,
        json['espanol'] as String,
        (json['ejemplos'] as List<dynamic>)
            .cast<String>(), // Ensure ejemplos is a List<String>
        json['definicion'] as String);
  }
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
