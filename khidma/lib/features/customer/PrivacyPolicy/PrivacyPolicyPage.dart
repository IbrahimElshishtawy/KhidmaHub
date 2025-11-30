// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // عشان العربية
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B5998),
          title: const Text('سياسة الخصوصية'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان رئيسي
              const Text(
                'نحن نهتم بخصوصيتك',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B5998),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'في تطبيق خدمة نلتزم بحماية خصوصية بياناتك الشخصية، ونستخدمها فقط للأغراض الموضحة في هذه السياسة. يرجى قراءة البنود التالية بعناية لمعرفة كيفية جمع واستخدام وحماية بياناتك.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),

              _buildSection(
                title: '١. البيانات التي نقوم بجمعها',
                content:
                    '• بيانات الحساب مثل الاسم، رقم الهاتف، البريد الإلكتروني.\n'
                    '• بيانات الموقع التقريبية عند استخدام بعض الخدمات التي تحتاج إلى تحديد الموقع.\n'
                    '• بيانات الاستخدام مثل سجل العمليات، الخدمات التي طلبتها، وأوقات الدخول للتطبيق.\n'
                    '• بعض المعلومات الفنية عن الجهاز مثل نوع الجهاز وإصدار نظام التشغيل.',
              ),

              _buildSection(
                title: '٢. كيفية استخدامنا لبياناتك',
                content:
                    '• تقديم الخدمات المطلوبة وربطك بمقدمي الخدمة المناسبين.\n'
                    '• تحسين تجربة استخدام التطبيق وتحليل الأداء.\n'
                    '• إرسال إشعارات هامة عن حالة الطلبات أو تحديثات التطبيق.\n'
                    '• الالتزام بالمتطلبات القانونية والتنظيمية إذا لزم الأمر.',
              ),

              _buildSection(
                title: '٣. مشاركة البيانات مع أطراف أخرى',
                content:
                    'قد نشارك بعض بياناتك مع:\n'
                    '• مقدمي الخدمة (المساعدين) لتنفيذ المهام التي تطلبها.\n'
                    '• مزودي خدمات الدفع لمعالجة المدفوعات بشكل آمن.\n'
                    '• الجهات الرسمية في حال وجود طلب قانوني ملزم.\n\n'
                    'لن نقوم ببيع بياناتك الشخصية لأي طرف ثالث.',
              ),

              _buildSection(
                title: '٤. حماية وأمان البيانات',
                content:
                    'نستخدم مجموعة من الإجراءات التقنية والتنظيمية لحماية بياناتك من الوصول غير المصرح به أو التعديل أو الاستخدام غير القانوني.\n'
                    'مع ذلك، لا يمكن ضمان أمان كامل بنسبة ١٠٠٪ لأي نظام إلكتروني، لذا ننصحك دائماً باختيار كلمات مرور قوية وعدم مشاركتها مع الآخرين.',
              ),

              _buildSection(
                title: '٥. مدة الاحتفاظ بالبيانات',
                content:
                    'نحتفظ ببياناتك الشخصية طالما كان حسابك نشطاً أو طالما كان ذلك ضرورياً لتقديم الخدمات لك، أو وفقاً لما تتطلبه القوانين المعمول بها.',
              ),

              _buildSection(
                title: '٦. حقوقك تجاه بياناتك',
                content:
                    '• يحق لك طلب تحديث أو تصحيح بياناتك الشخصية في أي وقت من خلال إعدادات الحساب.\n'
                    '• يمكنك طلب إغلاق حسابك، وقد يتم الاحتفاظ ببعض البيانات وفقاً لمتطلبات قانونية.\n'
                    '• يمكنك التحكم في إعدادات الإشعارات من خلال إعدادات التطبيق.',
              ),

              _buildSection(
                title: '٧. التعديلات على سياسة الخصوصية',
                content:
                    'قد نقوم بتحديث هذه السياسة من وقت لآخر. سيتم إشعارك بأي تعديل جوهري من خلال التطبيق أو عبر البريد الإلكتروني، مع توضيح تاريخ آخر تحديث.',
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF2FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'باستخدامك لتطبيق خدمة فإنك توافق على سياسة الخصوصية هذه. '
                  'إذا كانت لديك أي استفسارات يمكنك التواصل مع فريق الدعم من خلال صفحة "اتصل بنا".',
                  style: TextStyle(fontSize: 13, height: 1.7),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت بسيطة لبناء كل قسم من السياسة بشكل موحد
  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF3B5998),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade800,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
