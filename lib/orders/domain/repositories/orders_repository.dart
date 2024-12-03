import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';

abstract class OrderRespository {
  Future<List<OrderEntity>> getOrders();
}
