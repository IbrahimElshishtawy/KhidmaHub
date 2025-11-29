class Order {
  String id;
  String title;
  String location;
  DateTime dateTime;
  double price;
  String status; // يجب أن تكون قابلة للتغيير، لذا لا نستخدم final هنا.

  Order({
    required this.id,
    required this.title,
    required this.location,
    required this.dateTime,
    required this.price,
    required this.status,
  });
}
