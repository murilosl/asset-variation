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

    var now = DateTime.now();
    var totalDays = daysInMonth(now);
    var listOfDates = List<int>.generate(totalDays, (i) => i + 1);

    var open = _chart.chart.result[0].indicators.quote[0].open;

    for(var i = 0;i < listOfDates.length; i++) {
      var chartDataOpen = ChartData(listOfDates[i], open[i]);
      chartData.add(chartDataOpen);
    } 
  }

  int daysInMonth(DateTime date){
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  _buildState() => ChartScreenLayoutData(chart: _chart, chartData: chartData);
}