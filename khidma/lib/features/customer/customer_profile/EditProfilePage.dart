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
  bool _isLoading = false;

  Future<void> _pickDocumentImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  // دالة لفتح الكاميرا والتقاط صورة الوجه
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

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

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
                _buildImagePicker(
                  label: 'اختيار صورة التوثيق',
                  onPressed: _pickDocumentImage,
                  icon: Icons.credit_card,
                  imageFile: _imageFile,
                ),
                const SizedBox(height: 16),

                // تصوير الوجه
                _buildImagePicker(
                  label: 'التقاط صورة للوجه',
                  onPressed: _takeFacePhoto,
                  icon: Icons.face,
                  imageFile: _faceImageFile,
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'حفظ التعديلات',
                            style: TextStyle(fontSize: 16),
                          ),
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
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueAccent),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
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

  // طريقة لإظهار الأيقونات والتصميم الخاص بالصور (توثيق أو الوجه)
  Widget _buildImagePicker({
    required String label,
    required VoidCallback onPressed,
    required IconData icon,
    required XFile? imageFile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // زر مستطيل لرفع صورة التوثيق
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, color: Colors.white, size: 35),
              label: Text(label, style: const TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width, 60),
              ),
            ),
            const SizedBox(width: 16),
            if (imageFile != null)
              Container(
                width:
                    MediaQuery.of(context).size.width *
                    0.5, // 50% of screen width
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.file(File(imageFile.path), fit: BoxFit.cover),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(color: Colors.grey.withOpacity(0.6), thickness: 1),
      ],
    );
  }
}
