import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/stack_area_graph_ex.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'my_spline_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChartSeriesController? seriesController;
  var random = Random();
  late List<ChartData> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = <ChartData>[
      ChartData('Energy', 183),
      ChartData('Finances', 300),
      ChartData('Entertaintment', 125),
      ChartData('Consumer Electric', 135),
      ChartData('Healtcare', 62),
      ChartData('Technology', 502),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Color(0xFF141416),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(
              axisLine: const AxisLine(width: 2),
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: const MajorGridLines(width: 0),
              labelPosition: ChartDataLabelPosition.outside,
              labelAlignment: LabelAlignment.center,
              labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
              labelIntersectAction: AxisLabelIntersectAction.trim,
              labelPlacement: LabelPlacement.betweenTicks,
              edgeLabelPlacement: EdgeLabelPlacement.shift,
            ),
            primaryYAxis: NumericAxis(
              labelFormat: ' ',
              axisLine: const AxisLine(width: 2),
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: const MajorGridLines(width: 0),
              tickPosition: TickPosition.outside,
            ),
            series: <StackedColumnSeries<ChartData, String>>[
              StackedColumnSeries<ChartData, String>(
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.value,
                color: Color(0xFF2D2D33),
                isTrackVisible: true,
                trackColor: Color(0xFF222225),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                //Sorts the data points in descending order
                sortingOrder: SortingOrder.descending,
                sortFieldValueMapper: (ChartData data, _) => data.value,
                //------------------------------
                legendIconType: LegendIconType.rectangle,
                spacing: 0.1,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  labelAlignment: ChartDataLabelAlignment.middle,
                  labelPosition: ChartDataLabelPosition.inside,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                  
                ),
                dataLabelMapper: (ChartData data, _) => data.value.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String month;
  final int value;

  ChartData(
    this.month,
    this.value,
  );
}
