// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  String _selectedFilter = 'الكل';

  final List<Map<String, dynamic>> _orders = [
    {
      'id': '#KH-1023',
      'title': 'تنظيف منزل',
      'date': '2025-11-20',
      'status': 'مكتمل',
      'price': '250 ج.م',
    },
    {
      'id': '#KH-1024',
      'title': 'صيانة تكييف',
      'date': '2025-11-22',
      'status': 'جاري التنفيذ',
      'price': '400 ج.م',
    },
    {
      'id': '#KH-1025',
      'title': 'مساعدة تسوّق',
      'date': '2025-11-25',
      'status': 'ملغي',
      'price': '120 ج.م',
    },
    {
      'id': '#KH-1026',
      'title': 'رعاية مسن',
      'date': '2025-11-27',
      'status': 'مكتمل',
      'price': '600 ج.م',
    },
  ];

  List<Map<String, dynamic>> get _filteredOrders {
    if (_selectedFilter == 'الكل') return _orders;
    return _orders.where((o) => o['status'] == _selectedFilter).toList();
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'مكتمل':
        return Colors.green;
      case 'جاري التنفيذ':
        return Colors.orange;
      case 'ملغي':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B5998),
          title: const Text('سجل الطلبات'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 12),

            // فلاتر الحالة (تبويب بسيط)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('الكل'),
                    _buildFilterChip('مكتمل'),
                    _buildFilterChip('جاري التنفيذ'),
                    _buildFilterChip('ملغي'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: _filteredOrders.isEmpty
                  ? const Center(
                      child: Text(
                        'لا توجد طلبات في هذا التصنيف حالياً',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: _filteredOrders.length,
                      itemBuilder: (context, index) {
                        final order = _filteredOrders[index];
                        return _buildOrderCard(order);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت الفلتر Chip
  Widget _buildFilterChip(String label) {
    final bool isSelected = _selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: const Color(0xFF3B5998),
        backgroundColor: Colors.grey[200],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        onSelected: (_) {
          setState(() {
            _selectedFilter = label;
          });
        },
      ),
    );
  }

  // كارت لكل طلب
  Widget _buildOrderCard(Map<String, dynamic> order) {
    final statusColor = _statusColor(order['status'] as String);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // هنا تقدر تفتح صفحة تفاصيل الطلب إذا حبيت
          // Navigator.pushNamed(context, AppRoutes.taskDetail, arguments: ... );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // السطر العلوي: عنوان الخدمة + السعر
              Row(
                children: [
                  Expanded(
                    child: Text(
                      order['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    order['price'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B5998),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // رقم الطلب + التاريخ
              Row(
                children: [
                  Icon(Icons.tag, size: 18, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    order['id'] as String,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    order['date'] as String,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // الحالة + زر التفاصيل
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: statusColor),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: statusColor),
                        const SizedBox(width: 6),
                        Text(
                          order['status'] as String,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      // فتح تفاصيل الطلب
                      // Navigator.pushNamed(context, AppRoutes.taskDetail, arguments: ...);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                    label: const Text('تفاصيل'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF3B5998),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
