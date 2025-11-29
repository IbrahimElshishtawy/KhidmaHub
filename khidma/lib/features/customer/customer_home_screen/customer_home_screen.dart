import 'package:flutter/material.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildAppBar.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildBottomNavigationBar.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildCategorySection.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildServiceList.dart';
import 'package:khidma/models/service.dart';
import '../../../mock/mock_data.dart';
import '../../../core/app_routes.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int currentIndex = 0;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Service_model> filteredServices = mockServices
      .cast<Service_model>(); // List to hold filtered services

  // Function to filter services based on search text
  void _filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredServices = mockServices
            .cast<Service_model>(); // Show all services when query is empty
      } else {
        filteredServices = mockServices
            .where(
              (serviceModel) =>
                  serviceModel.title.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ||
                  serviceModel.description.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .cast<Service_model>()
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
            ServiceList(
              filteredServices: filteredServices,
            ), // Passing filtered services
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
