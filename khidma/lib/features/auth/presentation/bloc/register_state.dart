import 'package:equatable/equatable.dart';
import '../models/register_params.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final int currentStep;
  final RegisterParams formData;
  final double uploadProgress;
  final RegisterStatus status;
  final String? errorMessage;
  final int otpCountdown;
  final bool otpSent;
  final bool otpVerified;
  final Map<String, String> fieldErrors;

  const RegisterState({
    this.currentStep = 0,
    this.formData = const RegisterParams(),
    this.uploadProgress = 0.0,
    this.status = RegisterStatus.initial,
    this.errorMessage,
    this.otpCountdown = 0,
    this.otpSent = false,
    this.otpVerified = false,
    this.fieldErrors = const {},
  });

  bool get isLastStep => currentStep == 3;
  int get totalSteps => 4;

  RegisterState copyWith({
    int? currentStep,
    RegisterParams? formData,
    double? uploadProgress,
    RegisterStatus? status,
    String? errorMessage,
    int? otpCountdown,
    bool? otpSent,
    bool? otpVerified,
    Map<String, String>? fieldErrors,
  }) {
    return RegisterState(
      currentStep: currentStep ?? this.currentStep,
      formData: formData ?? this.formData,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      status: status ?? this.status,
      errorMessage: errorMessage,
      otpCountdown: otpCountdown ?? this.otpCountdown,
      otpSent: otpSent ?? this.otpSent,
      otpVerified: otpVerified ?? this.otpVerified,
      fieldErrors: fieldErrors ?? this.fieldErrors,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        formData.name,
        formData.email,
        formData.phone,
        formData.password,
        formData.otpCode,
        formData.nationalIdFile?.path,
        formData.selfieFile?.path,
        formData.agreedToTerms,
        uploadProgress,
        status,
        errorMessage,
        otpCountdown,
        otpSent,
        otpVerified,
        fieldErrors,
      ];
}
