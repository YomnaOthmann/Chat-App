import 'package:chat_app/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/snackbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController mailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xff2B475E),
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
                    "Register",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
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
                  SizedBox(height: 10),
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

                  const SizedBox(height: 30),
                  CustomButton(
                      textTitle: "Register",
                      pressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await registerUser();

                            showSnackBar(
                                context, 'Account created successfully ❤️');
                            Navigator.pushReplacementNamed(
                                context, Routes.kChat);
                          } on FirebaseAuthException catch (error) {
                            if (error.code == 'weak-password') {
                              showSnackBar(
                                  context, "The password provided is too weak");
                            } else if (error.code == 'email-already-in-use') {
                              showSnackBar(context,
                                  'The account already exists for that email');
                            }
                          } catch (error) {
                            showSnackBar(context, "There was an error");
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }),
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
        ),
      ),
    );
  }

  Future<UserCredential> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: mailController.text,
      password: passController.text,
    );
    return user;
  }
}
