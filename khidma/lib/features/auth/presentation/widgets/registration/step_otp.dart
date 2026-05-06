import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:animate_do/animate_do.dart';

import '../../bloc/register_bloc.dart';
import '../../bloc/register_event.dart';
import '../../bloc/register_state.dart';

class StepOtp extends StatefulWidget {
  const StepOtp({super.key});

  @override
  State<StepOtp> createState() => _StepOtpState();
}

class _StepOtpState extends State<StepOtp> {
  final _pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final data = context.read<RegisterBloc>().state.formData;
    _pinController.text = data.otpCode;
    _pinController.addListener(_updateBloc);

    // Auto-request OTP when this step is shown
    if (!context.read<RegisterBloc>().state.otpSent) {
      context.read<RegisterBloc>().add(const RegisterOtpRequested());
    }
  }

  void _updateBloc() {
    context.read<RegisterBloc>().add(RegisterOtpUpdated(_pinController.text));
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
    );

    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                child: const Text(
                  'التحقق من الهاتف',
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
                  'أدخل الرمز المكون من 6 أرقام المرسل إلى\n${state.formData.countryCode} ${state.formData.phone}',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 200),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Center(
                    child: Pinput(
                      length: 6,
                      controller: _pinController,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyDecorationWith(
                        border: Border.all(color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: 0.2),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      errorPinTheme: defaultPinTheme.copyDecorationWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                      onCompleted: (pin) {
                        context
                            .read<RegisterBloc>()
                            .add(const RegisterOtpVerified());
                      },
                    ),
                  ),
                ),
              ),
              if (state.fieldErrors.containsKey('otp'))
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: FadeIn(
                    child: Text(
                      state.fieldErrors['otp']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),
              const SizedBox(height: 32),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لم تستلم الرمز؟',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    TextButton(
                      onPressed: state.otpCountdown == 0
                          ? () => context
                              .read<RegisterBloc>()
                              .add(const RegisterOtpRequested())
                          : null,
                      child: Text(
                        state.otpCountdown > 0
                            ? 'إعادة الإرسال بعد ${state.otpCountdown}ث'
                            : 'إعادة إرسال',
                        style: TextStyle(
                          color: state.otpCountdown > 0
                              ? Colors.white.withValues(alpha: 0.4)
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
