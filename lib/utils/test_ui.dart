import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TestUI extends StatelessWidget {
  const TestUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Color.fromARGB(255, 196, 200, 255),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return const FlLine(
                strokeWidth: 1,
              );
            },
          ),
        ),
      ),
    );
  }
}
