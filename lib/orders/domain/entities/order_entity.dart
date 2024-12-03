class OrderEntity {
  final String? id;
  final OrderStatus? status;
  final bool? isActive;
   double? price;
  final String? company;
  final String? picture;
  final String? buyer;
  final List<String>? tags;
   DateTime? registered;

  OrderEntity({
    required this.id,
    required this.isActive,
     this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
     this.registered,
    required this.status,
  });
}

enum OrderStatus {
  DELIVERED,
  ORDERED,
  RETURNED,
}
