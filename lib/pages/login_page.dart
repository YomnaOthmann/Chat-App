import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomTextField(label: "Email"),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 10,
                  ),
                  const CustomTextField(label: "Password"),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomButton(textTitle: "LogIn"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Color(0xffc7ede6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
