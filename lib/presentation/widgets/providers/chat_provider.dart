import 'package:flutter/material.dart';
import 'package:myb_app/config/helpers/get_yes_no_answer.dart';
import 'package:myb_app/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];
  Future<void> sendMessages(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')){
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async{
    final herMesseges = await getYesNoAnswer.getAnswer();
    messageList.add(herMesseges); 
    notifyListeners();
    moveScrollToBottom(); 
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
