import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

class FirestoreService extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Referencia a la coleccion de usuarios
  late final CollectionReference _usersCollectionRef = _db.collection('users');

  Future<void> createUser(String id, String usuario) async {
    try {
      await _usersCollectionRef.doc(id).set({'usuario': usuario});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _usersCollectionRef.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getUser(String id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _usersCollectionRef.doc(id).get();
      return documentSnapshot.get('usuario');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(String id, String usuario) async {
    try {
      await _usersCollectionRef.doc(id).update({'usuario': usuario});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> agregarError(String idUsuario, String idPalabra) async {
    try {
      await _usersCollectionRef.doc(idUsuario).update({
        'errores': FieldValue.arrayUnion([idPalabra])
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> guardarTiempo(String idUsuario, int tiempo) async {
    try {
      await _usersCollectionRef.doc(idUsuario).update({
        'tiempoTraduccion': tiempo,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Referencia a la coleccion de palabras
  late final CollectionReference _palabrasCollectionRef =
      _db.collection('palabras');

  Future<void> createPalabra(Palabra palabra) async {
    await _palabrasCollectionRef.add(palabra);
  }

  Future<List<Palabra>> getPalabras() async {
    try {
      QuerySnapshot querySnapshot = await _palabrasCollectionRef.get();

      List<Palabra> palabras = querySnapshot.docs.map((value) {
        return Palabra.fromFirestore(value, null);
      }).toList();
      return palabras;
    } catch (e) {
      rethrow;
    }
  }

  // Función para cargar las palabras desde un archivo JSON
  Future<List<Palabra>> cargarPalabrasFromJson() async {
    String jsonString =
        await rootBundle.loadString('assets/json/datos_prueba.json');

    List<dynamic> jsonData = json.decode(jsonString);
    List<Palabra> palabras = jsonData.map((e) => Palabra.fromJson(e)).toList();
    return palabras;
  }
}

class Palabra {
  String ingles;
  String espanol;
  List<String> ejemplos;
  String definicion;
  String id;

  Palabra(this.espanol, this.ingles, this.definicion, this.ejemplos,
      {this.id = ""});

  factory Palabra.fromFirestore(
      QueryDocumentSnapshot<Object?> snapshot, SnapshotOptions? options) {
    if (snapshot is QueryDocumentSnapshot<Map<String, dynamic>>) {
      final data = snapshot.data();

      return Palabra(
        data['espanol'],
        data['ingles'],
        data['definicion'],
        data['ejemplos'] is Iterable
            ? List.from(data['ejemplos'])
            : throw Exception("Fallo al obtener los ejemplos"),
        id: snapshot.id,
      );
    }
    throw Exception("Se están cargando valores erróneos");
  }

  Map<String, dynamic> toFirestore() {
    return {
      'espanol': espanol,
      'ingles': ingles,
      'definicion': definicion,
      'ejemplos': ejemplos,
    };
  }

  // Función para comparar listas por contenido
  bool listEquals(List a, List b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  bool operator ==(Object other) =>
      other is Palabra &&
      other.ingles == ingles &&
      other.espanol == espanol &&
      listEquals(other.ejemplos,
          ejemplos) && // Utiliza una función de comparación de listas
      other.definicion == definicion;

  @override
  int get hashCode =>
      ingles.hashCode ^
      espanol.hashCode ^
      ejemplos.hashCode ^
      definicion.hashCode;

  factory Palabra.fromJson(Map<String, dynamic> json) {
    return Palabra(
      json['espanol'] as String,
      json['ingles'] as String,
      json['definicion'] as String,
      (json['ejemplos'] as List<dynamic>).cast<String>(),
    ); // Ensure ejemplos is a List<String>
  }
}
