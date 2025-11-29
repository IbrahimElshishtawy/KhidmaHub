import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool notificationsEnabled = true;
    bool appUpdatesEnabled = true;

    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: StatefulBuilder(
        builder: (context, setState) {
          return ListView(
            children: [
              const SizedBox(height: 8),
              const ListTile(
                title: Text('اللغة'),
                subtitle: Text('العربية'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              SwitchListTile(
                title: const Text('الإشعارات'),
                value: notificationsEnabled,
                onChanged: (val) {
                  setState(() => notificationsEnabled = val);
                },
              ),
              SwitchListTile(
                title: const Text('تحديثات التطبيق التلقائية'),
                value: appUpdatesEnabled,
                onChanged: (val) {
                  setState(() => appUpdatesEnabled = val);
                },
              ),
              const Divider(),
              const ListTile(
                title: Text('إدارة الحساب'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const ListTile(
                title: Text('الخصوصية'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const ListTile(
                title: Text('حول التطبيق'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const Divider(),
              const ListTile(
                title: Text('المساعدة والدعم'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const ListTile(
                title: Text('التواصل معنا'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const ListTile(
                title: Text('تقييم التطبيق'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          );
        },
      ),
    );
  }
}
