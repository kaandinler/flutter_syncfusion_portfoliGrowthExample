import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyStackAreaWidget extends StatelessWidget {
  const MyStackAreaWidget({
    super.key,
    required List<ChartData> chartData,
  }) : _chartData = chartData;

  final List<ChartData> _chartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(
          labelFormat: '{value} %',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          minorTickLines: const MinorTickLines(size: 0),
          borderWidth: 0,
          enableAutoIntervalOnZooming: true,
          interval: 1,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelAlignment: LabelAlignment.center,
          labelPosition: ChartDataLabelPosition.outside,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 10,
          ),
        ),
        primaryYAxis: NumericAxis(
          minimum: 20,
          maximum: 100,
          interval: 20,
          labelFormat: '{value} %',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          minorTickLines: const MinorTickLines(size: 0),
          borderWidth: 0,
        ),
        series: <StackedAreaSeries<ChartData, double>>[
          StackedAreaSeries<ChartData, double>(
            opacity: 0.7,
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.value1,
          ),
          StackedAreaSeries<ChartData, double>(
            opacity: 0.7,
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.value1,
          ),
          StackedAreaSeries<ChartData, double>(
            opacity: 0.7,
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.value1,
          ),
          StackedAreaSeries<ChartData, double>(
            opacity: 0.7,
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.value1,
          ),
          // StackedAreaSeries<ChartData, double>(
          //   opacity: 0.7,
          //   dataSource: _chartData,
          //   xValueMapper: (ChartData data, _) => data.x,
          //   yValueMapper: (ChartData data, _) => data.value3,
          // ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.value1);
  final double x;
  final double value1;
  // final double value2;
  // final double value3;
}
