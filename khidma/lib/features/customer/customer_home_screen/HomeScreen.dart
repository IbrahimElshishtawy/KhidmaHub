// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildAppBar.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildCategorySection.dart';
import 'package:khidma/features/customer/customer_home_screen/widget/buildServiceList.dart';
import 'package:khidma/models/service.dart';

import '../../../mock/mock_data.dart';
import '../../task/create_task_page.dart'; // <- تأكد من المسار الفعلي لصفحة إنشاء المهمة

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  // List to hold filtered services
  List<Service_model> filteredServices = mockServices.cast<Service_model>();

  void _filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredServices = mockServices.cast<Service_model>();
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
            .toList();
      }
    });
  }

  void _openCreateTask(String category) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CreateTaskPage(category: category)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: buildAppBar(
          isSearching: isSearching,
          searchController: searchController,
          onSearchToggle: (bool value) {
            setState(() {
              isSearching = value;
            });
          },
          onSearchChanged: _filterServices,
          context: context,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // هيدر بسيط
              const Text(
                'مرحبا بك 👋',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'اختر نوع الخدمة لبدء إنشاء مهمة جديدة',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              /// ====== 3 كروت الفئات الرئيسية (داخلي / خارجي / أخرى) ======
              Row(
                children: [
                  Expanded(
                    child: _CategoryCard(
                      title: 'خدمات داخلية',
                      icon: Icons.home_repair_service_outlined,
                      onTap: () => _openCreateTask('خدمات داخلية'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _CategoryCard(
                      title: 'خدمات خارجية',
                      icon: Icons.directions_walk_outlined,
                      onTap: () => _openCreateTask('خدمات خارجية'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _CategoryCard(
                      title: 'أخرى',
                      icon: Icons.more_horiz_outlined,
                      onTap: () => _openCreateTask('أخرى'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// ====== سيكشن الكاتيجوريز (لو عندك UI إضافي في buildCategorySection) ======
              buildCategorySection(),

              const SizedBox(height: 16),

              /// ====== قائمة الخدمات (مع الفلترة) ======
              ServiceList(filteredServices: filteredServices),
            ],
          ),
        ),
      ),
    );
  }
}

/// كارت للفئات الرئيسية في الهوم
class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
