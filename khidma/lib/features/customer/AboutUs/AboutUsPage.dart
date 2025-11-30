// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B5998),
          title: const Text('من نحن'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان وتعريف بسيط
              const Text(
                "مرحبًا بك في خدمة خِدمة",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B5998),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "نقدّم منصة تربط بين العملاء ومقدمي الخدمات المنزلية والخارجية بشكل آمن، سهل وسريع.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),

              // رسالتنا
              _sectionCard(
                icon: Icons.flag_outlined,
                title: "رسالتنا",
                content:
                    "توفير تجربة موثوقة ومريحة للعملاء في طلب الخدمات اليومية، وتمكين مقدمي الخدمات من تحقيق دخل مستدام.",
              ),

              const SizedBox(height: 16),

              // رؤيتنا
              _sectionCard(
                icon: Icons.visibility_outlined,
                title: "رؤيتنا",
                content:
                    "أن نكون المنصة الأولى للخدمات المنزلية والخارجية في المنطقة، مع الحفاظ على أعلى معايير الجودة والأمان.",
              ),

              const SizedBox(height: 16),

              // قيمنا
              _sectionCard(
                icon: Icons.star_border_outlined,
                title: "قيمنا",
                content:
                    "• الثقة والأمان في التعامل.\n• الاحترافية في تقديم الخدمة.\n• سهولة الاستخدام.\n• دعم مستمر للعملاء ومقدمي الخدمات.",
              ),

              const SizedBox(height: 20),

              // أرقام / إحصائيات بسيطة
              const Text(
                "أرقام تهمّك",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B5998),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _statChip("+1000", "مهمة منجزة"),
                  const SizedBox(width: 8),
                  _statChip("+500", "عميل نشط"),
                  const SizedBox(width: 8),
                  _statChip("+300", "مزود خدمة"),
                ],
              ),

              const SizedBox(height: 24),

              // تواصل معنا
              const Text(
                "تواصل معنا",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B5998),
                ),
              ),
              const SizedBox(height: 12),
              _contactRow(
                icon: Icons.email_outlined,
                label: "البريد الإلكتروني",
                value: "support@khidma.com",
              ),
              const SizedBox(height: 8),
              _contactRow(
                icon: Icons.phone_outlined,
                label: "خدمة العملاء",
                value: "+20 100 123 4567",
              ),
              const SizedBox(height: 8),
              _contactRow(
                icon: Icons.location_on_outlined,
                label: "العنوان",
                value: "القاهرة، مصر",
              ),

              const SizedBox(height: 24),

              Center(
                child: Text(
                  "© ${DateTime.now().year} جميع الحقوق محفوظة لخدمة خِدمة",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF3B5998), size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B5998),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statChip(String number, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF2FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B5998),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF3B5998)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xFF3B5998),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
