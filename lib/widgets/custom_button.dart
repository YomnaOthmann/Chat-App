import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.textTitle, required this.pressed});
  final String textTitle;
  final VoidCallback pressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      width: double.maxFinite,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        onPressed: pressed,
        child: Text(
          textTitle,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
