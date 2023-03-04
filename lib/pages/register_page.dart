import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 75,
              ),
              Image.asset(
                'assets/images/scholar.png',
              ),
              const Text(
                "Scholar Chat",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Pacifico",
                  color: Colors.white,
                ),
              ),
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                label: "Email",
                changed: (mail) {
                  email = mail;
                },
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 10),
              CustomTextField(
                label: "Password",
                changed: (pass) {
                  password = pass;
                },
              ),

              const SizedBox(height: 30),
              CustomButton(
                textTitle: "Register",
                pressed: () async {
                  try {
                    UserCredential user = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                    print(user.user!.displayName);
                  } on FirebaseAuthException catch (error) {
                    if (error.code == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.toString())),
                    );
                    print(error);
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Color(0xffc7ede6)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 75),
            ],
          ),
        ),
      ),
    );
  }
}
