class TaskRequest {
  final String category;
  final String serviceType;
  final String description;
  final double hourlyPrice;
  final String location;
  final int hours; // عدد الساعات

  TaskRequest({
    required this.category,
    required this.serviceType,
    required this.description,
    required this.hourlyPrice,
    required this.location,
    required this.hours,
  });
}
