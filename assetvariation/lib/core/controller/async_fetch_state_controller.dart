// ignore_for_file: nullable_type_in_catch_clause

import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AsyncFetchStateController<T>
    extends StateNotifier<AsyncValue<T>> {
  AsyncFetchStateController() : super(const AsyncValue.loading()) {
    _fetchAsyncValue();
  }

  Future<void> _fetchAsyncValue() async {
    state = await _guard(() async => await fetch());
  }

  Future<T> fetch();

  Future<void> refresh() async {
    await _fetchAsyncValue();
  }

  updateState(T? newState) async {
    state = await _guard(() async => newState!);
  }

  Future<AsyncValue<T>> _guard(Future<T> Function() future) async {
    try {
      return AsyncValue.data(await future());
    }  catch (_) {
      rethrow;
    } catch (err, stack) {
      return AsyncValue.error(err, stack);
    }
  }
}