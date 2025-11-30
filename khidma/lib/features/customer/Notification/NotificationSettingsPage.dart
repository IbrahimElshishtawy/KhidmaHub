// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _allNotifications = true;
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _smsNotifications = false;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  bool _offersNotifications = true;
  bool _systemNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B5998),
          title: const Text('إعدادات الإشعارات'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // تفعيل / إلغاء كل الإشعارات
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: SwitchListTile.adaptive(
                title: const Text(
                  'تفعيل كل الإشعارات',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('تشغيل أو إيقاف جميع أنواع الإشعارات'),
                value: _allNotifications,
                onChanged: (value) {
                  setState(() {
                    _allNotifications = value;
                    _pushNotifications = value;
                    _emailNotifications = value;
                    _smsNotifications = value;
                    _offersNotifications = value;
                    _systemNotifications = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'أنواع الإشعارات',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Column(
                children: [
                  SwitchListTile.adaptive(
                    title: const Text('إشعارات داخل التطبيق'),
                    subtitle: const Text('تنبيهات فورية داخل التطبيق'),
                    value: _pushNotifications,
                    onChanged: _allNotifications
                        ? (value) {
                            setState(() {
                              _pushNotifications = value;
                            });
                          }
                        : null,
                  ),
                  const Divider(height: 0),
                  SwitchListTile.adaptive(
                    title: const Text('إشعارات البريد الإلكتروني'),
                    subtitle: const Text(
                      'استقبال إشعارات عبر البريد الإلكتروني',
                    ),
                    value: _emailNotifications,
                    onChanged: _allNotifications
                        ? (value) {
                            setState(() {
                              _emailNotifications = value;
                            });
                          }
                        : null,
                  ),
                  const Divider(height: 0),
                  SwitchListTile.adaptive(
                    title: const Text('إشعارات الرسائل القصيرة'),
                    subtitle: const Text('إرسال إشعارات عبر SMS'),
                    value: _smsNotifications,
                    onChanged: _allNotifications
                        ? (value) {
                            setState(() {
                              _smsNotifications = value;
                            });
                          }
                        : null,
                  ),
                  const Divider(height: 0),
                  SwitchListTile.adaptive(
                    title: const Text('العروض والتخفيضات'),
                    subtitle: const Text('تنبيهات بالعروض الخاصة والخصومات'),
                    value: _offersNotifications,
                    onChanged: _allNotifications
                        ? (value) {
                            setState(() {
                              _offersNotifications = value;
                            });
                          }
                        : null,
                  ),
                  const Divider(height: 0),
                  SwitchListTile.adaptive(
                    title: const Text('الإشعارات النظامية'),
                    subtitle: const Text('تنبيهات مهمة عن حالة الحساب والمهام'),
                    value: _systemNotifications,
                    onChanged: _allNotifications
                        ? (value) {
                            setState(() {
                              _systemNotifications = value;
                            });
                          }
                        : null,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'الصوت والاهتزاز',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Column(
                children: [
                  SwitchListTile.adaptive(
                    title: const Text('الصوت'),
                    subtitle: const Text('تشغيل نغمة عند وصول الإشعارات'),
                    value: _soundEnabled,
                    onChanged: _allNotifications
                        ? (value) {
                            setState(() {
                              _soundEnabled = value;
                            });
                          }
                        : null,
                  ),
                  const Divider(height: 0),
                  SwitchListTile.adaptive(
                    title: const Text('الاهتزاز'),
                    subtitle: const Text('اهتزاز الجهاز عند وصول الإشعارات'),
                    value: _vibrationEnabled,
                    onChanged: _allNotifications
                        ? (value) {
                            setState(() {
                              _vibrationEnabled = value;
                            });
                          }
                        : null,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // هنا ممكن تحفظ الإعدادات في SharedPreferences أو API لاحقاً
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم حفظ إعدادات الإشعارات بنجاح'),
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text('حفظ الإعدادات'),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
