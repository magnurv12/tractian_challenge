import 'package:dependencies/dependencies.dart';

import 'base_app_module_routing.dart';
import 'presentation/views/views.dart';

/// Base app module
class BaseAppModule extends Module {
  @override
  void binds(i) {
    i.add(HomeViewmodel.new);
  }

  @override
  void routes(r) {
    r.child(BaseAppModuleRouting.home, child: (_) => const HomePage());
    r.child(BaseAppModuleRouting.assets,
        child: (_) => AssetsPage(id: r.args.data),);
  }
}
