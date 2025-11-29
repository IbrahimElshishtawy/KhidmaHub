import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildAppBar.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildBottomNavigationBar.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildCategorySection.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildServiceList.dart';
import '../../../mock/mock_data.dart';
import '../../../core/app_routes.dart';
// ignore: unused_import
import 'package:khidma/models/service.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int currentIndex = 0;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Service> filteredServices = mockServices
      .cast<Service>(); // List to hold filtered services

  // Function to filter services based on search text
  void _filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredServices = mockServices
            .cast<Service>(); // Show all services when query is empty
      } else {
        filteredServices = mockServices
            .where(
              (service) =>
                  service.title.toLowerCase().contains(query.toLowerCase()) ||
                  service.description.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .cast<Service>()
            .toList(); // Filter services based on query
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildAppBar(
          isSearching: isSearching,
          searchController: searchController,
          onSearchToggle: (bool p1) {
            setState(() {
              isSearching = p1;
            });
          },
          onSearchChanged: _filterServices, // Adding the search functionality
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategorySection(),
            const SizedBox(height: 16),
            ServiceList(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.customerProfile);
          } else if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.settings);
          }
        },
      ),
    );
  }
}
