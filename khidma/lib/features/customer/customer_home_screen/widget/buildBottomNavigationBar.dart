// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: BottomAppBar(
        color: const Color(0xFF3B5998), // You can change the color here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Left side: Home, Chats
            _buildBottomNavItem(
              icon: Icons.chat_bubble_outline,
              index: 0,
              label: 'الدردشات',
            ),
            _buildBottomNavItem(
              icon: Icons.task_outlined,
              index: 1,
              label: 'المهام',
            ),
            _buildBottomNavItem(
              icon: Icons.home_outlined,
              index: 2,
              label: 'الرئيسية',
            ),
            _buildBottomNavItem(
              icon: Icons.person_outline,
              index: 3,
              label: 'الملف الشخصي',
            ),
            _buildBottomNavItem(
              icon: Icons.settings_outlined,
              index: 4,
              label: 'الإعدادات',
            ),
          ],
        ),
      ),
    );
  }

  // Build the icon for the bottom nav items
  Widget _buildBottomNavItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {
        widget.onTap(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: widget.currentIndex == index
                ? Colors.white.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
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
            size: widget.currentIndex == index ? 30 : 25,
            color: widget.currentIndex == index ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }
}
