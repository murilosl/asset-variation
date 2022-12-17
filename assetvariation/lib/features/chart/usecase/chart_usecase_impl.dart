import 'package:assetvariation/features/chart/model/chart.dart';
import 'package:assetvariation/features/chart/repository/chart_repository.dart';
import 'package:assetvariation/features/chart/usecase/chart_usecase.dart';

class ChartUsecaseImpl extends ChartUsecase{
  final ChartRepository repository;

  ChartUsecaseImpl({required this.repository});

  @override
  Future<Chart> getAll() async {
    final chartRepo = await repository.getAll();
    return chartRepo;
  }
}