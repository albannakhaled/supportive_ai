import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  List<Message> messages = [];

  TextEditingController messageController = TextEditingController();

  void _sendMessage(String text) {
    setState(() {
      messages.add(Message(text: text, isUser: true));
    });

    // Simulating bot's response
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        messages
            .add(Message(text: 'This is the bot\'s response', isUser: false));
      });
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('Chat Bot'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Card(
                  color: Colors.white70,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19)),
                  clipBehavior: Clip.hardEdge,
                  child: ListTile(
                    title: Text(
                      message.text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: message.isUser ? Colors.purple : Colors.black,
                      ),
                    ),
                    trailing: message.isUser
                        ? CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: Colors.purple,
                            ),
                            backgroundColor: Colors.white,
                          )
                        : CircleAvatar(
                            child: Icon(
                              Icons.chat_bubble,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.purple,
                          ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(style: BorderStyle.none),
                        ),
                        fillColor: Color.fromARGB(255, 186, 183, 183),
                        filled: true,
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  FloatingActionButton(
                    onPressed: () {
                      if (messageController.text.isNotEmpty) {
                        _sendMessage(messageController.text);
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.purple,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
