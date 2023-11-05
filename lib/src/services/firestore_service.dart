import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/material.dart';

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
}
