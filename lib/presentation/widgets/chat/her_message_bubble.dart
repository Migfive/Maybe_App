import 'package:flutter/material.dart';
import 'package:myb_app/domain/entities/messages.dart';

class HerMessagesBubble extends StatelessWidget {
  final bool isDarkModeItem;
  final Message message;
  const HerMessagesBubble(
      {super.key, required this.isDarkModeItem, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: isDarkModeItem ? Colors.deepPurple : Colors.blueGrey,
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
        //TODO: Image
        ,
        _ImageBubble(message.imageUrl!),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl; 
  const _ImageBubble(this.imageUrl); 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Mi amor está enviando una imagen'),
            );
          },
        ));
  }
}
