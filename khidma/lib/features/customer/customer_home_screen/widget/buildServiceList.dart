// ServiceList.dart
// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:khidma/models/service.dart';
import 'package:khidma/core/app_routes.dart';

class ServiceList extends StatelessWidget {
  final List<Service_model> filteredServices;

  const ServiceList({super.key, required this.filteredServices});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredServices.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final service = filteredServices[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.serviceDetails,
              arguments: service, // Pass the selected service to details page
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
                        Icons
                            .directions_car, // Adjust icon based on service type
                        color: const Color(0xFF3B5998),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        service.title, // Display the service title
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
                    child: const Text('استكشاف الخدمة'),
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
