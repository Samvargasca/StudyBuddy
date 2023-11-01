import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_buddy/src/app.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/widgets/creador_palabras.dart';

class ParejasGame extends StatefulWidget {
  const ParejasGame({Key? key}) : super(key: key);
  @override
  State<ParejasGame> createState() => _ParejasGame();
}

class _ParejasGame extends State<ParejasGame> {
  //!Variables
  List<String> palabrasA = ["pal1", "pal2", "pal3", "pal4", "pal5"];
  List<String> palabrasB = ["pal4", "pal3", "pal2", "pal5", "pal1"];
  int selectedButtonIndexA =
      -1; // Indice del botón seleccionado en la columna A
  int selectedButtonIndexB =
      -1; // Indice del botón seleccionado en la columna B
  int puntosNegativos = 0;
  double timeRemaining = 1.0;

  int aciertos = 0;
  int desaciertos = 0;
  Timer? timer;// Contador de desaciertos

  @override
  void initState() {
    super.initState();

    // Iniciar el temporizador en initState
    timer = Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      setState(() {
        timeRemaining -= 0.001;
        if (timeRemaining <= 0) {
          timer.cancel();
          mostrarMensaje();
        }
      });
    });
  }


  void mostrarMensaje() {
  timeRemaining = 1.0; // Reiniciar el temporizador
  // Calcula el recuento de aciertos y desaciertos aquí
    //TODO Poner haciertos y desaciertos
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("¡Tiempo agotado!"),
        content: Text("Aciertos: $aciertos\nDesaciertos: $desaciertos"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp())); // Navegar al menú principal
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!Barra superior
      appBar: AppBar(
        title: const Text(
          "StudyBuddy",
          style: TextStyle(
            fontFamily: "Chewy",
            fontSize: 32,
          ),
        ),
        automaticallyImplyLeading: false, // Eliminar el ícono de "atrás"
        backgroundColor: azulClaro,
      ),
      //!Cuerpo
      body: Column(
        children: [
          //!Barra superior con opcion de salida
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: azulOscuro),
                child: const Center(
                  child: Text("Parejas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Arimo",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(width: 105),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel, color: rojo, size: 37),
              ),  
            ],
            
          ),
        const SizedBox(height: 10),
           
        //!Barra de progreso
        Container(
          width: 350,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), // Ajusta el valor para el redondeo deseado// Agrega un borde si lo deseas
            border: Border.all(color: azulClaro), // Agrega un borde si lo deseas

          ),
          child: LinearProgressIndicator(
            value: timeRemaining,
            backgroundColor: Colors.grey,
            minHeight: 10,
            valueColor: AlwaysStoppedAnimation<Color>(
              timeRemaining < 0.5 ? Colors.red : azulClaro,
            ),
             // Opciones: butt, round, square
        
          ),
        ),

        const SizedBox(height: 10),
          //!Cuerpo del juego
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: palabrasA.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            
                            child: CreaPalabras(
                              palabra: palabrasA[index],
                              isSelected: index == selectedButtonIndexA,
                              onTap: () {
                                setState(() {
                                  selectedButtonIndexA = index;
                                  //selectedButtonIndexB = -1; // Reiniciar la selección en la columna B
                                  if (selectedButtonIndexB != -1) {
                                    if (palabrasA[selectedButtonIndexA] ==
                                        palabrasB[
                                            selectedButtonIndexB]) // !Si lo que hay en el indice seleccionado de la columna A es igual a lo que hay en el indice seleccionado de la columna B se eliminan ambos elementos de las listas

                                    {
                                      palabrasA.removeAt(selectedButtonIndexA);
                                      palabrasB.removeAt(selectedButtonIndexB);
                                      selectedButtonIndexA = -1;
                                      selectedButtonIndexB = -1;
                                    } else {
                                      puntosNegativos++;
                                      //print(puntosNegativos);
                                    }
                                  }
                                });
                              },
                            ));
                      }),
                ),
                const SizedBox(width: 35),
                Expanded(
                  child: ListView.builder(
                      itemCount: palabrasB.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: CreaPalabras(
                              palabra: palabrasB[index],
                              isSelected: index == selectedButtonIndexB,
                              onTap: () {
                                setState(() {
                                  selectedButtonIndexB = index;
                                  //selectedButtonIndexA = -1; // Reiniciar la selección en la columna A
                                  if (selectedButtonIndexA != -1) {
                                    if (palabrasA[selectedButtonIndexA] ==
                                        palabrasB[selectedButtonIndexB]) {
                                      palabrasA.removeAt(selectedButtonIndexA);
                                      palabrasB.removeAt(selectedButtonIndexB);
                                      selectedButtonIndexA = -1;
                                      selectedButtonIndexB = -1;
                                    } else {
                                      puntosNegativos++;
                                      //print(puntosNegativos);
                                    }
                                  }
                                });
                              },
                            ));
                      }),
                ),
              ],
            ),
          ),
          
          const BarraInferior(),
        ],
      ),
    );
  }
}

