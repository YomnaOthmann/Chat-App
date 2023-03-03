import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textTitle});
  final String textTitle;
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
        onPressed: () {},
        child: Text(
          textTitle,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
