import 'package:ecommerce_shop/app/features/orders/data/datasource/orders_datasource.dart';
import 'package:ecommerce_shop/app/features/orders/data/models/order_model.dart';
import 'package:ecommerce_shop/app/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_shop/app/features/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderRespository)
class OrdersRepoImpl implements OrderRespository {
  final OrdersDataSource _dataSource;

  OrdersRepoImpl(this._dataSource);

  @override
  Future<List<OrderEntity>> getOrders() async {
   final List<OrderModel> models =  await _dataSource.getOrders();
   return models.map((OrderModel model) => model.toEntity()).toList();
  }
}
