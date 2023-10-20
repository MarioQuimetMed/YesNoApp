
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key,
   required this.onValue
   });

  @override
  Widget build(BuildContext context) {

    //final colors = Theme.of(context).colorScheme;
    

    final textController = TextEditingController();

    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = OutlineInputBorder (
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
      
      
    );

    final inputDecoration = InputDecoration(
        hintText: "Escribe un mensaje",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: Colors.grey.withOpacity(0.5),
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text;
            print("button : $textValue ");
            onValue(textValue);
            textController.clear();
          },
      
        ),
      );


    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus(); // al darle click a otro lado se cierra el text
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print("Submit value $value");
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },


    );
  }
}