import 'package:flutter/widgets.dart';
import 'package:name/components/analytics/line-chart/line_chart.dart';
import 'package:name/components/analytics/other_chart/pie_chart.dart';
import 'package:name/custom/custom_text.dart';

import '../components/analytics/other_chart/bar_chart.dart';
import '../components/analytics/line-chart/line_chart_2.dart';
import '../components/analytics/other_chart/radar_chart.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LargeText(text: "Analystics"),
        MediumText(text: "Data Usage"),
        BarChartSample4(),
        MediumText(text: "Hours Spent"),
        const LineChartSample2(),
        MediumText(text: "Pending Courses"),
        const PieChartSample2(),
        MediumText(text: "Course Category"),
        const RadarChartSample1()
      ],
    );
  }
}
