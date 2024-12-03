import 'dart:convert';

import 'package:ecommerce_shop/orders/data/models/order_model.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';


@injectable
class OrdersDataSource {
  Future<List<OrderModel>> getOrders() async {
    // await Future.delayed(const Duration(milliseconds: 1000));
    final String response =
        await rootBundle.loadString('assets/data/orders_data.json');
    return orderModelFromJson(response);
  }
}
