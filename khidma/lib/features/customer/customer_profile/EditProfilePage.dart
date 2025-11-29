// ignore_for_file: unnecessary_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  XFile? _imageFile;
  XFile? _faceImageFile;
  bool _isLoading = false; // لتحديد حالة التحميل

  Future<void> _pickDocumentImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  // هذه دالة لفتح الكاميرا والتقاط صورة الوجه
  Future<void> _takeFacePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _faceImageFile = pickedFile;
    });
  }

  // دالة لحفظ التعديلات مع إظهار شريط التحميل
  void _saveChanges() async {
    setState(() {
      _isLoading = true;
    });

    // محاكاة تأخير (لحفظ البيانات أو تنفيذ الطلبات)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // يمكن إضافة منطق لحفظ البيانات هنا
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تم حفظ التعديلات')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تعديل الملف الشخصي')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // تعديل الاسم
                _buildTextField('الاسم', _nameController),
                const SizedBox(height: 16),

                // تعديل البريد الإلكتروني
                _buildTextField('البريد الإلكتروني', _emailController),
                const SizedBox(height: 16),

                // تعديل رقم الهاتف
                _buildTextField('رقم الهاتف', _phoneController),
                const SizedBox(height: 16),

                // تعديل العنوان
                _buildTextField('العنوان', _addressController),
                const SizedBox(height: 16),

                // اختيار صورة التوثيق
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickDocumentImage,
                      child: const Text('اختيار صورة التوثيق'),
                    ),
                    const SizedBox(width: 16),
                    if (_imageFile != null)
                      Image.file(
                        File(_imageFile!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // تصوير الوجه
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _takeFacePhoto,
                      child: const Text('التقاط صورة للوجه'),
                    ),
                    const SizedBox(width: 16),
                    if (_faceImageFile != null)
                      Image.file(
                        File(_faceImageFile!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
                const SizedBox(height: 24),

                // زر حفظ التعديلات
                Center(
                  child: _isLoading
                      ? const CircularProgressIndicator() // شريط تحميل
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _saveChanges();
                            }
                          },
                          child: const Text('حفظ التعديلات'),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // طريقة لإنشاء حقل نصي مع تصميم احترافي
  Widget _buildTextField(String label, TextEditingController controller) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent),
        color: Colors.transparent,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.blueAccent),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'الرجاء إدخال $label';
          }
          return null;
        },
      ),
    );
  }
}
