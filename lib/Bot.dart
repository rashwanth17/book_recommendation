import 'package:book/Message.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class Bot extends StatefulWidget {
  const Bot({super.key});

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context, true);
        //     },
        //     color: Colors.grey,
        //     icon: Icon(
        //       Icons.chevron_left,
        //       color: Theme.of(context).colorScheme.primary,
        //     )),
        title: Text(
          "AI CHATBOT",
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Expanded(
              child: MessagesScreen(messages: messages),
            ),

            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.background,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Theme.of(context).colorScheme.primary,
                        decoration: InputDecoration(
                            // hintText: "Type here..",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        // autofocus: true,
                        controller: _controller,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send,
                          color: Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Spacer(),
            SizedBox(
              height: 100,
            )
            // Ensures the TextField stays at the center
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) {
        return;
      }
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message messsage, [bool isUserMessage = false]) {
    messages.add({'message': messsage, 'isUserMessage': isUserMessage});
  }
}
