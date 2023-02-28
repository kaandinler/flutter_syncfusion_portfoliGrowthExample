import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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
  late TooltipBehavior _tooltipBehavior;

  List<SalesData> myDataSource = <SalesData>[
    SalesData('09:00', 11000),
    SalesData('10:00', 14000),
    SalesData('11:00', 23000),
    SalesData('12:00', 28000),
    SalesData('13:00', 35000),
    SalesData('14:00', 22000)
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          child: SfCartesianChart(
            crosshairBehavior: CrosshairBehavior(
              enable: true,
              activationMode: ActivationMode.longPress,
              shouldAlwaysShow: false,
              lineType: CrosshairLineType.vertical,
              lineColor: Colors.grey.withOpacity(0.3),
              lineWidth: 1,
            ),
            plotAreaBorderWidth: 0,
            borderWidth: 0,
            borderColor: Colors.transparent,
            backgroundColor: const Color(0Xff222225),
            primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                minorTickLines: const MinorTickLines(size: 0),
                axisLine: const AxisLine(width: 0),
                borderWidth: 0,
                borderColor: Colors.transparent,
                axisBorderType: AxisBorderType.withoutTopAndBottom,
                interval: 1),
            primaryYAxis: NumericAxis(
              borderWidth: 0,
              borderColor: Colors.transparent,
              majorGridLines: MajorGridLines(width: 1, color: Colors.grey.withOpacity(0.3)),
              majorTickLines: const MajorTickLines(size: 0),
              minorTickLines: const MinorTickLines(size: 0),
              axisLine: const AxisLine(width: 0),
              interval: 10000,
              // minimum: myDataSource.reduce((value, element) => value.growth < element.growth ? value : element).growth,
              minimum: 10000,
            ),
            trackballBehavior: TrackballBehavior(
              shouldAlwaysShow: false,
              enable: true,
              activationMode: ActivationMode.singleTap,
              lineWidth: 1,
              lineDashArray: const <double>[5, 5],
              lineColor: Color(0xFF23D4BF),
              markerSettings: const TrackballMarkerSettings(
                markerVisibility: TrackballVisibilityMode.visible,
                shape: DataMarkerType.circle,
                height: 11,
                width: 11,
                borderWidth: 7,
                borderColor: Colors.white,
                color: Color(
                  0xFF23D4BF,
                ),
              ),
              tooltipSettings: const InteractiveTooltip(
                arrowLength: 8,
                borderRadius: 3,
                canShowMarker: false,
                format: 'point.y\nMay',
                enable: true,
                color: Color(0xFF2D2D33),
                borderColor: Colors.black,
                borderWidth: 0,
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
            series: <SplineSeries>[
              SplineSeries<SalesData, String>(
                color: Color(0xFF23D4BF),
                splineType: SplineType.cardinal,
                enableTooltip: true,
                width: 5,
                dataSource: myDataSource,
                xValueMapper: (SalesData sales, _) => sales.time,
                yValueMapper: (SalesData sales, _) => sales.growth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String time;
  final double growth;

  SalesData(this.time, this.growth);
}
