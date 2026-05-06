import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:animate_do/animate_do.dart';

import '../../bloc/register_bloc.dart';
import '../../bloc/register_event.dart';
import '../../bloc/register_state.dart';
import '../animated_text_field.dart';

class StepSecurity extends StatefulWidget {
  const StepSecurity({super.key});

  @override
  State<StepSecurity> createState() => _StepSecurityState();
}

class _StepSecurityState extends State<StepSecurity> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    final data = context.read<RegisterBloc>().state.formData;
    _passwordController = TextEditingController(text: data.password);
    _confirmPasswordController =
        TextEditingController(text: data.confirmPassword);

    _passwordController.addListener(_updateBloc);
    _confirmPasswordController.addListener(_updateBloc);
  }

  void _updateBloc() {
    context.read<RegisterBloc>().add(
          RegisterSecurityUpdated(
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
          ),
        );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  'تأمين الحساب',
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
                  'قم بإنشاء كلمة مرور قوية لحماية حسابك',
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
                  controller: _passwordController,
                  label: 'كلمة المرور',
                  hint: '••••••••',
                  prefixIcon: Icons.lock_rounded,
                  isPassword: true,
                  validator: (_) => state.fieldErrors['password'],
                ),
              ),
              const SizedBox(height: 12),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 300),
                child: FlutterPwValidator(
                  controller: _passwordController,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: double.infinity,
                  height: 150,
                  onSuccess: () {},
                  onFail: () {},
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 400),
                child: AnimatedTextField(
                  controller: _confirmPasswordController,
                  label: 'تأكيد كلمة المرور',
                  hint: '••••••••',
                  prefixIcon: Icons.lock_rounded,
                  isPassword: true,
                  validator: (_) => state.fieldErrors['confirmPassword'],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
