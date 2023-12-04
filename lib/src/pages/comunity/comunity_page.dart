import 'package:flutter/material.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/services/firestore_service.dart';
import 'package:provider/provider.dart';

class ComunityPage extends StatefulWidget {
  const ComunityPage({super.key});

  @override
  State<ComunityPage> createState() => _ComunityPageState();
}

class _ComunityPageState extends State<ComunityPage> {
  String botonPresionado = "traduccion";

  void cambiarBotonPresionado(String boton) {
    setState(() {
      botonPresionado = boton;
    });
  }

  Future<List<Usuario>> obtenerUsuarios() async {
    FirestoreService firestoreService =
        Provider.of<FirestoreService>(context, listen: false);
    List<Usuario> usuarios = await firestoreService.obtenerUsuarios();

    return usuarios;
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
                        child: usuarios.isEmpty
                            ? const Text(
                                "No hay usuarios registrados",
                                style: TextStyle(
                                  fontFamily: "Arimo",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Container(
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
                                    ),
                                    title: Text(
                                      usuarios[index].usuario,
                                      style: const TextStyle(
                                        fontFamily: "Arimo",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    trailing: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                        color: azulRey,
                                      ),
                                      width: 70,
                                      height: 30,
                                      child: const Center(
                                        child: Text(
                                          "hola",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Arimo",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
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
