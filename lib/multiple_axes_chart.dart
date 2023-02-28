import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultipleAxesChart extends StatelessWidget {
  final List<ChartData> primaryData;
  final List<ChartData> secondaryData;

  const MultipleAxesChart({
    Key? key,
    required this.primaryData,
    required this.secondaryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF222225),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profit and Loss (P&L)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Profit P&L +144,657.37', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: 'Overall Return % ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                        WidgetSpan(
                            child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color(0xFF43FFA5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        )),
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: 'Today Change % ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                        WidgetSpan(
                            child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color(0xFFFA5147),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        )),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SfCartesianChart(
              enableMultiSelection: true,
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enablePanning: true,
                enableDoubleTapZooming: true,
                enableSelectionZooming: true,
                enableMouseWheelZooming: true,
                zoomMode: ZoomMode.x,
              ),
              backgroundColor: Color(0xFF222225),
              plotAreaBorderWidth: 0,
              borderWidth: 0,
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                minorGridLines: const MinorGridLines(width: 0),
                axisLine: const AxisLine(width: 2),
                majorTickLines: const MajorTickLines(size: 0),
                minorTickLines: const MinorTickLines(size: 0),
                borderWidth: 0,
                zoomPosition: 1,
                zoomFactor: 1,
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(width: 1, dashArray: <double>[5, 5], color: Colors.grey),
                minorGridLines: const MinorGridLines(width: 0),
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                minorTickLines: const MinorTickLines(size: 0),
                borderWidth: 0,
                labelStyle: const TextStyle(color: Colors.white),
                interval: 5,
              ),
              legend: Legend(
                isVisible: false,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: primaryData,
                  xValueMapper: (ChartData data, _) => data.xValue,
                  yValueMapper: (ChartData data, _) => data.yValue,
                  name: 'Overall Return %',
                  yAxisName: 'Primary Axis',
                  color: Color(0xFF43FFA5),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  width: 0.3,
                ),
                ColumnSeries<ChartData, String>(
                  dataSource: secondaryData,
                  xValueMapper: (ChartData data, _) => data.xValue,
                  yValueMapper: (ChartData data, _) => data.yValue,
                  name: 'Today Change %',
                  yAxisName: 'Secondary Axis',
                  color: Color(0xFFFA5147),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  width: 0.3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
