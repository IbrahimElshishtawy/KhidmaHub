import 'package:flutter/material.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // التنقل إلى صفحة تعديل الملف الشخصي
              Navigator.pushNamed(context, '/edit-profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/profile_picture.png',
                  ),
                ),
                const SizedBox(width: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'أحمد الرشيد',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'ahmed.alrashid@example.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    // أيقونة التوثيق بجانب البريد الإلكتروني
                    Row(
                      children: [
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'تم التوثيق',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            _buildInfoSection('إجمالي المبلغ الذي جمعه', '5000 ج.م'),
            const SizedBox(height: 16),
            // معلومات الاتصال
            const Divider(height: 2, thickness: 1),
            const SizedBox(height: 12),
            _buildInfoSection('رقم الهاتف', '+20 123 456 7890'),
            const SizedBox(height: 8),
            _buildInfoSection('العنوان', 'مدينة نصر، القاهرة'),
            const SizedBox(height: 16),
            // عرض تفاصيل العمليات
            const Text(
              'تفاصيل العمليات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildDetailSection('عدد العمليات في الوقت المحدد', '5 عمليات'),
            _buildDetailSection('عدد العمليات المتأخرة', '2 عمليات'),
            _buildDetailSection('العمليات الأسرع', '10 دقائق'),
            const SizedBox(height: 16),
            // عرض التقييمات
            const Text(
              'التقييمات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildRatingSection(4.8, 50),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // طريقة لإنشاء قسم لعرض المعلومات الشخصية
  Widget _buildInfoSection(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }

  // طريقة لإنشاء قسم لعرض تفاصيل العمليات
  Widget _buildDetailSection(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }

  // طريقة لإنشاء قسم لعرض التقييمات
  Widget _buildRatingSection(double rating, int reviewCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'التقييم العام',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Text(
                '$rating من 5',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 8),
              Text(
                '($reviewCount تقييمات)',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
