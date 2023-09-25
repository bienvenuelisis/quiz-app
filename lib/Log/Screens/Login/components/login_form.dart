import 'package:flutter/material.dart';

import '../../../../HomePage/Home.dart';
import '../../../../constants.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameController =
      TextEditingController(); // Ajout du contrôleur pour le nom d'utilisateur
  final nameController =
      TextEditingController(); // Nouveau contrôleur pour le nom
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formfield,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              controller:
                  usernameController, // Utilisation du contrôleur pour le nom d'utilisateur
              decoration: const InputDecoration(
                hintText: "Username",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Entrer un nom d'utilisateur";
                } else if (!RegExp(r"^[A-Z][a-zA-Z0-9]{4,}$").hasMatch(value)) {
                  return "Le nom d'utilisateur doit commencer par une majuscule et contenir au moins 5 caractères alphanumériques.";
                }

                return null;
              },
            ),
            const SizedBox(height: defaultPadding / 2),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: passController,
                obscureText: passToggle,
                textInputAction: TextInputAction.done,
                //obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "MOt de passe",
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Entrer un mot de passe";
                  } else if (passController.text.length < 6) {
                    return "Le mot de passe doit dépasser six caractères";
                  }

                  return null;
                },
              ),
            ),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () {
                  if (_formfield.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Home();
                        },
                      ),
                    );
                  }
                  /*  {
                    String fullName = nameController.text;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(

                        builder: (context) =>
                            HomePage(fullName: fullName),
                      ),
                    );
                  }*/
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Définissez le BorderRadius ici
                  ),
                  minimumSize: const Size(double.infinity,
                      50.0), // Largeur et hauteur personnalisées
                ),
                child: Text(
                  "Se connecter".toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
