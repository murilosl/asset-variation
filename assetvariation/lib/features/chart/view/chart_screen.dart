import 'package:assetvariation/features/chart/model/chart.dart';
import 'package:assetvariation/features/chart/model/chart_data.dart';
import 'package:assetvariation/features/chart/view/chart_screen_layout_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  final ChartScreenLayoutData data;
  final List<ChartData> chartData;

  const ChartScreen({super.key, required this.data, required this.chartData});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cotação"),
      ),
      body: ChartScreenBody(data: widget.data, chartData: widget.chartData,),
    );
  }
}

class ChartScreenBody extends StatefulWidget {
  final ChartScreenLayoutData data;
  final List<ChartData> chartData;
  const ChartScreenBody({super.key, required this.data, required this.chartData});

  @override
  State<ChartScreenBody> createState() => _ChartScreenBodyState();
}

class _ChartScreenBodyState extends State<ChartScreenBody> {
  TooltipBehavior? _tooltipBehavior;

  @override
  Widget build(BuildContext context) {

    var chartData = widget.data.chart.chart.result[0].indicators.quote;

    return Container(child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries>[
            AreaSeries<ChartData, DateTime>(
            dataSource: widget.chartData, 
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y)
          ],
        ),);
  }
}