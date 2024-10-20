import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

/// The main function of the application
class BaseAppWidget extends StatefulWidget {
  /// Constructor [BaseAppWidget]
  const BaseAppWidget({super.key});

  @override
  State<BaseAppWidget> createState() => _BaseAppWidgetState();
}

class _BaseAppWidgetState extends State<BaseAppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      title: 'Flutter Demo',
    );
  }
}
