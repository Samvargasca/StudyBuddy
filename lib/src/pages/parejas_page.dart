import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';

class ParejasPage extends StatefulWidget {
  const ParejasPage({Key? key}) : super(key: key);

  @override
  _ParejasPage createState() => _ParejasPage();
}

class _ParejasPage extends State<ParejasPage> {
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
        shadowColor: Color.fromARGB(82, 0, 0, 0),
      ),
      body: Column(
        //Se encarga de centrar los elementos verticalmente
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
                    "Parejas",
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

          //Texto de pagina
          const Text(
            "¡Practiquemos!",
            style: TextStyle(fontFamily: "Chewy", fontSize: 48),
          ),
          Image.asset(
            "assets/images/quokka-papeles.png",
            width: 186,
          ),
          const SizedBox(
            width: 185,
            child: Text(
              "¿Listo para formar parejas?",
              style: TextStyle(
                fontFamily: "Aribo",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: gris,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //Boton de inicio
          Container(
            width: 147,
            height: 57,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/parejas/game"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: azulRey,
              ),
              child: const Text(
                "Iniciar",
                style: TextStyle(
                    fontFamily: "Arimo",
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
