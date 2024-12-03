import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/inits/injector.dart';
import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_shop/orders/domain/usecase/get_orders_usecase.dart';
import 'package:ecommerce_shop/orders/presentation/bloc/states/order_states.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(): super(OrderInitState());

  final GetOrdersUsecase _getOrdersUsecase = getIt<GetOrdersUsecase>();

  Future<void> getOrders() async {
    emit(OrderLoadingState());
    final List<OrderEntity> orders = await _getOrdersUsecase();
    emit(
      OrderSuccessState(
        orders: orders,
      ),
    );
  }
}
