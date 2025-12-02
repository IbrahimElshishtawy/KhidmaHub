// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khidma/features/task/helpers_list_page.dart';
import 'package:khidma/models/task_request.dart'; // ← استخدام الموديل الرسمي

class CreateTaskPage extends StatefulWidget {
  // مثال: "خدمات داخلية" / "خدمات خارجية" / "أخرى"
  final String category;

  const CreateTaskPage({super.key, required this.category});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hourlyPriceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String? _selectedService;
  final List<String> _serviceOptions = const [
    'تنظيف',
    'صيانة',
    'تسوق',
    'مرافقة',
    'أخرى',
  ];

  @override
  void dispose() {
    _serviceTypeController.dispose();
    _descriptionController.dispose();
    _hourlyPriceController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final serviceType = _selectedService == 'أخرى' || _selectedService == null
        ? _serviceTypeController.text.trim()
        : _selectedService!;

    final taskRequest = TaskRequest(
      category: widget.category,
      serviceType: serviceType,
      description: _descriptionController.text.trim(),
      hourlyPrice: double.tryParse(_hourlyPriceController.text.trim()) ?? 0,
      location: _locationController.text.trim(),
    );

    // نذهب مباشرة إلى صفحة المساعدين
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HelpersListPage(taskRequest: taskRequest),
      ),
    );

    // لو حبيت بدل كده ترجع الداتا للصفحة السابقة:
    // Navigator.of(context).pop(taskRequest);
  }

  @override
  Widget build(BuildContext context) {
    final bool isOtherSelected =
        _selectedService == 'أخرى' || _selectedService == null;

    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل المهمة - ${widget.category}')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Dropdown نوع الخدمة
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'نوع الخدمة',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedService,
                  items: _serviceOptions
                      .map(
                        (s) => DropdownMenuItem(
                          value: s,
                          child: Text(s, textAlign: TextAlign.right),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedService = value;
                    });
                  },
                ),
                const SizedBox(height: 12),

                /// حقل كتابة نوع الخدمة في حالة "أخرى" أو لو المستخدم حابب يكتب بنفسه
                if (isOtherSelected)
                  TextFormField(
                    controller: _serviceTypeController,
                    decoration: const InputDecoration(
                      labelText: 'اكتب نوع الخدمة',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if ((value == null || value.trim().isEmpty) &&
                          (_selectedService == null ||
                              _selectedService == 'أخرى')) {
                        return 'من فضلك اكتب نوع الخدمة';
                      }
                      return null;
                    },
                    textAlign: TextAlign.right,
                  ),

                if (isOtherSelected) const SizedBox(height: 12),

                /// تفاصيل المهمة
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'تفاصيل المهمة',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك أدخل تفاصيل المهمة';
                    }
                    return null;
                  },
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),

                /// السعر بالساعة
                TextFormField(
                  controller: _hourlyPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'السعر بالساعة (جنيه)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك أدخل السعر بالساعة';
                    }
                    if (double.tryParse(value) == null) {
                      return 'من فضلك أدخل رقم صحيح';
                    }
                    return null;
                  },
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),

                /// موقع الخدمة
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'موقع الخدمة',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'من فضلك أدخل موقع الخدمة';
                    }
                    return null;
                  },
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 24),

                /// زر إضافة مهمة
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _submit,
                    child: const Text('إضافة مهمة'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
