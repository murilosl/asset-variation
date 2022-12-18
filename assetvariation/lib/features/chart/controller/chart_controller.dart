import 'package:assetvariation/core/controller/async_fetch_state_controller.dart';
import 'package:assetvariation/features/chart/controller/chart_controller_impl.dart';
import 'package:assetvariation/features/chart/usecase/chart_usecase.dart';
import 'package:assetvariation/features/chart/view/chart_screen_layout_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ChartController extends AsyncFetchStateController<ChartScreenLayoutData> {

  static getALL({
    required String args,
  }) => _getAll(args);
}

final _getAll = StateNotifierProvider.family<ChartController, 
    AsyncValue<ChartScreenLayoutData>, String>(
      (ref, arg) => ChartControllerImpl(
        chartUsecase: ref.read(
          ChartUsecase.provider(),
        ),
    ),
);