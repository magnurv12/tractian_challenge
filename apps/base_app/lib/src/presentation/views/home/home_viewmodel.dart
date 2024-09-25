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
    _loadData();
    super.initViewModel();
  }

  Future<void> _loadData() async {
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
