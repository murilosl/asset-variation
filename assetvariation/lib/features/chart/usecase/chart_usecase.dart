import 'package:assetvariation/features/chart/model/chart.dart';
import 'package:assetvariation/features/chart/repository/chart_repository.dart';
import 'package:assetvariation/features/chart/usecase/chart_usecase_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ChartUsecase{
  Future<Chart> getAll();
  static provider() => _provider;
}

final _provider = Provider<ChartUsecase>(
  ((ref) => ChartUsecaseImpl(
    repository: ref.read(ChartRepository.provider()),
  ))
);