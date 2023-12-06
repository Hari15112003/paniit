import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HoursSpentGraph extends StatelessWidget {
  const HoursSpentGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(
          DateTime(
            2015,
          ),
          6),
      ChartData(DateTime(2016, 1), 11),
      ChartData(DateTime(2017, 1), 9),
      ChartData(DateTime(2018, 1), 14),
      ChartData(DateTime(2019, 1), 10),
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
          height: 400,
          width: double.infinity,
          child: SfCartesianChart(
            primaryXAxis: DateTimeAxis(
                autoScrollingMode: AutoScrollingMode.start,
                rangePadding: ChartRangePadding.none,
                // Interval type will be months
                intervalType: DateTimeIntervalType.months,
                interval: 2),
            series: <ChartSeries<ChartData, DateTime>>[
              LineSeries<ChartData, DateTime>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y),
            ],
          )),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
