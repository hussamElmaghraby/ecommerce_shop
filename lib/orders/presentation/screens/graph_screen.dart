// import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
// import 'package:ecommerce_shop/orders/presentation/widgets/order_chart.dart';
// import 'package:flutter/material.dart';
//
import 'package:ecommerce_shop/orders/domain/entities/order_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraphScreenArgs {
  List<OrderEntity>? orders;

  GraphScreenArgs({required this.orders});
}

// class GraphScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final GraphScreenArgs? args = ModalRoute.of(context)?.settings.arguments as GraphScreenArgs?;
//     final List<OrderEntity>? orders = args?.orders;
//
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Syncfusion Flutter chart'),
//         ),
//         body: Column(children: [
//           //Initialize the chart widget
//           SfCartesianChart(
//               primaryXAxis: CategoryAxis(),
//               // Chart title
//               title: const ChartTitle(text: 'Half yearly sales analysis'),
//               // Enable legend
//               legend: Legend(isVisible: true),
//               // Enable tooltip
//               tooltipBehavior: TooltipBehavior(enable: true),
//               series: <CartesianSeries<OrderEntity, String>>[
//                 LineSeries<OrderEntity, String>(
//                     dataSource: orders,
//                     xValueMapper: (OrderEntity sales, _) => sales.registered,
//                     yValueMapper: (OrderEntity sales, _) => sales.price,
//                     name: 'Sales',
//                     // Enable data label
//                     dataLabelSettings: DataLabelSettings(isVisible: true))
//               ]),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               //Initialize the spark charts widget
//               child: SfSparkLineChart.custom(
//                 //Enable the trackball
//                 trackball: SparkChartTrackball(
//                     activationMode: SparkChartActivationMode.tap),
//                 //Enable marker
//                 marker: SparkChartMarker(
//                     displayMode: SparkChartMarkerDisplayMode.all),
//                 //Enable data label
//                 labelDisplayMode: SparkChartLabelDisplayMode.all,
//                 xValueMapper: (int index) => orders?[index].registered,
//                 yValueMapper: (int index) => orders![index].price!,
//                 dataCount: 5,
//               ),
//             ),
//           )
//         ]));
//   }
// }
//
// class _SalesData {
//   _SalesData(this.year, this.sales);
//
//   final String year;
//   final double sales;
//
//   toSales(){
//
//   }
// }

class GraphScreen extends StatelessWidget {
  // Sample orders with timestamps (in DateTime format)
  // final List<OrderData> rawData = [
  //   OrderData(DateTime(2021, 4, 11), 0),
  //   OrderData(DateTime(2021, 4, 12), 2),
  //   OrderData(DateTime(2021, 4, 12), 120),
  //   OrderData(DateTime(2021, 4, 13), 1),
  //   OrderData(DateTime(2021, 4, 14), 4),
  //   OrderData(DateTime(2021, 4, 14), 1),
  //   OrderData(DateTime(2021, 4, 15), 5),
  //   OrderData(DateTime(2021, 4, 15), 3),
  // ];

  // Method to group orders by date and count them
  List<OrderCountByDate> groupOrdersByDate(List<OrderEntity> orders) {
    Map<DateTime, int> dateCountMap = {};

    for (var order in orders) {
      DateTime orderDate = DateTime(order.registered!.year,
          order.registered!.month, order.registered!.day);
      dateCountMap[orderDate] = (dateCountMap[orderDate] ?? 0) + 1;
    }

    return dateCountMap.entries
        .map((entry) => OrderCountByDate(entry.key, entry.value))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // Grouping the orders by date
    final GraphScreenArgs? args =
        ModalRoute.of(context)?.settings.arguments as GraphScreenArgs?;

    final groupedData = groupOrdersByDate(args!.orders!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Over Time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),

          primaryXAxis: const CategoryAxis(
            autoScrollingDelta: 15,
            autoScrollingMode: AutoScrollingMode.start,
          ),
          // DateTimeAxis to show time on X-axis
          title: const ChartTitle(text: 'Number of Orders Over Time'),
          legend: const Legend(isVisible: true),
          series: [
            LineSeries<OrderCountByDate, DateTime>(
              dataSource: groupedData,
              xValueMapper: (OrderCountByDate order, _) => order.date,
              yValueMapper: (OrderCountByDate order, _) => order.orderCount,
              name: 'Orders',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCountByDate {
  OrderCountByDate(this.date, this.orderCount);

  final DateTime date;
  final int orderCount;
}
