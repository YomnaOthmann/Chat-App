import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_chat_bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          List<Message> messagesList = [];
          for (int index = 0; index < snapShot.data!.docs.length; index++) {
            messagesList.add(Message.fromJson(snapShot.data!.docs[index]));
          }
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size(double.maxFinite, 60),
              child: CustomAppBar(),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) =>
                        CustomChatBubble(message: messagesList[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: msgController,
                    decoration: InputDecoration(
                        hintText: "Send a Message",
                        suffixIcon: IconButton(
                          onPressed: () {
                            messages.add({"message": msgController.text});
                            msgController.clear();
                          },
                          icon: const Icon(Icons.send),
                          color: AppColors.kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: AppColors.kPrimaryColor, width: 1),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.kPrimaryColor))),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Text("Loading");
        }
      },
    );
  }
}
