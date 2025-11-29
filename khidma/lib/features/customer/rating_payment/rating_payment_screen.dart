import 'package:flutter/material.dart';
import '../../../mock/mock_data.dart';
import '../../../core/app_routes.dart';

class RatingPaymentScreen extends StatefulWidget {
  const RatingPaymentScreen({super.key});

  @override
  State<RatingPaymentScreen> createState() => _RatingPaymentScreenState();
}

class _RatingPaymentScreenState extends State<RatingPaymentScreen> {
  int rating = 4;

  @override
  Widget build(BuildContext context) {
    final helper = helperUser;

    return Scaffold(
      appBar: AppBar(title: const Text('التقييم والدفع')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'كيف كانت خدمتك؟',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: helper.avatarUrl.isNotEmpty
                              ? NetworkImage(helper.avatarUrl)
                              : null,
                          child: helper.avatarUrl.isEmpty
                              ? const Icon(Icons.person)
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            helper.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final filled = index < rating;
                        return IconButton(
                          icon: Icon(
                            filled ? Icons.star : Icons.star_border,
                            color: filled ? Colors.amber : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              rating = index + 1;
                            });
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'ملخص الدفع',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('المبلغ الإجمالي'),
                        Text(
                          '150.00 ج.م',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0066FF),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'موظف مؤقت لمدة 3 ساعات',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'طريقة الدفع: الدفع النقدي',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.payment);
                },
                child: const Text('الدفع الآن'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
