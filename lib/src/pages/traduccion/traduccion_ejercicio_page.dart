import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/services/firestore_service.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/widgets/flashcard.dart';

import '../../data_structures/queue.dart' as queue;

class TraduccionEjercicioPage extends StatefulWidget {
  const TraduccionEjercicioPage({Key? key}) : super(key: key);

  @override
  _TraduccionEjercicioPageState createState() =>
      _TraduccionEjercicioPageState();
}

class _TraduccionEjercicioPageState extends State<TraduccionEjercicioPage> {
  String imagenAsset = "assets/images/quokka-pregunta.png";
  Palabra? palabra;

  bool answeredForm = false;

  void cambiarImagen(String nuevaRuta) {
    setState(() {
      imagenAsset = nuevaRuta;
    });
  }

  queue.Queue words = queue.Queue(10);

  void cargarPalabras() async {
    final FirestoreService firestoreService = FirestoreService();
    final List<Palabra> palabras = await firestoreService.getPalabras();
    palabras.shuffle();
    for (int i = 0; i < 10; i++) {
      words.enqueue(palabras[i]);
    }

    setState(() {
      palabra = words.dequeue();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarPalabras();
  }

  @override
  Widget build(BuildContext context) {
    if (palabra == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
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
                      const Temporizador(),
                      IconButton(
                        onPressed: () => Navigator.pop(
                            context), // Volver a la página anterior
                        icon: const Icon(
                          Icons.cancel,
                          color: rojo,
                          size: 37,
                        ),
                      ),
                    ],
                  ),
                  Flashcard(
                    pregunta: palabra!.ingles,
                    respuesta: palabra!.definicion,
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
                  Formulario(
                    palabra!.espanol,
                    cambiarImagen,
                    onFormAnswered: () {
                      setState(() {
                        answeredForm = true;
                      });
                    },
                  ),
                  Image.asset(
                    imagenAsset,
                    width: 159,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                      if (answeredForm)
                        ElevatedButton(
                          onPressed: () => null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: azulClaro,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Siguiente",
                            style: TextStyle(
                              color: azulOscuro,
                              fontFamily: "Arimo",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const BarraInferior(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario(this.traduccion, this.cambiarImagen,
      {super.key, required this.onFormAnswered});
  final String traduccion;
  final Function(String) cambiarImagen;
  final VoidCallback onFormAnswered;

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controladorTexto = TextEditingController();

  bool editar = true;

  Color colorCampoTexto = Colors.white;

  Color colorTexto = Colors.black;

  String palabraUsuario = "";

  void actualizarColorCampoTexto(bool correcto) {
    setState(() {
      if (correcto) {
        colorCampoTexto = verde;
      } else {
        colorCampoTexto = rojo;
      }
    });
  }

  void actualizarColorTexto() {
    setState(() {
      colorTexto = Colors.white;
    });
  }

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
              style: TextStyle(
                color: colorTexto,
                fontFamily: "Arimo",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              onSaved: (newValue) => palabraUsuario = newValue!,
              decoration: InputDecoration(
                hintText: 'Escribe la traducción en español',
                fillColor: colorCampoTexto,
                filled: true,
                border: const OutlineInputBorder(
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
                        _formKey.currentState!.save();

                        String mensaje;
                        bool correcto = widget.traduccion.toLowerCase() ==
                            palabraUsuario.toLowerCase();

                        if (correcto) {
                          mensaje = "Correcto";
                          widget.cambiarImagen("assets/images/quokka-copa.png");
                        } else {
                          mensaje = "Incorrecto";
                        }

                        actualizarColorCampoTexto(correcto);
                        actualizarColorTexto();
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

                        widget.onFormAnswered();
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

class Temporizador extends StatefulWidget {
  const Temporizador({super.key});

  @override
  State<Temporizador> createState() => _TemporizadorState();
}

class _TemporizadorState extends State<Temporizador> {
  int segundos = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        segundos++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.timer,
          color: azulRey,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: azulRey,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "${segundos ~/ 60}:${(segundos % 60).toString().padLeft(2, '0')}",
            style: const TextStyle(
              fontFamily: "Arimo",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
