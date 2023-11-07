import 'package:flutter/material.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/constants/colors.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  String botonPresionado = "traduccion";

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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: azulOscuro,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const Text(
                  "Ranking",
                  style: TextStyle(
                    fontFamily: "Arimo",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("traduccion"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: botonPresionado == "traduccion"
                            ? azulRey
                            : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Traducción",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "traduccion"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => cambiarBotonPresionado("parejas"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            botonPresionado == "parejas" ? azulRey : azulClaro,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Parejas",
                        style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: botonPresionado == "parejas"
                              ? Colors.white
                              : azulRey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const BarraInferior(),
            ],
          ),
        ),
      ),
    );
  }
}
