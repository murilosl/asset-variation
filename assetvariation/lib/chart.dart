// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ChartAsset extends StatefulWidget {
//   const ChartAsset({super.key});

//   @override
//   State<ChartAsset> createState() => _ChartAssetState();
// }

// class _ChartAssetState extends State<ChartAsset> {

//   TooltipBehavior? _tooltipBehavior;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tooltipBehavior =  TooltipBehavior(enable: true);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Petr4") ),
//       body: Center(
//         child: Container(child: SfCartesianChart(
//           tooltipBehavior: _tooltipBehavior,
//           primaryXAxis: CategoryAxis(),
//           series: <ChartSeries>[
//             LineSeries<ChartData, String>(dataSource: [
//               ChartData('01', 35),
//               ChartData('02', 35),
//               ChartData('03', 34),
//               ChartData('04', 34),
//               ChartData('05', 34),
//               ChartData('06', 33),
//               ChartData('07', 32),
//             ], xValueMapper: (ChartData data, _) => data.x,
//                                 yValueMapper: (ChartData data, _) => data.y)
//           ],
//         ),
//         ),
//         ),
//         );
//   }
// }

// class ChartData {
//   final String x;
//   final double? y;
//   ChartData(this.x, this.y);
// }