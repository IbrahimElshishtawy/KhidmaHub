import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phoneNumber;
  final String profilePictureUrl;
  final bool isBiometricEnabled;
  final String preferredLanguage; // e.g., 'ar' or 'en'
  final bool isDarkMode;
  final bool notificationsEnabled;
  final List<String> savedAddresses; // Assuming list of serialized addresses or IDs for now

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.phoneNumber,
    this.profilePictureUrl = '',
    this.isBiometricEnabled = false,
    this.preferredLanguage = 'ar',
    this.isDarkMode = false,
    this.notificationsEnabled = true,
    this.savedAddresses = const [],
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        phoneNumber,
        profilePictureUrl,
        isBiometricEnabled,
        preferredLanguage,
        isDarkMode,
        notificationsEnabled,
        savedAddresses,
      ];
}
