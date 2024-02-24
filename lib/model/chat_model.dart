import 'package:e_repair/view/chat_view.dart';

class Message {
  final String text;
  final String time;
  final Sender sender;

  Message({
    required this.text,
    required this.time,
    required this.sender,
  });
}
