class OrderEntity {
  final String? id;
  final bool? isActive;
  final String? price;
  final String? company;
  final String? picture;
  final String? buyer;
  final List<String>? tags;
  final String? registered;

  OrderEntity({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.registered,
  });
}
