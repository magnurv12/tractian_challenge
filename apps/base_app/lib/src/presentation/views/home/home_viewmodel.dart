import 'package:core/core.dart';

import '../../../domain/domain.dart';
import 'home_state.dart';

/// The home page view model
class HomeViewmodel extends ViewModel<HomeState> {
  final IGetCompaniesUseCase _getCompaniesUseCase;

  /// Creates a [HomeViewmodel]
  HomeViewmodel(
    this._getCompaniesUseCase,
  ) : super(const HomeState.loading());

  @override
  void initViewModel() {
    loadData();
    super.initViewModel();
  }

  /// Load the companies
  Future<void> loadData() async {
    emit(const HomeState.loading());
    final result = await _getCompaniesUseCase();
    final state = result.fold(
      (error) => const HomeState.error(),
      (companies) => HomeState.loaded(
        companies: companies,
      ),
    );
    emit(state);
  }
}
