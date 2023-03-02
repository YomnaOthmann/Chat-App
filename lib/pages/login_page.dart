import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Column(
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
            "LogIn",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: "Pacifico",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
