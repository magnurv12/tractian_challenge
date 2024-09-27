import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('Tractian'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: companies
                      .map(
                        (company) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => Modular.to.pushNamed(
                              '/assets',
                              arguments: company.id,
                            ),
                            child: Text(company.name),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          HomeStateError() => ErrorPage(onRetry: viewModel.loadData),
          _ => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('Tractian'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            ),
        };
      },
    );
  }
}
