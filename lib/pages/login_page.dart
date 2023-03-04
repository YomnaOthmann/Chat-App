import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../constants/routes.dart';
import '../widgets/custom_button.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
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
              CustomTextField(
                label: "Email",
                changed: (mail) {},
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                label: "Password",
                changed: (pass) {},
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                textTitle: "LogIn",
                pressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.kRegister);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Color(0xffc7ede6)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              )
            ],
          ),
        ),
      ),
    );
  }
}
