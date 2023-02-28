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
    ChartData('Jan', 10),
    ChartData('Feb', 20),
    ChartData('Mar', 15),
    ChartData('Apr', 5),
    ChartData('May', 20),
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
        color: Color(0xFF141416),
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.9,
        child: MultipleAxesChart(
          primaryData: primaryData,
          secondaryData: secondaryData,
        ),
      )),
    );
  }
}

class ChartData {
  final String xValue;
  final double yValue;

  ChartData(this.xValue, this.yValue);
}
