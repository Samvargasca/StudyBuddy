import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';

class CreacionFlashcardsPage extends StatefulWidget {
  const CreacionFlashcardsPage({Key? key}) : super(key: key);

  @override
  State<CreacionFlashcardsPage> createState() => _CreacionFlashcardsPageState();
}

class _CreacionFlashcardsPageState extends State<CreacionFlashcardsPage> {
  final List<String> flashcards = const ["hola", "chao"];

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemBuilder: (context, index) => Text("Flashcard $index"),
              itemCount: flashcards.length,
            ),
          ),
        ],
      ),
    );
  }
}
