import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Orders over time'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LineChart(

                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: const FlTitlesData(
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: true)),
                      bottomTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    ),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _getChartData(),
                        isCurved: true,
                        color: Colors.blue,
                        belowBarData: BarAreaData(show: true),
                      ),
                    ],
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to process your data and return FlSpot list for the chart
  List<FlSpot> _getChartData() {
    // Sample data with registered date and order count
    List<Map<String, dynamic>> data = [
      {
        "id": "617ec833f12904d46ae13eaa",
        "isActive": true,
        "price": "\$3,000.00",
        "company": "COMPANY C",
        "buyer": "Charlie",
        "status": "ORDERED",
        "registered": "2021-07-03T16:15:00 -02:00"
      },
      {
        "id": "617ec833f12904d46ae13eab",
        "isActive": true,
        "price": "\$4,000.00",
        "company": "COMPANY D",
        "buyer": "Dave",
        "status": "ORDERED",
        "registered": "2021-07-04T10:15:00 -02:00"
      },
      {
        "id": "617ec833f12904d46ae13eac",
        "isActive": true,
        "price": "\$5,000.00",
        "company": "COMPANY E",
        "buyer": "Eva",
        "status": "ORDERED",
        "registered": "2021-07-05T12:00:00 -02:00"
      }
    ];

    // Process the data to count orders by date
    Map<DateTime, int> orderCountsByDate = {};

    for (var item in data) {
      DateTime registeredDate = DateTime.parse(item["registered"]);
      orderCountsByDate[registeredDate] =
          (orderCountsByDate[registeredDate] ?? 0) + 1;
    }

    // Convert Map to FlSpot list
    List<FlSpot> spots = [];
    orderCountsByDate.forEach((date, count) {
      spots.add(
          FlSpot(date.millisecondsSinceEpoch.toDouble(), count.toDouble()));
    });

    return spots;
  }
}
