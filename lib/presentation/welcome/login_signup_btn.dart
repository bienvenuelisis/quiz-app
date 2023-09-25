import 'package:flutter/material.dart';

import '../../constants.dart';
import '../log/screens/login/login_screen.dart';
import '../log/screens/sign_up/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Définissez le BorderRadius ici
              ),
              minimumSize: const Size(
                  double.infinity, 50.0), // Largeur et hauteur personnalisées
            ),
            child: Text(
              "Se connecter".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Définissez le BorderRadius ici
            ),
            backgroundColor: kPrimaryLightColor,
            elevation: 0,
            minimumSize: const Size(
                double.infinity, 50.0), // Largeur et hauteur personnalisées
          ),
          child: Text(
            "S'inscrire".toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
