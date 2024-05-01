import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'chart.dart';

class Transactionsends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                child: BarChart(
                  BarChartData(),
                ),
              )
            )
          ],
        ),
      ),
    );
  }


BarChartData mainBarData() {
  return BarChartData(
    titlesData: FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false)
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false)
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 38,
          getTitlesWidget: getTiles,
        )
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 38,
          getTitlesWidget: leftTitles,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false
    ),
    gridData: const FlGridData(show: false),
    barGroups: showingGroups(),
  );
}
