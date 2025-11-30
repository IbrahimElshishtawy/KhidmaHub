// ChatDetailPage.dart
// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final int chatId;
  const ChatDetailPage({super.key, required this.chatId});

  @override
  _ChatDetailPageState createState() {
    return _ChatDetailPageState();
  }
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController messageController = TextEditingController();
  List<String> messages = [
    "Hello, how can I help you?",
    "I need assistance with my service request.",
    "Sure! What seems to be the problem?",
  ]; // Sample messages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دردشة مع العميل'),
        backgroundColor: const Color(0xFF3B5998),
      ),
      body: Column(
        children: [
          // Chat message list
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.grey[200]
                            : Colors.blue[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Message input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "اكتب رسالة...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      messages.add(messageController.text);
                      messageController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
