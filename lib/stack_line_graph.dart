// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_syncfusion/stack_area_graph_ex.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// import 'my_spline_chart.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ChartSeriesController? seriesController;
//   var random = Random();
//   final List<ChartData> _chartData = <ChartData>[
//     ChartData(DateTime(2022, 1, 1), 30, 20, 10),
//     ChartData(DateTime(2022, 1, 5), 20, 40, 20),
//     ChartData(DateTime(2022, 1, 10), 30, 20, 10),
//     ChartData(DateTime(2022, 1, 15), 50, 10, 60),
//     ChartData(DateTime(2022, 1, 20), 30, 20, 50),
//   ];

//   void performSwipe(ChartSwipeDirection direction) {
//     if (direction == ChartSwipeDirection.end) {
//       _chartData.add(ChartData(
//         DateTime(_chartData[_chartData.length - 1].month.year + 1, 1, 1),
//         random.nextDouble() * 600 + 50,
//         random.nextDouble() * 600 + 50,
//         random.nextDouble() * 600 + 50,
//       ));
//       if (seriesController != null)
// // Updating the chart with the newly added data.
//         seriesController!.updateDataSource(addedDataIndexes: <int>[_chartData.length - 1]);
//     } else {
//       _chartData.removeLast();
//       if (seriesController != null) {
//         seriesController!.updateDataSource(removedDataIndexes: <int>[_chartData.length]);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5,
//           width: MediaQuery.of(context).size.width * 0.8,
//           child: SfCartesianChart(
//             // onPlotAreaSwipe: (ChartSwipeDirection direction) {
//             //   performSwipe(direction);
//             // },
//             backgroundColor: Color(0xFF141416),
//             plotAreaBorderWidth: 0,
//             primaryXAxis: DateTimeAxis(
//                 axisLine: const AxisLine(width: 0),
//                 majorTickLines: const MajorTickLines(size: 0),
//                 minorTickLines: const MinorTickLines(size: 0),
//                 majorGridLines: const MajorGridLines(width: 0),
//                 minorGridLines: const MinorGridLines(width: 0),
//                 intervalType: DateTimeIntervalType.days,
//                 autoScrollingMode: AutoScrollingMode.end,
//                 labelStyle: const TextStyle(color: Colors.white),
//                 interval: 1),
//             primaryYAxis: NumericAxis(
//               majorTickLines: const MajorTickLines(size: 0),
//               minorTickLines: const MinorTickLines(size: 0),
//               majorGridLines: const MajorGridLines(width: 0.5, color: Color(0xFF3C3C42)),
//               minorGridLines: const MinorGridLines(width: 0),
//               axisLine: const AxisLine(width: 0),
//               labelStyle: const TextStyle(color: Colors.white),
//               interval: 20,
//               minimum: 10,
//               maximum: 100,
//               edgeLabelPlacement: EdgeLabelPlacement.shift,
//               labelFormat: '{value} %',
//             ),
//             borderWidth: 0,
//             trackballBehavior: TrackballBehavior(
//               enable: true,
//               activationMode: ActivationMode.singleTap,
//               tooltipSettings: InteractiveTooltip(
//                 enable: true,
//               ),
//             ),

//             series: <ChartSeries>[
//               StackedLineSeries<ChartData, DateTime>(
//                 onRendererCreated: (ChartSeriesController controller) {
//                   seriesController = controller;
//                 },
//                 dataSource: _chartData,
//                 xValueMapper: (ChartData data, _) => data.month,
//                 yValueMapper: (ChartData data, _) => data.value1,
//                 color: Colors.red,
//               ),
//               StackedLineSeries<ChartData, DateTime>(
//                 dataSource: _chartData,
//                 xValueMapper: (ChartData data, _) => data.month,
//                 yValueMapper: (ChartData data, _) => data.value2,
//                 color: Colors.green,
//               ),
//               StackedLineSeries<ChartData, DateTime>(
//                 dataSource: _chartData,
//                 xValueMapper: (ChartData data, _) => data.month,
//                 yValueMapper: (ChartData data, _) => data.value3,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChartData {
//   ChartData(this.month, this.value1, this.value2, this.value3);
//   final DateTime month;
//   final double value1;
//   final double value2;
//   final double value3;
// }
