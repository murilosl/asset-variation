import 'package:assetvariation/features/chart/model/chart_data.dart';
import 'package:assetvariation/features/chart/view/chart_screen_layout_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  final ChartScreenLayoutData data;

  const ChartScreen({super.key, required this.data});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PETR4"),
      ),
      body: ChartScreenBody(data: widget.data),
    );
  }
}

class ChartScreenBody extends StatefulWidget {
  final ChartScreenLayoutData data;
  const ChartScreenBody({super.key, required this.data});

  @override
  State<ChartScreenBody> createState() => _ChartScreenBodyState();
}

class _ChartScreenBodyState extends State<ChartScreenBody> {
  TooltipBehavior? _tooltipBehavior;

  @override
  Widget build(BuildContext context) {

    return SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            LineSeries<ChartData, int>(
            dataSource: widget.data.chartData,
            color: Colors.redAccent,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
          ],
          plotAreaBorderWidth: 0,
          primaryYAxis: NumericAxis(
            opposedPosition: true,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            numberFormat: NumberFormat.compactCurrency(locale: 'pt-BR', symbol: 'R\$'),
          ),
        );
  }
}