import 'package:flutter/widgets.dart';
import 'package:name/components/analytics/hours_spent_graph.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Analystics"),
        HoursSpentGraph(),
      ],
    );
  }
}
