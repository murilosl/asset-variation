import 'package:assetvariation/features/chart/model/chart.dart';
import 'package:assetvariation/features/chart/model/chart_data.dart';

class ChartScreenLayoutData{
  final Chart chart;
  final List<ChartData> chartData;

  ChartScreenLayoutData({required this.chart, required this.chartData});
}