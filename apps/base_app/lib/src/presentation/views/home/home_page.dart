import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../base_app_module_routing.dart';
import '../views.dart';

/// {@template home_page}
/// A `StatefulWidget` that represents the home page of the application.
///
/// This widget is the entry point for the home page and is responsible for
/// creating its corresponding state object, `_HomePageState`.
///
/// The `HomePage` widget requires a key, which can be passed to its constructor.
///
/// Example usage:
///
/// ```dart
/// HomePage(key: Key('home_page'));
/// ```
/// {@endtemplate}
class HomePage extends StatefulWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeViewmodel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewmodel, HomeState>(
      bloc: viewModel,
      builder: (context, state) {
        return switch (state) {
          HomeStateLoaded(:final companies) => Scaffold(
              appBar: AppBar(
                title: Image.asset('assets/images/logo.png'),
              ),
              body: ListView(
                children: companies
                    .map(
                      (company) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: IntrinsicWidth(
                          stepWidth: double.maxFinite,
                          stepHeight: 80.0,
                          child: ElevatedButton.icon(
                            onPressed: () => Modular.to.pushNamed(
                              BaseAppModuleRouting.assets,
                              arguments: company.id,
                            ),
                            label: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                company.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            icon: const Icon(CoreIcons.company),
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              alignment: Alignment.centerLeft,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: const Color(0xFF2188FF),
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          HomeStateError() => ErrorPage(onRetry: viewModel.loadData),
          _ => Scaffold(
              appBar: AppBar(
                title: const Text('Tractian'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            ),
        };
      },
    );
  }
}
