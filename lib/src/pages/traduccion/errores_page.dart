import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:study_buddy/src/colors/colors.dart';
import 'package:study_buddy/src/pages/traduccion/palabra_page.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.rotate(
                    angle: -90 * 3.141592 / 180,
                    child: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(
                        "assets/images/up-arrow.svg",
                        colorFilter: const ColorFilter.mode(
                          verde,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: rojo,
                      size: 37,
                    ),
                  ),
                ],
              ),
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
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PalabraPage(
                palabra: palabra,
              ),
            ),
          );
        },
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
