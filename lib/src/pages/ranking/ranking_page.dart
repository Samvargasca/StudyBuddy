import 'package:flutter/material.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/services/firestore_service.dart';
import 'package:provider/provider.dart';

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

  Future<List<Usuario>> obtenerUsuarios() async {
    FirestoreService firestoreService =
        Provider.of<FirestoreService>(context, listen: false);
    return await firestoreService.obtenerUsuarios();
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
              FutureBuilder(
                  future: obtenerUsuarios(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text("Error al obtener los usuarios");
                    } else {
                      List<Usuario> usuarios = snapshot.data as List<Usuario>;
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            Widget leadingWidget;
                            // Si el usuario es el primero, se le pone un borde amarillo
                            if (index == 0) {
                              leadingWidget = Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: dorado,
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: doradoBorde,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                      fontFamily: "Arimo",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            } else if (index == 1) {
                              // Si el usuario es el segundo, se le pone un borde plateado
                              leadingWidget = Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: plateado,
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: plateadoBorde,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                      fontFamily: "Arimo",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            } else if (index == 2) {
                              // Si el usuario es el tercero, se le pone un borde bronce
                              leadingWidget = Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: bronce,
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: bronceBorde,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                      fontFamily: "Arimo",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              // Si el usuario no es ninguno de los anteriores, se le pone un borde azul
                              leadingWidget = Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: azulRey,
                                      width: 4,
                                    ),
                                  ),
                                ),
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(
                                      fontFamily: "Arimo",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: azulRey,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return ListTile(
                              leading: leadingWidget,
                              title: Text(usuarios[index].usuario),
                              trailing: Text(botonPresionado == "traduccion"
                                  ? "${usuarios[index].tiempoTraduccion} s"
                                  : "${usuarios[index].tiempoParejas} s"),
                            );
                          },
                          itemCount: usuarios.length,
                        ),
                      );
                    }
                  }),
              const BarraInferior(),
            ],
          ),
        ),
      ),
    );
  }
}
