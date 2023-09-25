import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 5,
              child: Lottie.asset(
                "assets/lottiesfiles/tropheec.json",
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Bienvenue sur notre application de quizz",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: defaultPadding * 4),
      ],
    );
  }
}
