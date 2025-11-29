// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:khidma/core/app_routes.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildBottomNavigationBar.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildCategorySection.dart';
import 'package:khidma/mock/mock_data.dart'; // Ensure this file is correctly imported
import 'package:khidma/models/service.dart'; // Ensure Service or Service_model is correctly imported

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service List')),
      body: Column(
        children: [
          // Category section widget
          buildCategorySection(),

          // Wrap ListView with Expanded to avoid infinite height issue
          Expanded(
            child: buildServiceList(
              mockServices,
              context,
            ), // Pass mockServices directly
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          // Navigate to corresponding routes
          if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.customerProfile);
          } else if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.settings);
          }
        },
      ),
    );
  }

  // Function to build the service list
  Widget buildServiceList(
    List<Service_model> filteredServices,
    BuildContext context,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredServices.length, // Use filteredServices here
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final service = filteredServices[index]; // Use filteredServices here
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.serviceDetails,
              arguments: service, // Pass the correct service
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xFFEAF2FF),
                      child: Icon(
                        Icons.directions_car, // Change icon as needed
                        color: const Color(0xFF3B5998),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        service.title, // Display service title
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF3B5998),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  service.description, // Display service description
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.serviceDetails,
                        arguments: service, // Navigate to service details
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF3B5998), // Text color
                      backgroundColor: Colors.white, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      side: BorderSide(
                        color: Color(0xFF3B5998), // Border color
                        width: 2,
                      ),
                    ),
                    child: const Text('استكشاف الخدمات'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
