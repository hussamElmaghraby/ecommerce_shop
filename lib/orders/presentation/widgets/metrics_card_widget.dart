import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MetricCardWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final Color color;

  MetricCardWidget({required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title ??'',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(40),
            Text(
              value ??'',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}