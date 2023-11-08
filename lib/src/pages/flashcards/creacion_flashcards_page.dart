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
  // List<Flashcard>? flashcards;
  List<Flashcard> flashcards2 = [
    Flashcard(
        "Hola",
        Palabra("hola", "hello", "saludo", ["hola1", "hola2"], "Otro",
            id: "hola"),
        true,
        3)
  ];
  String? _selectedCategory;
  String? _selectedPriority;

  bool showCreateForm = false; // Variable para mostrar el formulario

  void toggleFormVisibility() {
    setState(() {
      showCreateForm = !showCreateForm;
    });
  }

  // void obtenerFlashcard(String userId, BuildContext context) async {
  //   try {
  //     FirestoreService firestoreService =
  //         Provider.of<FirestoreService>(context, listen: false);
  //     var fls = await firestoreService.obtenerFlashcard(userId);
  //     if (mounted) {
  //       // Verificar si el widget está montado
  //       setState(() {
  //         flashcards = fls;
  //       });
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);
    // obtenerFlashcard(firebaseService.user!.uid, context);
    // if (flashcards == null) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }
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
        onPressed: toggleFormVisibility,
        backgroundColor: azulOscuro,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
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
            // if (showCreateForm)
            // FormularioFlashcard(onSaved: toggleFormVisibility),
            Expanded(
              child: flashcards2.isEmpty
                  ? const Text("No hay flashcards creadas")
                  : ListView.builder(
                      itemBuilder: (context, index) =>
                          VistaFlashcard(flashcards2[index]),
                      itemCount: flashcards2.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormularioFlashcard extends StatefulWidget {
  const FormularioFlashcard({
    required this.onSaved,
    super.key,
  });

  final void Function() onSaved;

  @override
  State<FormularioFlashcard> createState() => _FormularioFlashcardState();
}

class _FormularioFlashcardState extends State<FormularioFlashcard> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: azulRey, width: 3),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Agregar una nueva Flashcard",
              style: TextStyle(
                fontFamily: "Arimo",
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Palabra",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Traducción",
              ),
            ),
            Row(
              children: [
                const Text("Categoría"),
                // DropdownButtonFormField<String>(
                //   items: [
                //     "Sustantivo",
                //     "Adjetivo",
                //     "Verbo",
                //     "Adverbio",
                //     "Preposición",
                //     "Otro"
                //   ]
                //       .map((String e) =>
                //           DropdownMenuItem<String>(child: Text(e)))
                //       .toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedCategory = value;
                //     });
                //   },
                // ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Lógica para guardar la nueva flashcard
            //     // Puedes agregar la nueva flashcard a la lista flashcards
            //   },
            //   child: const Text('Guardar Flashcard'),
            // ),
          ],
        ),
      ),
    );
  }
}

class VistaFlashcard extends StatelessWidget {
  const VistaFlashcard(this.flashcard, {Key? key}) : super(key: key);
  final Flashcard flashcard;
  final TextStyle estiloTexto = const TextStyle(
    fontSize: 15,
    fontFamily: "Arimo",
    fontWeight: FontWeight.bold,
  );

  final TextStyle estiloTitulo = const TextStyle(
    fontFamily: "Arimo",
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: azulOscuro,
  );

  String obtenerPrioridad(int prioridad) {
    if (prioridad == 1) {
      return "Alta";
    } else if (prioridad == 2) {
      return "Media";
    } else {
      return "Baja";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: azulRey, width: 3),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            flashcard.palabra.ingles,
            style: estiloTexto,
          ),
          const Divider(
            thickness: 4,
            color: azulRey,
          ),
          Text(
            flashcard.palabra.espanol,
            style: estiloTexto,
          ),
          const Divider(
            thickness: 4,
            color: azulRey,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: azulRey,
                ),
                width: 95,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    "Categoría",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Arimo",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: gris, width: 1),
                ),
                child: Center(child: Text(flashcard.palabra.categoria)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: azulRey,
                ),
                width: 95,
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    "Prioridad",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Arimo",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: gris, width: 1),
                ),
                child:
                    Center(child: Text(obtenerPrioridad(flashcard.prioridad))),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Definición",
            style: estiloTitulo,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: azulRey,
                width: 2,
              ),
            ),
            child: Text(
              flashcard.palabra.definicion,
              style: estiloTexto,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Ejemplos",
            style: estiloTitulo,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 150),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.arrow_right),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    title: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: azulRey,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: Text(
                        flashcard.palabra.ejemplos[index],
                        style: estiloTexto,
                      ),
                    ),
                  );
                },
                itemCount: flashcard.palabra.ejemplos.length),
          ),
        ],
      ),
    );
  }
}
