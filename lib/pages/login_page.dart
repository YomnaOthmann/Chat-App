import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants/routes.dart';
import '../helper/snackbar.dart';
import '../widgets/custom_button.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController mailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
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
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      }
                      return null;
                    },
                    label: "Email",
                    controller: mailController,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      }
                      return null;
                    },
                    label: "Password",
                    controller: passController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    textTitle: "LogIn",
                    pressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await loginUser();
                          showSnackBar(context, "Logged in sucessfully");
                          Navigator.pushReplacementNamed(context, Routes.kChat);
                        } on FirebaseAuthException catch (error) {
                          if (error.code == 'user-not-found') {
                            showSnackBar(context, "No account for this email");
                          } else if (error.code == 'wrong-password') {
                            showSnackBar(context, "Wrong Password");
                          }
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
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
        ),
      ),
    );
  }

  Future<UserCredential> loginUser() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: mailController.text, password: passController.text);
  }
}
