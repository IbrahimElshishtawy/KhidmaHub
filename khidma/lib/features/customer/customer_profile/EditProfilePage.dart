// ignore_for_file: deprecated_member_use, use_build_context_synchronously, file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  XFile? _imageFile; // صورة البطاقة
  XFile? _faceImageFile; // صورة الوجه
  bool _isLoading = false;

  Future<void> _pickDocumentImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _takeFacePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _faceImageFile = pickedFile;
      });
    }
  }

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
                _buildTextField('الاسم', _nameController),
                const SizedBox(height: 16),

                _buildTextField('البريد الإلكتروني', _emailController),
                const SizedBox(height: 16),

                _buildTextField('رقم الهاتف', _phoneController),
                const SizedBox(height: 16),

                _buildTextField('العنوان', _addressController),
                const SizedBox(height: 24),

                // كارد توثيق البطاقة
                _buildImageCard(
                  title: 'توثيق البطاقة',
                  subtitle: 'اضغط لرفع صورة بطاقة الهوية الخاصة بك',
                  icon: Icons.credit_card_rounded,
                  imageFile: _imageFile,
                  onTap: _pickDocumentImage,
                ),
                const SizedBox(height: 16),

                // كارد فحص الوجه
                _buildImageCard(
                  title: 'فحص الوجه',
                  subtitle: 'اضغط لالتقاط صورة لوجهك للتحقق',
                  icon: Icons.face_retouching_natural_rounded,
                  imageFile: _faceImageFile,
                  onTap: _takeFacePhoto,
                ),
                const SizedBox(height: 24),

                Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
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

  // حقل نصي بتصميم لطيف
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

  Widget _buildImageCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    required XFile? imageFile,
  }) {
    final bool hasImage = imageFile != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(22),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              height: 190, // نفس الارتفاع للكاردين
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
                gradient: hasImage
                    ? null
                    : const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                      ),
                color: hasImage ? Colors.grey.shade900 : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: hasImage
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(File(imageFile.path), fit: BoxFit.cover),
                          Container(color: Colors.black.withOpacity(0.35)),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.greenAccent,
                                    size: 26,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        const Text(
                                          'تم اختيار الصورة بنجاح، اضغط لتغييرها',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.9, end: 1.0),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOutBack,
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child: Icon(icon, size: 46, color: Colors.white),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
