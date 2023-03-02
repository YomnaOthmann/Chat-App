import 'package:chat_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.infinite, child: CustomAppBar()),
    ));
  }
}
