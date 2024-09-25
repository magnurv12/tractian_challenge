import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BaseAppWidget extends StatefulWidget {
  const BaseAppWidget({super.key});

  @override
  State<BaseAppWidget> createState() => _BaseAppWidgetState();
}

class _BaseAppWidgetState extends State<BaseAppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      title: 'Flutter Demo',
    );
  }
}
