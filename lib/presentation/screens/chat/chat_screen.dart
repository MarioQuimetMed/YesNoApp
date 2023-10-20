import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';

import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';   

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.ibb.co/99SQF2s/photo-2023-01-04-18-24-23.jpg'),
          ),
           
        ),
        title: const Text('Mi amor :3'),
        shadowColor: Colors.black,
        centerTitle: false,
      ),
      
      body: _ChatView(),


    );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            
            Expanded(child:ListView.builder(
              itemCount: chatProvider.messageList.length,
              
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                ? HerMessageBubble()
                : MyMessageBubble(message: message);
          
              },)
            ),
            
            //Caja de texto papi
             MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
             ),
          ],
        ),
      ),
    );
  }
}