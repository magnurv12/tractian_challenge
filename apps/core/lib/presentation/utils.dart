// ignore_for_file: non_constant_identifier_names

import '../../domain/interfaces/interfaces.dart';
import '../../infrastructure/modular/modular.dart';

///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final DependencyManager DM = ModularDependencyManager.i();
