import 'package:flutter/material.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/colors/colors.dart';

class ErroresPage extends StatefulWidget {
  const ErroresPage({Key? key}) : super(key: key);

  @override
  _ErroresPageState createState() => _ErroresPageState();
}

class _ErroresPageState extends State<ErroresPage> {
  List<String> errores = ["Error1", "Error2", "Error3", "Error4", "Error5"];
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
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.home),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.home),
                ),
              ],
            ),
            Container(
              width: 270,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: amarillo,
              ),
              child: const Center(
                child: Text(
                  "Errores hasta el momento",
                  style: TextStyle(
                    fontFamily: "Arimo",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    ErrorCard(palabra: errores[index]),
                itemCount: errores.length,
              ),
            ),
            const BarraInferior(),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}

class ErrorCard extends StatelessWidget {
  const ErrorCard({Key? key, this.palabra = "Palabra"}) : super(key: key);
  final String palabra;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () => print("Hola"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: gris,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          palabra,
          style: const TextStyle(
            fontFamily: "Arimo",
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: azulRey,
          ),
        ),
      ),
    );
  }
}
