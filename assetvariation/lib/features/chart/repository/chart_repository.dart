import 'package:assetvariation/core/provider/dio_provider.dart';
import 'package:assetvariation/features/chart/model/chart.dart';
import 'package:assetvariation/features/chart/repository/chart_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ChartRepository {
  Future<Chart> getAll();
  static provider() => _provider;
}

final _provider = Provider<ChartRepositoryImpl>(
  (ref) => ChartRepositoryImpl(
    ref.read(dioProvider).build(),
  ),
);