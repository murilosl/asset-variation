
import 'package:assetvariation/features/chart/model/chart.dart';
import 'package:assetvariation/features/chart/repository/chart_repository.dart';
import 'package:dio/dio.dart';

class ChartRepositoryImpl extends ChartRepository {

  final Dio _dio;

  ChartRepositoryImpl(this._dio);

  @override
  Future<Chart> getAll() async {
    final response = await _dio.get("finance/chart/PETR4.SA");
    return Chart.fromJson(response.data);
  }
  
}