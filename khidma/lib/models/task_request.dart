// lib/models/task_request.dart

class TaskRequest {
  final String category;
  final String serviceType;
  final String description;
  final double hourlyPrice;
  final String location;

  TaskRequest({
    required this.category,
    required this.serviceType,
    required this.description,
    required this.hourlyPrice,
    required this.location,
  });
}
