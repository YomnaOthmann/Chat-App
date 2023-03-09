import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Routes.kLogo,
            height: 50,
          ),
          const Text("Chat"),
        ],
      ),
    );
  }
}
