import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';

class OrderState {}

class OrderSuccessState extends OrderState {
  final List<OrderEntity> orders;

  OrderSuccessState({required this.orders});
}
class OrderInitState extends OrderState {}
class OrderErrorState extends OrderState {}
class OrderLoadingState extends OrderState {}