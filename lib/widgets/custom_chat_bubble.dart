import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomChatBubble extends StatelessWidget {
  const CustomChatBubble({
    super.key,
    required this.message,
  });
  final Message message;

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
        child: Text(
          message.msg,
          overflow: TextOverflow.clip,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
