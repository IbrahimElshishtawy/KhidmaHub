class Order {
  final String id;
  final String title;
  final String location;
  final DateTime dateTime;
  final double price;
  final String status; // pending, accepted, in_progress, completed

  Order({
    required this.id,
    required this.title,
    required this.location,
    required this.dateTime,
    required this.price,
    required this.status,
  });
}
