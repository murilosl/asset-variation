
import 'package:assetvariation/features/chart/view/chart_screen_layout_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  final ChartScreenLayoutData data;
  const ChartScreen({required this.data});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text("Cotação"),
      ),
      body: ChartScreenBody(data: widget.data,),
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
    return Container(child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            // LineSeries<ChartData, String>(dataSource: [
            //   ChartData('01', 35),
            //   ChartData('02', 35),
            //   ChartData('03', 34),
            //   ChartData('04', 34),
            //   ChartData('05', 34),
            //   ChartData('06', 33),
            //   ChartData('07', 32),
            // ], xValueMapper: (ChartData data, _) => data.x,
            //                     yValueMapper: (ChartData data, _) => data.y)
          ],
        ),);
  }
}