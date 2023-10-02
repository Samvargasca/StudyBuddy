import 'package:flutter/material.dart';

class Flashcard extends StatefulWidget {
  const Flashcard(
      {Key? key,
      this.pregunta = "Pregunta",
      this.respuesta = "Respuesta",
      this.width = 219,
      this.height = 178})
      : super(key: key);
  final String pregunta;
  final String respuesta;
  final double width;
  final double height;

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  bool isShowingAnswer = false;

  void toggleCard() {
    setState(() {
      isShowingAnswer = !isShowingAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: toggleCard,
          child: Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: isShowingAnswer
                ? Text(widget.respuesta,
                    style: const TextStyle(
                        fontSize: 40,
                        fontFamily: "Arimo",
                        fontWeight: FontWeight.bold))
                : Text(widget.pregunta,
                    style: const TextStyle(
                        fontSize: 40,
                        fontFamily: "Arimo",
                        fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
