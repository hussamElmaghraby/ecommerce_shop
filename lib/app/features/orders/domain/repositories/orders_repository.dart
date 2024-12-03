import 'package:ecommerce_shop/app/features/orders/domain/entities/order_entity.dart';

abstract class OrderRespository {
  Future<List<OrderEntity>> getOrders();
}
