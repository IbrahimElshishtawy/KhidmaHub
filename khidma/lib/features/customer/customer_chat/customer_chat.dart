// ChatListPage.dart
import 'package:flutter/material.dart';
import 'package:khidma/core/app_routes.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدردشات'),
        backgroundColor: const Color(0xFF3B5998),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search functionality if needed
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // For demonstration, we assume 10 chat rooms
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // Navigate to the chat detail page
              Navigator.pushNamed(
                context,
                AppRoutes
                    .chatDetail, // Use the appropriate route for chat detail
                arguments: {'chatId': index}, // Pass the chat ID (for example)
              );
            },
            leading: const CircleAvatar(
              child: Icon(Icons.person), // Placeholder icon for the chat user
            ),
            title: Text('Chat ${index + 1}'),
            subtitle: const Text('This is the last message in the chat...'),
            trailing: const Text('2m ago'), // Example for time display
          );
        },
      ),
    );
  }
}
