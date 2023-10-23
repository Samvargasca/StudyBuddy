import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/widgets/flashcard.dart';

import '../../data_structures/stack.dart' as stack;
import '../../functions/obtener_palabras.dart';

class TraduccionEjercicioPage extends StatefulWidget {
  const TraduccionEjercicioPage({Key? key}) : super(key: key);

  @override
  _TraduccionEjercicioPageState createState() =>
      _TraduccionEjercicioPageState();
}

class _TraduccionEjercicioPageState extends State<TraduccionEjercicioPage> {
  String imagenAsset = "assets/images/quokka-pregunta.png";
  late Palabra palabra;

  void cambiarImagen(String nuevaRuta) {
    setState(() {
      imagenAsset = nuevaRuta;
    });
  }

  stack.Stack words = stack.Stack<Palabra>(10);

  @override
  void initState() {
    super.initState();
    words.push(
      Palabra(
        "Hola",
        "Hello",
        "Saludo casual o informal",
        ["Hello, how are you?", "Hello, my name is Jude", "Hello, I'm James"],
      ),
    );
    words.push(
      Palabra(
        "Perro",
        "Dog",
        "Animal de cuatro patas que usualmente  se tiene como mascota o se entrena para trabajar.",
        [
          "I have a dog named Max.",
          "Dogs are known for their loyalty to humans.",
          "Many people love to play fetch with their dogs."
        ],
      ),
    );
    words.push(
      Palabra(
        "Casa",
        "House",
        "Construcción donde viven las personas",
        [
          "I live in a small house in the suburbs.",
          "Houses come in many different architectural styles.",
          "They are renovating their old house."
        ],
      ),
    );
    words.push(
      Palabra(
        "Comer",
        "Eat",
        "Ingerir alimentos",
        [
          "I'm hungry; let's eat dinner.",
          "Eating a balanced diet is important for your health.",
          "She doesn't eat meat; she's a vegetarian."
        ],
      ),
    );
    words.push(
      Palabra(
        "Beber",
        "Drink",
        "Consumir líquidos a través de la boca",
        [
          "I like to drink water throughout the day.",
          "Drinking too much alcohol can be harmful to your health.",
          "Would you like to drink some coffee?"
        ],
      ),
    );
    words.push(
      Palabra(
        "Dormir",
        "Sleep",
        "Un estado de descanso natural, generalmente durante la noche",
        [
          "I need to sleep for at least eight hours to feel rested.",
          "Some people have trouble sleeping at night.",
          "She fell asleep while reading a book."
        ],
      ),
    );
    words.push(
      Palabra(
        "Libro",
        "Book",
        "Un objeto compuesto por páginas impresas o en blanco, generalmente contenido en una cubierta",
        [
          "I love to read a good book on a rainy day.",
          "This library has a vast collection of books.",
          "She's writing a book about her travels."
        ],
      ),
    );
    words.push(
      Palabra(
        "Fútbol",
        "Football",
        "Deporte de equipo jugado con los pies y una pelota en forma de esfera",
        [
          "My favorite sport to watch is football.",
          "I played football in high school.",
          "The football game is on TV tonight."
        ],
      ),
    );
    words.push(
      Palabra(
        "Escuela",
        "School",
        "Una institución educativa",
        [
          "I'm going to school to study mathematics.",
          "The school is closed for the summer vacation.",
          "She's a teacher at the local elementary school."
        ],
      ),
    );
    words.push(
      Palabra(
        "Camiseta",
        "T-Shirt",
        "Prenda de vestir utilizada en la parte superior del cuerpo",
        [
          "This is my favorite T-shirt.",
          "I bought a new Tottenham T-shirt yesterday.",
          "She's wearing a T-shirt and jeans."
        ],
      ),
    );
    palabra = words.pop()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "StudyBuddy",
          style: TextStyle(
            fontFamily: "Chewy",
            fontSize: 32,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: azulClaro,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 36,
                width: 93,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: azulOscuro,
                ),
                child: const Center(
                  child: Text(
                    "Traducir",
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
                onPressed: () =>
                    Navigator.pop(context), // Volver a la página anterior
                icon: const Icon(
                  Icons.cancel,
                  color: rojo,
                  size: 37,
                ),
              ),
            ],
          ),
          Flashcard(
            pregunta: palabra.ingles,
            respuesta: palabra.definicion,
          ),
          const SizedBox(
            width: 350,
            child: Text(
              "Completa:",
              style: TextStyle(
                fontFamily: "Arimo",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: gris,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Formulario(palabra.espanol, cambiarImagen),
          Image.asset(
            imagenAsset,
            width: 159,
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, "/traduccion/errores"),
            style: ElevatedButton.styleFrom(
              backgroundColor: amarillo,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: const Text(
              "Ver Errores",
              style: TextStyle(
                color: azulOscuro,
                fontFamily: "Arimo",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const BarraInferior(),
        ],
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario(this.traduccion, this.cambiarImagen, {super.key});
  final String traduccion;
  final Function(String) cambiarImagen;

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controladorTexto = TextEditingController();

  bool editar = true;

  @override
  void dispose() {
    controladorTexto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 255,
            child: TextFormField(
              controller: controladorTexto,
              decoration: const InputDecoration(
                hintText: 'Escribe la traducción en español',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: azulOscuro,
                    width: 4,
                  ),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Escribe la traducción en español';
                }
                return null;
              },
              enabled: editar,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 59,
            height: 59,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: azulOscuro,
            ),
            child: IconButton(
              onPressed: editar
                  ? () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        String mensaje;
                        String palabraUsuario = controladorTexto.text;

                        if (widget.traduccion.toLowerCase() ==
                            palabraUsuario.toLowerCase()) {
                          mensaje = "Correcto";
                          widget.cambiarImagen("assets/images/quokka-copa.png");
                        } else {
                          mensaje = "Incorrecto";
                        }
                        // Process data.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(mensaje),
                          ),
                        );

                        setState(
                          () {
                            editar = false;
                          },
                        );
                      }
                    }
                  : null,
              icon: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
