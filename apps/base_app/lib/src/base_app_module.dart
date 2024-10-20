import 'package:dependencies/dependencies.dart';

import 'base_app_module_routing.dart';
import 'data/datasources/datasources.dart';
import 'data/repositories/repository.dart';
import 'domain/domain.dart';
import 'presentation/views/views.dart';

/// Base app module
class BaseAppModule extends Module {
  static final _url = Uri.https('fake-api.tractian.com');

  @override
  void binds(i) {
    i.add<IDataSource>(
      () => RemoteDataSource(_url),
    );
    i.add<IRepository>(Repository.new);
    i.add(HomeViewmodel.new);
    i.add(AssetsViewmodel.new);
    i.add<IGetCompaniesUseCase>(GetCompaniesUseCase.new);
    i.add<IGetViewTreeUseCase>(GetViewTreeUseCase.new);
  }

  @override
  void routes(r) {
    r.child(BaseAppModuleRouting.home, child: (_) => const HomePage());
    r.child(
      BaseAppModuleRouting.assets,
      child: (_) => AssetsPage(companyId: r.args.data),
      transition: TransitionType.defaultTransition,
    );
  }
}
