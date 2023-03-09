import 'package:chat_app/constants/routes.dart';

class Message {
  final String msg;

  Message(this.msg);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[Routes.kMessage]);
  }
}
