import 'package:flutter/material.dart';
import 'package:khidma/features/customer/customer_home_screen/HomeScreen.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildBottomNavigationBar.dart';
import 'package:khidma/features/customer/setting/settings_screen.dart';
import 'package:khidma/models/service.dart';
import 'package:khidma/mock/mock_data.dart';
import 'package:khidma/features/customer/customer_profile/customer_profile_screen.dart';
import 'package:khidma/features/customer/customer_chat/customer_chat.dart';
import 'package:khidma/features/customer/Tasks/TasksPage.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int currentIndex = 0;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Service_model> filteredServices = mockServices.cast<Service_model>();
  // Function to handle the navigation
  void _onNavigationTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // Display content based on the selected tab
        children: [
          const ChatListPage(),
          const TasksPage(),
          const HomeScreen(),
          const CustomerProfileScreen(),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onNavigationTapped,
      ),
    );
  }
}
