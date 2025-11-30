// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  // قائمة الأسئلة والأجوبة
  final List<Map<String, String>> _faqs = [
    {
      'question': 'كيف أستطيع طلب خدمة جديدة؟',
      'answer':
          'يمكنك طلب خدمة جديدة من خلال صفحة الرئيسية، ثم اختيار الفئة المناسبة، وبعدها اختيار الخدمة المطلوبة وملء التفاصيل.',
    },
    {
      'question': 'كيف أتواصل مع مقدم الخدمة؟',
      'answer':
          'بعد قبول مقدم الخدمة لطلبك، سيظهر لك قسم الدردشة في صفحة المهام، ويمكنك التواصل معه مباشرة من هناك.',
    },
    {
      'question': 'هل يمكنني تعديل بيانات الحساب؟',
      'answer':
          'نعم، يمكنك تعديل بياناتك الشخصية من خلال صفحة الملف الشخصي، ثم الضغط على "تعديل الملف الشخصي".',
    },
    {
      'question': 'كيف أتابع حالة المهمة؟',
      'answer':
          'من صفحة المهام، يمكنك اختيار المهمة ومتابعة حالتها (جاري التنفيذ، مكتملة، ملغاة) بالإضافة إلى التفاصيل الأخرى.',
    },
    {
      'question': 'ماذا أفعل إذا واجهت مشكلة في التطبيق؟',
      'answer':
          'يمكنك الدخول إلى صفحة "الدعم الفني" من الإعدادات، وإرسال رسالة للفريق، أو التواصل عبر وسائل الاتصال المتاحة.',
    },
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // فلترة الأسئلة حسب البحث
    final filteredFaqs = _faqs.where((faq) {
      if (_searchQuery.isEmpty) return true;
      final q = faq['question']!.toLowerCase();
      final a = faq['answer']!.toLowerCase();
      return q.contains(_searchQuery.toLowerCase()) ||
          a.contains(_searchQuery.toLowerCase());
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B5998),
          title: const Text(
            'الأسئلة الشائعة',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: [
            // شريط بحث بسيط في الأعلى
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'ابحث في الأسئلة...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF3B5998),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: filteredFaqs.isEmpty
                  ? const Center(
                      child: Text(
                        'لا توجد نتائج مطابقة لبحثك.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      itemCount: filteredFaqs.length,
                      itemBuilder: (context, index) {
                        final faq = filteredFaqs[index];
                        return _buildFaqItem(
                          question: faq['question']!,
                          answer: faq['answer']!,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF3B5998).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.help_outline,
              size: 18,
              color: Color(0xFF3B5998),
            ),
          ),
          title: Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          iconColor: const Color(0xFF3B5998),
          collapsedIconColor: Colors.grey,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
