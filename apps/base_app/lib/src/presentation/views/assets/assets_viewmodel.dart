import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/domain.dart';
import 'assets_state.dart';

/// The home page view model
class AssetsViewmodel extends ViewModel<AssetsState> {
  final IGetViewTreeUseCase _getViewTreeUseCase;

  /// Creates a [AssetsViewmodel]
  AssetsViewmodel(
    this._getViewTreeUseCase,
  ) : super(const AssetsState.loading());

  /// Load the tree based on the company id
  Future<void> loadTree(String companyId) async {
    emit(const AssetsState.loading());
    final result = await compute(_getViewTreeUseCase.call, companyId);
    final state = result.fold(
      (error) => const AssetsState.error(),
      (nodes) => AssetsState.loaded(
        nodes: nodes,
      ),
    );
    emit(state);
  }
}
