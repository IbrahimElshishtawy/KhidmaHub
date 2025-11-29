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
    return BottomAppBar(
      color: const Color(0xFF3B5998),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Chats and Settings
          Row(
            children: [
              _buildBottomNavItem(
                icon: Icons.chat_bubble_outline,
                index: 0,
                label: 'الدردشات',
              ),
              _buildBottomNavItem(
                icon: Icons.settings_outlined,
                index: 1,
                label: 'الإعدادات',
              ),
            ],
          ),
          // Center: Home
          _buildCenterIcon(),
          // Right side: Profile and Tasks
          Row(
            children: [
              _buildBottomNavItem(
                icon: Icons.person_outline,
                index: 2,
                label: 'ملف شخصي',
              ),
              _buildBottomNavItem(
                icon: Icons.task_outlined,
                index: 3,
                label: 'المهام',
              ),
            ],
          ),
        ],
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
        // You can use Navigator here to navigate to the desired page
        if (index == 0) {
          Navigator.pushNamed(context, AppRoutes.chats);
        } else if (index == 1) {
          Navigator.pushNamed(context, AppRoutes.settings);
        } else if (index == 2) {
          Navigator.pushNamed(context, AppRoutes.customerProfile);
        } else if (index == 3) {
          Navigator.pushNamed(context, AppRoutes.tasks);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Icon(
          icon,
          size: widget.currentIndex == index ? 30 : 25,
          color: widget.currentIndex == index ? Colors.white : Colors.white70,
        ),
      ),
    );
  }

  // Build the center "Home" icon
  Widget _buildCenterIcon() {
    return GestureDetector(
      onTap: () {
        widget.onTap(4);
        Navigator.pushNamed(context, AppRoutes.home); // Home route
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.currentIndex == 4
              ? Colors.white.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: widget.currentIndex == 4
                  ? Colors.white.withOpacity(0.3)
                  : Colors.transparent,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.home_outlined,
          size: widget.currentIndex == 4 ? 30 : 25,
          color: widget.currentIndex == 4 ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}
