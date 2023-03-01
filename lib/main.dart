import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/multiple_axes_chart.dart';
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

  final List<ChartData> primaryData = [
    ChartData('a', 10000),
    ChartData('b', 20000),
    ChartData('c', 15000),
    ChartData('d', 25000),
    ChartData('e', 30000),
    ChartData('f', 25000),
    ChartData('g', 15000),
    ChartData('h', 18000),
    ChartData('i', 32000),
    ChartData('j', 40000),
    ChartData('k', 28000),
    ChartData('l', 16000),
    ChartData('m', 11000),
    ChartData('n', 25000),
    ChartData('o', 15000),
  ];

  final List<ChartData> secondaryData = [
    ChartData('Jan', 20),
    ChartData('Feb', 10),
    ChartData('Mar', 5),
    ChartData('Apr', 10),
    ChartData('May', 15),
  ];

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
          // color: Color(0xFF141416),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          child: SfCartesianChart(
            borderWidth: 0,
            plotAreaBorderWidth: 0,
            backgroundColor: Color(0xFF222225),
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              minorGridLines: const MinorGridLines(width: 0),
              majorTickLines: const MajorTickLines(width: 0),
              minorTickLines: const MinorTickLines(width: 0),
              axisLine: const AxisLine(width: 0),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 1, color: Colors.grey),
              minorGridLines: const MinorGridLines(width: 0),
              majorTickLines: const MajorTickLines(width: 0),
              minorTickLines: const MinorTickLines(width: 0),
              axisLine: const AxisLine(width: 0),
              desiredIntervals: 4,
            ),
            series: <ChartSeries>[
              AreaSeries<ChartData, String>(
                dataSource: primaryData,

                xValueMapper: (ChartData data, _) => data.xValue,
                yValueMapper: (ChartData data, _) => data.yValue,
                borderWidth: 3,
                borderColor: Color(0xFF43FFA5),
                gradient: const LinearGradient(
                  colors: [Color(0xFF43FFA5), Colors.transparent],
                  stops: [0.0, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),

                // color: Color(0xFF43FFA5),
                // width: 2,
                // markerSettings: MarkerSettings(
                //   isVisible: true,
                //   color: Color(0xFF43FFA5),
                //   borderColor: Color(0xFF43FFA5),
                //   borderWidth: 2,
                // ),
              ),
            ],
          ),
        ),

        // SfSparkAreaChart.custom(

        //   lowPointColor: Colors.red,
        //   highPointColor: Colors.green,
        //   lastPointColor: Colors.blue,
        //   axisLineDashArray: [5, 5],

        //   // data: [1, 3, 2, 4, 3, 5, 4, 6, 5, 7, 6, 8, 7, 9, 8, 10],
        //   dataCount: primaryData.length,
        //   xValueMapper: (index) => primaryData[index].xValue,
        //   yValueMapper: (index) => primaryData[index].yValue,
        //   labelDisplayMode: SparkChartLabelDisplayMode.all,
        //   borderColor: Color(0xFF43FFA5),

        //   borderWidth: 2,
        //   color: Color(0xFF43FFA5).withOpacity(0.5),

        //   marker: const SparkChartMarker(
        //     borderWidth: 2,
        //     borderColor: Colors.yellow,
        //     color: Colors.red,
        //   ),
        // ),
      ),
    );
  }
}

class ChartData {
  final String xValue;
  final double yValue;

  ChartData(this.xValue, this.yValue);
}
