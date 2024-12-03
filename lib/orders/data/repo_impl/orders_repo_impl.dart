import 'package:ecommerce_shop/orders/data/datasource/orders_datasource.dart';
import 'package:ecommerce_shop/orders/data/models/order_model.dart';
import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_shop/orders/domain/repositories/orders_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Injectable(as: OrderRespository)
class OrdersRepoImpl implements OrderRespository {
  final OrdersDataSource _dataSource;

  OrdersRepoImpl(this._dataSource);

  @override
  Future<List<OrderEntity>> getOrders() async {
    final List<OrderModel> models = await _dataSource.getOrders();

    List<OrderEntity> entities = models.map((OrderModel model) {
      String priceString = model.price?.replaceAll('\$', '').replaceAll(',', '') ?? '';
      double preparedPrice = double.parse(priceString);
      OrderEntity orderEntity = model.toEntity();
      orderEntity.price = preparedPrice;
      orderEntity.registered =  DateTime.parse(model.registered!);
      return orderEntity;
    }).toList();

    entities.sort((a , b) => a.registered!.compareTo(b.registered!) );
    return entities;
  }
}
// 2021-04-11T04:24:23 -02:00

