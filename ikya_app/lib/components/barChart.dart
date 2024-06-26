import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class GraphValues {
  final double x;
  final double y;
  GraphValues({required this.x, required this.y});
}

List<GraphValues> get weekGraphValues {
  final data = <double>[2, 8, 14, 5, 10, 7, 6];
  return data
      .mapIndexed(
          (index, element) => GraphValues(x: index.toDouble(), y: element))
      .toList();
}

List<GraphValues> get monthGraphValues {
  final data = <double>[2, 8, 14, 5, 10, 7, 6, 4, 9, 8, 10, 9];
  return data
      .mapIndexed(
          (index, element) => GraphValues(x: index.toDouble(), y: element))
      .toList();
}

class BarChartSampleWithDays extends StatelessWidget {
  final List<String> bottomTitles = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: false), // Hide grid lines
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Hide left side titles
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
                  reservedSize: 28,
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
            ),
            barGroups: weekGraphValues.map((value) {
              return BarChartGroupData(
                x: value.x.toInt(),
                barRods: [
                  BarChartRodData(
                    toY: value.y,
                    gradient: value.x == 2
                        ? LinearGradient(
                            colors: [
                              Color.fromARGB(255, 47, 213, 18),
                              const Color.fromARGB(255, 14, 15, 15)
                            ],
                            stops: [-0.2, 0.85],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )
                        : null,
                    color: value.x != 2 ? Color(0xFFB8CCD4) : null,
                    width: 25,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class BarChartSampleWithMonths extends StatelessWidget {
  final List<String> bottomTitles = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: false), // Hide grid lines
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Hide left side titles
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
                  reservedSize: 28,
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
            ),
            barGroups: monthGraphValues.map((value) {
              return BarChartGroupData(
                x: value.x.toInt(),
                barRods: [
                  BarChartRodData(
                    toY: value.y,
                    color: Color(0xFFB8CCD4),
                    width: 15,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

List<GraphValues> get batteryStatusValues {
  final data = <double>[
    25,
    55,
    20,
    45,
    30,
    15,
  ];
  return data
      .mapIndexed(
          (index, element) => GraphValues(x: index.toDouble(), y: element))
      .toList();
}

class SmallBarChartBatteryStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70, // Small size
        // width: double.infinity,
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: false), // Hide grid lines
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles:
                    SideTitles(showTitles: false), // Hide left side titles
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Hide bottom titles
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
            ),
            barGroups: batteryStatusValues.map((value) {
              return BarChartGroupData(
                x: value.x.toInt(),
                barRods: [
                  BarChartRodData(
                    toY: value.y,
                    color: Color(0xFFB8CCD4),
                    width: 7, // Narrow bars for small chart
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
