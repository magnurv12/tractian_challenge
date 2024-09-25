import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../views.dart';

/// The home page of the application
class HomePage extends StatefulWidget {
  /// Constructor [HomePage]
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
          HomeStateLoaded() => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('widget.title'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      'Teste',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Modular.to.pushNamed('/assets', arguments: '5');
                },
                tooltip: 'Navigate',
                child: const Icon(Icons.join_inner_sharp),
              ),
            ),
          _ => const CircularProgressIndicator(),
        };
      },
    );
  }
}
