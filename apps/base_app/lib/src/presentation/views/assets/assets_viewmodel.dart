import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/domain.dart';
import 'assets_state.dart';

/// The assets page view model
class AssetsViewmodel extends ViewModel<AssetsState> {
  final IGetViewTreeUseCase _getViewTreeUseCase;

  /// Creates a [AssetsViewmodel]
  AssetsViewmodel(
    this._getViewTreeUseCase,
  ) : super(const AssetsState.loading());

  @override
  void initViewModel() {
    loadTree(Modular.args.data);
    super.initViewModel();
  }

  /// Load the tree
  Future<void> loadTree(String companyId) async {
    emit(const AssetsState.loading());

    /// This isolate is only necessary in cases worse than those of the Apex company.
    final result = await compute(_getViewTreeUseCase.call, companyId);
    final state = result.fold(
      (error) => const AssetsState.error(),
      (nodes) => AssetsState.loaded(nodes: nodes),
    );

    emit(state);
  }
}
