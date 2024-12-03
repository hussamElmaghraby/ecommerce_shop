import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_shop/orders/presentation/bloc/cubits/order_cubit.dart';
import 'package:ecommerce_shop/orders/presentation/bloc/states/order_states.dart';
import 'package:ecommerce_shop/orders/presentation/widgets/metrics_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumericMetricsScreen extends StatelessWidget {
  NumericMetricsScreen({super.key});

  List<OrderEntity>? _orders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OrderCubit()..getOrders(),
        child: Container(
          color: const Color(0xffb7daee),
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<OrderCubit, OrderState>(
            listener: (ctx, state) {
              if (state is OrderSuccessState) {
                _orders = state.orders;
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MetricCardWidget(
                  title: 'Total Count',
                  value: _orders?.length.toString(),
                  color: const Color(0xFFd5e8f6),
                ),
                MetricCardWidget(
                  title: 'Average Price',
                  value: '\$$averagePrice',
                  color: const Color(0xFFc5f7c2),
                ),
                MetricCardWidget(
                  title: 'Number of Returns',
                  value: numOfReturns.toString(),
                  color: const Color(0xFFfd989e),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get averagePrice {
    double totalPrice = 0.0;
    if (_orders?.isNotEmpty == true) {
      for (OrderEntity order in _orders!) {
        String priceString =
            order.price?.replaceAll('\$', '').replaceAll(',', '') ?? '';
        double price = double.parse(priceString);
        totalPrice += price;
      }
      return (totalPrice / _orders!.length).toStringAsFixed(2);
    }
    return '0';
  }

  int get numOfReturns {
    if (_orders?.isNotEmpty == true) {
      int numOfReturns = 0;
      for (OrderEntity order in _orders!) {
        if (order.status == OrderStatus.RETURNED) {
          numOfReturns++;
        }
      }
      return numOfReturns;
    }
    return 0;
  }
}
