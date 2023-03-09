import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        // height: 90,
        // width: 200,

        //alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(30),
                topEnd: Radius.circular(30),
                bottomEnd: Radius.circular(30))),
        child: const Text(
          "Hi Iam a new smnfms",
          overflow: TextOverflow.clip,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
