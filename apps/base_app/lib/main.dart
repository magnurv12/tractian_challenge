import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'src/base_app_module.dart';
import 'src/base_app_widget.dart';

void main() {
  runApp(ModularApp(module: BaseAppModule(), child: const BaseAppWidget()));
}
