import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';

class CreaPalabras extends StatefulWidget {
  final String palabra;
  final int? clave;
  final Function onTap;

  const CreaPalabras(
      {super.key, required this.palabra, this.clave, required this.onTap});

  @override
  State<CreaPalabras> createState() => _CreaPalabras();
}

class _CreaPalabras extends State<CreaPalabras> {
  Color colorButton = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          widget.onTap();
          setState(() {
            colorButton = Colors.blue;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: const BorderSide(color: azulRey, width: 4),
        ),
        child: Text(
          widget.palabra,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: "Arimo",
              fontWeight: FontWeight.bold,
              fontSize: 32),
        ),
      ),
    );
  }
}
