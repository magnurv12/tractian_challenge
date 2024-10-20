import 'package:dependencies/dependencies.dart';

import '../../../domain/domain.dart';
import '../../../presentation/presentation.dart' show DM;

///
/// Dependency manager implementation with Modular package
///
class ModularDependencyManager implements DependencyManager {
  ModularDependencyManager._();

  static ModularDependencyManager? _instance;

  ///
  /// Static instance for DM
  ///
  static ModularDependencyManager i() {
    _instance ??= ModularDependencyManager._();

    return _instance!;
  }

  @override
  T get<T extends Object>() {
    return Modular.get<T>();
  }

  @override
  bool dispose<T extends Object>() {
    return Modular.dispose<T>();
  }

  @override
  T? getOrNull<T extends Object>() {
    try {
      return DM.get<T>();
    } catch (_) {
      return null;
    }
  }
}
