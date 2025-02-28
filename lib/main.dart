import 'package:flutter/material.dart';
import 'package:myb_app/config/theme/app_theme.dart';
import 'package:myb_app/domain/entities/messages.dart';
import 'package:myb_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:myb_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:myb_app/presentation/widgets/providers/chat_provider.dart';
import 'package:myb_app/presentation/widgets/shared/messages_field_box.dart';
import 'package:provider/provider.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  void _changeTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(isDarkMode: _isDarkMode).them(),
        home: Scaffold(
            appBar: AppBar(
              title: Text('My Girl ❤️'),
              actions: [
                IconButton(
                    onPressed: _changeTheme,
                    icon: Icon(
                        _isDarkMode ? Icons.wb_sunny : Icons.nightlight_round))
              ],
              leading: Padding(
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/550x/5a/31/e7/5a31e76112e0a3fc56ff42c2e2df2701.jpg'),
                ),
              ),
            ),
            body: _ChatView(
              isDarkMode: _isDarkMode,
            )),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  final bool isDarkMode;

  const _ChatView({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,  
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessagesBubble(isDarkModeItem: isDarkMode, message: message,)
                          : MyMessagesBubble(
                              isDarkModeItem: isDarkMode,
                              message: message,
                            );
                    })),

            //Caja de Texto
            MessagesFieldBox(
              onValue: (value) => chatProvider.sendMessages(value),
            )
          ],
        ),
      ),
    );
  }
}
