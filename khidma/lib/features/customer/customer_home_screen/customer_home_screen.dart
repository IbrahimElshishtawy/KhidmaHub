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
  List<Service_model> filteredServices = mockServices.cast<Service_model>();

  // Function to filter services based on search text
  void _filterServices(String query) {
    setState(() {
      filteredServices = query.isEmpty
          ? mockServices.cast<Service_model>()
          : mockServices
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
                .toList();
    });
  }

  // Function to handle the navigation
  void _onNavigationTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushNamed(context, AppRoutes.customerProfile);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.settings);
        break;
      case 3:
        Navigator.pushNamed(
          context,
          AppRoutes.chats,
        ); // Navigate to chat screen
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildAppBar(
          isSearching: isSearching,
          searchController: searchController,
          onSearchToggle: (bool isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
          onSearchChanged: _filterServices,
          context: context,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(
          context,
        ).requestFocus(FocusNode()), // Dismiss keyboard when tapping outside
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCategorySection(),
              const SizedBox(height: 16),
              ServiceList(
                filteredServices: filteredServices,
              ), // Pass filtered services
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onNavigationTapped,
      ),
    );
  }
}
