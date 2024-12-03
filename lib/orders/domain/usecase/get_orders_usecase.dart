import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_shop/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersUsecase {
  final OrderRespository _orderRespository;

  GetOrdersUsecase({required OrderRespository orderRespository})
      : _orderRespository = orderRespository;

  Future<List<OrderEntity>> call() async =>
      await _orderRespository.getOrders();
}
