// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/models/task_request.dart';

/// موديل للمساعد
class HelperModel {
  final String id;
  final String name;
  final double rating;
  final String eta; // المعاد المتوقع للوصول

  HelperModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.eta,
  });
}

/// صفحة عرض المساعدين اللي قابلوا المهمة
class HelpersListPage extends StatelessWidget {
  final TaskRequest taskRequest;

  const HelpersListPage({super.key, required this.taskRequest});

  /// بيانات تجريبية (Dummy) للمساعدين
  List<HelperModel> _dummyHelpers() {
    return [
      HelperModel(id: '1', name: 'أحمد علي', rating: 4.8, eta: 'اليوم 5:00 م'),
      HelperModel(id: '2', name: 'محمد حسن', rating: 4.5, eta: 'اليوم 6:30 م'),
      HelperModel(
        id: '3',
        name: 'سارة محمود',
        rating: 4.9,
        eta: 'غدًا 10:00 ص',
      ),
    ];
  }

  void _onAcceptHelper(BuildContext context, HelperModel helper) {
    // الذهاب لصفحة تفاصيل المهمة بعد اختيار المساعد
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            TaskDetailPage(taskRequest: taskRequest, helper: helper),
      ),
    );
  }

  void _onRejectHelper(BuildContext context, HelperModel helper) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('تم رفض ${helper.name}')));
  }

  @override
  Widget build(BuildContext context) {
    final helpers = _dummyHelpers();

    return Scaffold(
      appBar: AppBar(title: const Text('المساعدين المتاحين')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: helpers.length,
        itemBuilder: (context, index) {
          final helper = helpers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    helper.name,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('⭐ ${helper.rating.toStringAsFixed(1)}'),
                      const SizedBox(width: 16),
                      Text('المعاد: ${helper.eta}'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => _onRejectHelper(context, helper),
                        child: const Text('رفض'),
                      ),
                      const SizedBox(width: 8),
                      FilledButton(
                        onPressed: () => _onAcceptHelper(context, helper),
                        child: const Text('قبول'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// صفحة تفاصيل المهمة بعد اختيار المساعد
class TaskDetailPage extends StatelessWidget {
  final TaskRequest taskRequest;
  final HelperModel helper;

  const TaskDetailPage({
    super.key,
    required this.taskRequest,
    required this.helper,
  });

  void _openChat(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChatPage(helper: helper, taskRequest: taskRequest),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل المهمة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'نوع الخدمة: ${taskRequest.serviceType}',
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('الفئة: ${taskRequest.category}', textAlign: TextAlign.right),
            const SizedBox(height: 8),
            Text(
              'التفاصيل: ${taskRequest.description}',
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 8),
            Text(
              'السعر بالساعة: ${taskRequest.hourlyPrice} جنيه',
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 8),
            Text('الموقع: ${taskRequest.location}', textAlign: TextAlign.right),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'المساعد المختار',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('الاسم: ${helper.name}', textAlign: TextAlign.right),
            Text(
              'التقييم: ⭐ ${helper.rating.toStringAsFixed(1)}',
              textAlign: TextAlign.right,
            ),
            Text('المعاد المتوقع: ${helper.eta}', textAlign: TextAlign.right),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _openChat(context),
                icon: const Icon(Icons.chat_bubble_outline),
                label: const Text('فتح المحادثة مع المساعد'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// صفحة الشات البسيطة مع المساعد
class ChatPage extends StatefulWidget {
  final HelperModel helper;
  final TaskRequest taskRequest;

  const ChatPage({super.key, required this.helper, required this.taskRequest});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<_Message> _messages = [
    _Message(
      text: 'أهلاً، أنا في الطريق خلال ساعة إن شاء الله.',
      isFromHelper: true,
    ),
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_Message(text: text, isFromHelper: false));
      _messageController.clear();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('محادثة مع ${widget.helper.name}')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[_messages.length - 1 - index];
                final alignment = msg.isFromHelper
                    ? Alignment.centerLeft
                    : Alignment.centerRight;
                final bubbleColor = msg.isFromHelper
                    ? Colors.grey.shade300
                    : Theme.of(context).colorScheme.primaryContainer;

                return Align(
                  alignment: alignment,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: bubbleColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg.text),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالة...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isFromHelper;

  _Message({required this.text, required this.isFromHelper});
}
