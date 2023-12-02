import 'package:flutter/material.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/services/firestore_service.dart';
import 'package:provider/provider.dart';

class PalabrasListaPage extends StatefulWidget {
  const PalabrasListaPage({super.key});

  @override
  State<PalabrasListaPage> createState() => _PalabrasListaPageState();
}

class _PalabrasListaPageState extends State<PalabrasListaPage> {
  String botonPresionado = "sustantivos";

  void cambiarBotonPresionado(String boton) {
    setState(() {
      botonPresionado = boton;
    });
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hola"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: azulOscuro,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text(
                  "Palabras",
                  style: TextStyle(
                    fontFamily: "Arimo",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("sustantivos"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40),
                        backgroundColor: botonPresionado == "sustantivos"
                            ? azulRey
                            : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Sustantivos",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "sustantivos"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("adjetivos"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40),
                        backgroundColor: botonPresionado == "adjetivos"
                            ? azulRey
                            : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Adjetivos",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "adjetivos"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("verbos"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40),
                        backgroundColor:
                            botonPresionado == "verbos" ? azulRey : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Verbos",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "verbos"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("adverbios"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40),
                        backgroundColor: botonPresionado == "adverbios"
                            ? azulRey
                            : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Adverbios",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "adverbios"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("preposiciones"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40),
                        backgroundColor: botonPresionado == "preposiciones"
                            ? azulRey
                            : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Preposiciones",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "preposiciones"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("otros"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 40),
                        backgroundColor:
                            botonPresionado == "otros" ? azulRey : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Otros",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "otros"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(botonPresionado),
              ),
              const BarraInferior(),
            ],
          ),
        ),
      ),
    );
  }
}
