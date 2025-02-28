import 'package:flutter/material.dart';
import 'package:myb_app/domain/entities/messages.dart';

class MyMessagesBubble extends StatelessWidget {
  final bool isDarkModeItem;
  final Message message;
  const MyMessagesBubble(
      {super.key, required this.isDarkModeItem, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: isDarkModeItem ? Colors.red : Colors.purple,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
