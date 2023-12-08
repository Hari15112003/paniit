import 'package:flutter/widgets.dart';
import 'package:name/components/analytics/line-chart/line_chart.dart';
import 'package:name/components/analytics/other_chart/pie_chart.dart';

import '../components/analytics/other_chart/bar_chart.dart';
import '../components/analytics/line-chart/line_chart_2.dart';
import '../components/analytics/other_chart/radar_chart.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Analystics"),
        BarChartSample4(),
        const LineChartSample2(),
        const PieChartSample2(),
        const RadarChartSample1()
      ],
    );
  }
}
