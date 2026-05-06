import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:animate_do/animate_do.dart';

import '../../bloc/register_bloc.dart';
import '../../bloc/register_event.dart';
import '../../bloc/register_state.dart';
import '../animated_text_field.dart';

class StepBasicInfo extends StatefulWidget {
  const StepBasicInfo({super.key});

  @override
  State<StepBasicInfo> createState() => _StepBasicInfoState();
}

class _StepBasicInfoState extends State<StepBasicInfo> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final data = context.read<RegisterBloc>().state.formData;
    _nameController = TextEditingController(text: data.name);
    _emailController = TextEditingController(text: data.email);
    _phoneController = TextEditingController(text: data.phone);

    _nameController.addListener(_updateBloc);
    _emailController.addListener(_updateBloc);
    _phoneController.addListener(_updateBloc);
  }

  void _updateBloc() {
    context.read<RegisterBloc>().add(
          RegisterBasicInfoUpdated(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
          ),
        );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.fieldErrors != current.fieldErrors,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                child: const Text(
                  'المعلومات الأساسية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 100),
                child: Text(
                  'أخبرنا عن نفسك للبدء',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 200),
                child: AnimatedTextField(
                  controller: _nameController,
                  label: 'الاسم الكامل',
                  hint: 'أحمد محمد',
                  prefixIcon: Icons.person_rounded,
                  validator: (_) => state.fieldErrors['name'],
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 300),
                child: AnimatedTextField(
                  controller: _emailController,
                  label: 'البريد الإلكتروني',
                  hint: 'example@email.com',
                  prefixIcon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (_) => state.fieldErrors['email'],
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 400),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: state.fieldErrors.containsKey('phone')
                          ? Colors.redAccent.withValues(alpha: 0.8)
                          : Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  child: IntlPhoneField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      labelStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      counterText: "",
                    ),
                    style: const TextStyle(color: Colors.white),
                    dropdownTextStyle: const TextStyle(color: Colors.white),
                    dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    initialCountryCode: 'EG',
                    onChanged: (phone) {
                      context.read<RegisterBloc>().add(
                            RegisterBasicInfoUpdated(
                              countryCode: phone.countryCode,
                            ),
                          );
                    },
                  ),
                ),
              ),
              if (state.fieldErrors.containsKey('phone'))
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 12, left: 12),
                  child: Text(
                    state.fieldErrors['phone']!,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
