import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../domain/domain.dart';

part 'assets_state.freezed.dart';

/// The assets page state
@freezedNoHelpers
sealed class AssetsState extends ViewModelState with _$AssetsState {
  /// Creates a loading state
  const factory AssetsState.loading() = AssetsStateLoading;

  /// Creates a loaded state
  const factory AssetsState.loaded({
    required List<TreeNode> nodes,
  }) = AssetsStateLoaded;

  /// Creates an error state
  const factory AssetsState.error() = AssetsStateError;
}
