import 'package:ecommerce_shop/app/core/routing/route_names.dart';
import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_shop/orders/presentation/bloc/cubits/order_cubit.dart';
import 'package:ecommerce_shop/orders/presentation/bloc/states/order_states.dart';
import 'package:ecommerce_shop/orders/presentation/widgets/metrics_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/bottomsheet/bottomsheet.dart';

import 'graph_screen.dart';

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const Gap(20),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.GRAPH, arguments:GraphScreenArgs(orders: _orders) );
                  },
                  child: const Text('Go to Graph' , style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor:  Colors.blue,
                  ),),
                )
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
        totalPrice += order.price ?? 0.0;
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
