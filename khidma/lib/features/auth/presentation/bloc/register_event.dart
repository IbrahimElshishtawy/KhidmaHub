import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

/// Step 1 fields updated
class RegisterBasicInfoUpdated extends RegisterEvent {
  final String? name;
  final String? email;
  final String? phone;
  final String? countryCode;

  const RegisterBasicInfoUpdated({this.name, this.email, this.phone, this.countryCode});

  @override
  List<Object?> get props => [name, email, phone, countryCode];
}

/// Step 2 fields updated
class RegisterSecurityUpdated extends RegisterEvent {
  final String? password;
  final String? confirmPassword;

  const RegisterSecurityUpdated({this.password, this.confirmPassword});

  @override
  List<Object?> get props => [password, confirmPassword];
}

/// Request OTP to be sent
class RegisterOtpRequested extends RegisterEvent {
  const RegisterOtpRequested();
}

/// OTP code updated
class RegisterOtpUpdated extends RegisterEvent {
  final String otpCode;

  const RegisterOtpUpdated(this.otpCode);

  @override
  List<Object?> get props => [otpCode];
}

/// OTP verified
class RegisterOtpVerified extends RegisterEvent {
  const RegisterOtpVerified();
}

/// File picked for KYC
class RegisterFilePicked extends RegisterEvent {
  final File file;
  final bool isNationalId; // true = national ID, false = selfie

  const RegisterFilePicked({required this.file, required this.isNationalId});

  @override
  List<Object?> get props => [file, isNationalId];
}

/// Terms agreement toggled
class RegisterTermsToggled extends RegisterEvent {
  const RegisterTermsToggled();
}

/// Attempt to navigate to the next step
class RegisterNextStep extends RegisterEvent {
  const RegisterNextStep();
}

/// Navigate to the previous step
class RegisterPreviousStep extends RegisterEvent {
  const RegisterPreviousStep();
}

/// Final submission
class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}

/// OTP countdown tick
class RegisterOtpTimerTick extends RegisterEvent {
  final int remainingSeconds;

  const RegisterOtpTimerTick(this.remainingSeconds);

  @override
  List<Object?> get props => [remainingSeconds];
}
