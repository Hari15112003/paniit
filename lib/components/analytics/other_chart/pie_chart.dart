import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../components/components_chart.dart';


class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: AppColors.contentColorBlue,
                text: 'First',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.contentColorYellow,
                text: 'Second',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.contentColorPurple,
                text: 'Third',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.contentColorGreen,
                text: 'Fourth',
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}


class RadarChartSample1 extends StatefulWidget {
  const RadarChartSample1({super.key});

  final gridColor = AppColors.contentColorPurple;
  final titleColor = AppColors.contentColorPurple;
  final fashionColor = AppColors.contentColorRed;
  final artColor = AppColors.contentColorCyan;
  final boxingColor = AppColors.contentColorGreen;
  final entertainmentColor = AppColors.contentColorWhite;
  final offRoadColor = AppColors.contentColorYellow;

  @override
  State<RadarChartSample1> createState() => _RadarChartSample1State();
}

class _RadarChartSample1State extends State<RadarChartSample1> {
  int selectedDataSetIndex = -1;
  double angleValue = 0;
  bool relativeAngleMode = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Title configuration',
            style: TextStyle(
              color: AppColors.mainTextColor2,
            ),
          ),
          Row(
            children: [
              const Text(
                'Angle',
                style: TextStyle(
                  color: AppColors.mainTextColor2,
                ),
              ),
              Slider(
                value: angleValue,
                max: 360,
                onChanged: (double value) => setState(() => angleValue = value),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: relativeAngleMode,
                onChanged: (v) => setState(() => relativeAngleMode = v!),
              ),
              const Text('Relative'),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedDataSetIndex = -1;
              });
            },
            child: Text(
              'Categories'.toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300,
                color: AppColors.mainTextColor1,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rawDataSets()
                .asMap()
                .map((index, value) {
                  final isSelected = index == selectedDataSetIndex;
                  return MapEntry(
                    index,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDataSetIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        height: 26,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.pageBackground
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(46),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 6,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInToLinear,
                              padding: EdgeInsets.all(isSelected ? 8 : 6),
                              decoration: BoxDecoration(
                                color: value.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInToLinear,
                              style: TextStyle(
                                color:
                                    isSelected ? value.color : widget.gridColor,
                              ),
                              child: Text(value.title),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          ),
          AspectRatio(
            aspectRatio: 1.3,
            child: RadarChart(
              RadarChartData(
                radarTouchData: RadarTouchData(
                  touchCallback: (FlTouchEvent event, response) {
                    if (!event.isInterestedForInteractions) {
                      setState(() {
                        selectedDataSetIndex = -1;
                      });
                      return;
                    }
                    setState(() {
                      selectedDataSetIndex =
                          response?.touchedSpot?.touchedDataSetIndex ?? -1;
                    });
                  },
                ),
                dataSets: showingDataSets(),
                radarBackgroundColor: Colors.transparent,
                borderData: FlBorderData(show: false),
                radarBorderData: const BorderSide(color: Colors.transparent),
                titlePositionPercentageOffset: 0.2,
                titleTextStyle:
                    TextStyle(color: widget.titleColor, fontSize: 14),
                getTitle: (index, angle) {
                  final usedAngle =
                      relativeAngleMode ? angle + angleValue : angleValue;
                  switch (index) {
                    case 0:
                      return RadarChartTitle(
                        text: 'Mobile or Tablet',
                        angle: usedAngle,
                      );
                    case 2:
                      return RadarChartTitle(
                        text: 'Desktop',
                        angle: usedAngle,
                      );
                    case 1:
                      return RadarChartTitle(text: 'TV', angle: usedAngle);
                    default:
                      return const RadarChartTitle(text: '');
                  }
                },
                tickCount: 1,
                ticksTextStyle:
                    const TextStyle(color: Colors.transparent, fontSize: 10),
                tickBorderData: const BorderSide(color: Colors.transparent),
                gridBorderData: BorderSide(color: widget.gridColor, width: 2),
              ),
              swapAnimationDuration: const Duration(milliseconds: 400),
            ),
          ),
        ],
      ),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: widget.fashionColor,
        values: [
          300,
          50,
          250,
        ],
      ),
      RawDataSet(
        title: 'Art & Tech',
        color: widget.artColor,
        values: [
          250,
          100,
          200,
        ],
      ),
      RawDataSet(
        title: 'Entertainment',
        color: widget.entertainmentColor,
        values: [
          200,
          150,
          50,
        ],
      ),
      RawDataSet(
        title: 'Off-road Vehicle',
        color: widget.offRoadColor,
        values: [
          150,
          200,
          150,
        ],
      ),
      RawDataSet(
        title: 'Boxing',
        color: widget.boxingColor,
        values: [
          100,
          250,
          100,
        ],
      ),
    ];
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
