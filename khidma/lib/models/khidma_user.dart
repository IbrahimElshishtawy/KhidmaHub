class KhidmaUser {
  final String id;
  final String name;
  final String role; // 'client' أو 'helper'
  final String city;
  final double rating;
  final String avatarUrl;

  KhidmaUser({
    required this.id,
    required this.name,
    required this.role,
    required this.city,
    required this.rating,
    required this.avatarUrl,
  });
}
