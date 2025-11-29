// ignore_for_file: deprecated_member_use, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:khidma/core/app_routes.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF3B5998),
      currentIndex: widget.currentIndex,
      selectedItemColor: const Color.fromARGB(255, 116, 93, 93),
      unselectedItemColor: Colors.white70,
      onTap: (i) {
        widget.onTap(i);
        if (i == 1) {
          Navigator.pushNamed(context, AppRoutes.customerProfile);
        } else if (i == 2) {
          Navigator.pushNamed(context, AppRoutes.settings);
        } else if (i == 3) {
          Navigator.pushNamed(context, AppRoutes.chats); // Add the chat screen
        }
      },
      type: BottomNavigationBarType.fixed, // Makes the items spaced evenly
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.home_outlined, 0),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.person_outline, 1),
          label: 'ملف شخصي',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.chat_bubble_outline, 2), // Chat icon
          label: 'الدردشات',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.settings_outlined, 3),
          label: 'الإعدادات',
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.currentIndex == index
            ? Colors.white.withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: widget.currentIndex == index
                ? Colors.white.withOpacity(0.3)
                : Colors.transparent,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: widget.currentIndex == index
            ? 30
            : 25, // Adjusted icon size for active state
        color: widget.currentIndex == index ? Colors.white : Colors.white70,
      ),
    );
  }
}
