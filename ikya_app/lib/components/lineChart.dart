import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class GraphValues {
  final double x;
  final double y;
  GraphValues({required this.x, required this.y});
}

List<GraphValues> get graphValues {
  final data = <double>[2, 8, 5, 12, 7, 14, 12];
  return data.mapIndexed((index, element) => GraphValues(x: index.toDouble(), y: element)).toList();
}

List<GraphValues> get secondGraphValues {
  final data = <double>[1, 12, 3, 16, 5, 20, 9];
  return data.mapIndexed((index, element) => GraphValues(x: index.toDouble(), y: element)).toList();
}

class LineChartSample extends StatelessWidget {
  final List<String> bottomTitles = [
    '9.00Am',
    '10.00Am',
    '11.00Am',
    '12.00pm',
    '1.00pm',
    '2.00pm',
    '3.00pm'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false), // Hide grid lines
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() < bottomTitles.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          bottomTitles[value.toInt()],
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      );
                    }
                    return Container();
                  },
                  interval: 1,
                  reservedSize: 40,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: false,
              border: Border.all(color: Colors.black, width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: graphValues
                    .map((value) => FlSpot(value.x, value.y))
                    .toList(),
                isCurved: false,
                color: Colors.blue,
                barWidth: 2,
                belowBarData: BarAreaData(
                  show: false,
                ),
                dotData: FlDotData(
                  show: true,
                ),
              ),
              LineChartBarData(
                spots: secondGraphValues
                    .map((value) => FlSpot(value.x, value.y))
                    .toList(),
                isCurved: false,
                color: Colors.red,
                barWidth: 2,
                belowBarData: BarAreaData(
                  show: false,
                ),
                dotData: FlDotData(
                  show: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
