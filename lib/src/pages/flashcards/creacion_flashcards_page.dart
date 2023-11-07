import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/services/firebase_service.dart';
import 'package:study_buddy/src/services/firestore_service.dart';
import "package:provider/provider.dart";

class CreacionFlashcardsPage extends StatefulWidget {
  const CreacionFlashcardsPage({Key? key}) : super(key: key);

  @override
  State<CreacionFlashcardsPage> createState() => _CreacionFlashcardsPageState();
}

class _CreacionFlashcardsPageState extends State<CreacionFlashcardsPage> {
  List<Flashcard>? flashcards;

  void obtenerFlashcard(String userId, BuildContext context) async {
    try {
      FirestoreService firestoreService =
          Provider.of<FirestoreService>(context, listen: false);
      var fls = await firestoreService.obtenerFlashcard(userId);
      if (mounted) {
        // Verificar si el widget está montado
        setState(() {
          flashcards = fls;
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);
    obtenerFlashcard(firebaseService.user!.uid, context);
    if (flashcards == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "StudyBuddy",
          style: TextStyle(
            fontFamily: "Chewy",
            fontSize: 32,
          ),
        ),
        backgroundColor: azulClaro,
        shadowColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        backgroundColor: azulOscuro,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: azulOscuro,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 6.5,
                  horizontal: 11.5,
                ),
                child: const Center(
                  child: Text(
                    "Flashcards",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Arimo",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel,
                  color: rojo,
                  size: 37,
                ),
              )
            ],
          ),
          Expanded(
            child: flashcards!.isEmpty
                ? const Text("No hay flashcards creadas")
                : ListView.builder(
                    itemBuilder: (context, index) => Text("Flashcard $index"),
                    itemCount: flashcards!.length,
                  ),
          ),
        ],
      ),
    );
  }
}
