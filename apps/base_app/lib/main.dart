import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_challenge/src/base_app_widget.dart';

import 'src/base_app_module.dart';

void main() {
  runApp(ModularApp(module: BaseAppModule(), child: const BaseAppWidget()));
}
