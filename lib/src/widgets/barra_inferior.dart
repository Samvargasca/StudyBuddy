import 'package:flutter/material.dart';
import 'package:study_buddy/src/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class BarraInferior extends StatelessWidget {
  const BarraInferior({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)!.settings.name!;
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
              onPressed: () => Navigator.pushNamed(context, "/user"),
              icon: const Icon(
                Icons.home,
                color: azulRey,
              ),
            ),
          ),
          SizedBox(
            child: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/home");
              },
              icon: SvgPicture.asset(
                "assets/images/cards.svg",
                colorFilter: ColorFilter.mode(
                  currentRoute == "/home" ? Colors.white : azulRey,
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
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/user");
            },
            icon: SvgPicture.asset(
              "assets/images/account.svg",
              colorFilter: ColorFilter.mode(
                currentRoute == "/user" ? Colors.white : azulRey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
