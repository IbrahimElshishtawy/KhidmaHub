import 'package:flutter/material.dart';

class NotificationDetailPage extends StatefulWidget {
  const NotificationDetailPage({super.key});

  @override
  State<NotificationDetailPage> createState() => _NotificationdetailpageState();
}

class _NotificationdetailpageState extends State<NotificationDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
