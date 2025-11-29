// ignore_for_file: camel_case_types

class Service_model {
  final String id;
  final String title;
  final String description;
  final String categoryIcon; // path لأيقونة أو اسم
  final double price;
  final String duration;

  Service_model({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryIcon,
    required this.price,
    required this.duration,
  });
}
