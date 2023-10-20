import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{
  
  final ScrollController chatScrollController = ScrollController();

   List<Message> messageList = [
    Message(text: 'Hola amor!',fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?',fromWho: FromWho.me),
  ];


  Future<void> sendMessage(String text) async{
    //Implementar Metodo

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBotton();

  }

  void moveScrollToBotton(){
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }


}


