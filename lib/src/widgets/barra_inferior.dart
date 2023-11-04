import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarraInferior extends StatelessWidget {
  const BarraInferior({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 302,
      height: 42,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: azulClaro,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, "/login"),
              icon: const Icon(
                Icons.home,
                color: azulRey,
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                "assets/images/cards.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                "assets/images/trophy-fill.svg",
                colorFilter: const ColorFilter.mode(
                  azulRey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                "assets/images/high-bars.svg",
                colorFilter: const ColorFilter.mode(
                  azulRey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                "assets/images/account.svg",
                colorFilter: const ColorFilter.mode(
                  azulRey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
