import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

part 'home_state.freezed.dart';

/// The home page state
@freezedNoHelpers
sealed class HomeState extends ViewModelState with _$HomeState {

  /// Creates a loading state
  const factory HomeState.loading() = HomeStateLoading;

  /// Creates a loaded state
  const factory HomeState.loaded() = HomeStateLoaded;

  /// Creates an error state
  const factory HomeState.error() = HomeStateError;
}
