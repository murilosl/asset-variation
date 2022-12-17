import 'package:assetvariation/features/chart/controller/chart_controller.dart';
import 'package:assetvariation/features/chart/model/chart.dart';
import 'package:assetvariation/features/chart/model/chart_data.dart';
import 'package:assetvariation/features/chart/usecase/chart_usecase.dart';
import 'package:assetvariation/features/chart/view/chart_screen_layout_data.dart';

class ChartControllerImpl extends ChartController {
  final ChartUsecase chartUsecase;

  late Chart _chart;

  List<ChartData> chartData = [];

  ChartControllerImpl({required this.chartUsecase});

  @override
  Future<ChartScreenLayoutData> fetch() async {
    await Future.wait<dynamic>([_loadChart()]);
    return await _buildState();
  }

  _loadChart() async {
    _chart = await chartUsecase.getAll();
  }

  _buildState() => ChartScreenLayoutData(chart: _chart, chartData: chartData);
}