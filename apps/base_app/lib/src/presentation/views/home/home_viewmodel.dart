import 'package:core/core.dart';

import 'home_state.dart';

/// The home page view model
class HomeViewmodel extends ViewModel<HomeState> {
  /// Creates a [HomeViewmodel]
  HomeViewmodel() : super(const HomeState.loading());

  @override
  void initViewModel() {
    _loadData();
    super.initViewModel();
  }

  Future<void> _loadData() async {
    emit(const HomeState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(const HomeState.loaded());
  }
}
