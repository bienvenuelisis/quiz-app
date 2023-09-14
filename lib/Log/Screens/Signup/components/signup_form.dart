import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameController = TextEditingController(); // Ajout du contrôleur pour le nom d'utilisateur
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
              controller: usernameController, // Utilisation du contrôleur pour le nom d'utilisateur
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
              },
            ),
            const SizedBox(height: defaultPadding / 2),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
                ),
              ),
              validator: (value) {
                bool emailValid = RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                ).hasMatch(value!);

                if (value.isEmpty) {
                  return "Entrer un email";
                } else if (!emailValid) {
                  return "Entrer un email valide";
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: passController,
                obscureText: passToggle,
                textInputAction: TextInputAction.done,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Mot de passe",
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
                    child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Entrer un mot de passe";
                  } else if (passController.text.length < 6)
                    return "Le mot de passe doit dépasser six caractères";
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (_formfield.currentState!.validate()) {
                  print("Succès");
                  emailController.clear();
                  passController.clear();
                  usernameController.clear(); // Effacer le champ username après succès
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Définissez le BorderRadius ici
                ),
                minimumSize: const Size(double.infinity, 50.0), // Largeur et hauteur personnalisées
              ),
              child: Text("S'inscrire".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
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
