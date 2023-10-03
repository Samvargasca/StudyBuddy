import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:study_buddy/src/widgets/barra_inferior.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PalabraPage extends StatefulWidget {
  const PalabraPage({Key? key, this.palabra = "Hola"}) : super(key: key);
  final String palabra;

  @override
  _PalabraPageState createState() => _PalabraPageState();
}

class _PalabraPageState extends State<PalabraPage> {
  _PalabraPageState();

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
        // automaticallyImplyLeading: false,
        backgroundColor: azulClaro,
        shadowColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            Text(
              "${widget.palabra} - ${widget.palabra}",
              style: const TextStyle(
                fontFamily: "Chewy",
                fontSize: 48,
                color: azulOscuro,
              ),
            ),
            const Divider(
              thickness: 4,
              color: azulRey,
              indent: 35,
              endIndent: 35,
            ),
            Text(
              "Significado de ${widget.palabra}",
              style: const TextStyle(
                fontFamily: "Arimo",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: azulOscuro,
              ),
            ),
            Text("Ejemplos de ${widget.palabra}"),
            const BarraInferior(),
          ],
        ),
      ),
    );
  }
}
