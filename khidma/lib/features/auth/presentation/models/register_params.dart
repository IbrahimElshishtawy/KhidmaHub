import 'dart:io';

/// Holds all registration form data across the 4 steps.
class RegisterParams {
  // Step 1 — Basic Info
  final String name;
  final String email;
  final String phone;
  final String countryCode;

  // Step 2 — Security
  final String password;
  final String confirmPassword;

  // Step 3 — OTP
  final String otpCode;

  // Step 4 — KYC
  final File? nationalIdFile;
  final File? selfieFile;

  // Terms
  final bool agreedToTerms;

  const RegisterParams({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.countryCode = '+20',
    this.password = '',
    this.confirmPassword = '',
    this.otpCode = '',
    this.nationalIdFile,
    this.selfieFile,
    this.agreedToTerms = false,
  });

  RegisterParams copyWith({
    String? name,
    String? email,
    String? phone,
    String? countryCode,
    String? password,
    String? confirmPassword,
    String? otpCode,
    File? nationalIdFile,
    File? selfieFile,
    bool? agreedToTerms,
  }) {
    return RegisterParams(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      otpCode: otpCode ?? this.otpCode,
      nationalIdFile: nationalIdFile ?? this.nationalIdFile,
      selfieFile: selfieFile ?? this.selfieFile,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
    );
  }
}
