// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  String _selectedLanguage = 'ar'; // ar أو en
  bool _followSystemLanguage = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لأن الصفحة عربية
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B5998),
          title: const Text(
            'إعدادات اللغة',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // كارت "اتباع لغة الجهاز"
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Row(
                children: [
                  const Icon(Icons.phone_iphone, color: Color(0xFF3B5998)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'استخدام لغة الجهاز',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'تغيير لغة التطبيق تلقائياً بناءً على لغة النظام.',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _followSystemLanguage,
                    activeColor: const Color(0xFF3B5998),
                    onChanged: (value) {
                      setState(() {
                        _followSystemLanguage = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // عنوان اختيار لغة يدوية
            Row(
              children: const [
                Icon(Icons.language, color: Color(0xFF3B5998)),
                SizedBox(width: 8),
                Text(
                  'اختيار اللغة يدويًا',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'في حال إلغاء استخدام لغة الجهاز، يمكنك اختيار لغة التطبيق يدويًا.',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // خيارات اللغات
            Opacity(
              opacity: _followSystemLanguage ? 0.4 : 1,
              child: IgnorePointer(
                ignoring: _followSystemLanguage,
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: RadioListTile<String>(
                        value: 'ar',
                        groupValue: _selectedLanguage,
                        activeColor: const Color(0xFF3B5998),
                        title: const Text('العربية'),
                        subtitle: const Text('عرض التطبيق باللغة العربية.'),
                        onChanged: (value) {
                          setState(() {
                            _selectedLanguage = value!;
                          });
                        },
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: RadioListTile<String>(
                        value: 'en',
                        groupValue: _selectedLanguage,
                        activeColor: const Color(0xFF3B5998),
                        title: const Text('English'),
                        subtitle: const Text('Use the app in English.'),
                        onChanged: (value) {
                          setState(() {
                            _selectedLanguage = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // زر حفظ
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم حفظ إعدادات اللغة بنجاح')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B5998),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('حفظ التغييرات'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
