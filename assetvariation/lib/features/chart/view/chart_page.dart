import 'package:assetvariation/features/chart/controller/chart_controller.dart';
import 'package:assetvariation/features/chart/view/chart_screen.dart';
import 'package:assetvariation/features/chart/view/chart_screen_layout_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChartPage extends HookConsumerWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ChartScreenLayoutData> controller = ref.watch(
      ChartController.getALL(args: "PETR4.SA"),
    );

    return Container(
      child: controller.when(
        data: (layoutData) => ChartScreen(
          data: layoutData,
        ),
        error: (err, stack) => Text('Error $err'), 
        loading: () => const Center(
          child: CircularProgressIndicator(),
        )
        ),
    );
  }
  
}