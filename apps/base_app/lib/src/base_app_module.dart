import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_challenge/src/presentation/views/assets/assets_page.dart';
import 'package:tractian_challenge/src/presentation/views/home/home_page.dart';

import 'base_app_module_routing.dart';

class BaseAppModule extends Module {
  @override
  void routes(r) {
    r.child(BaseAppModuleRouting.home, child: (_) => const HomePage());
    r.child(BaseAppModuleRouting.assets,
        child: (_) => AssetsPage(id: r.args.data));
  }
}
