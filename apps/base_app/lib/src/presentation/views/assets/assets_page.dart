import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../views.dart';

/// {@template assets_page}
/// A [StatefulWidget] that represents the assets page of a company.
///
/// The [AssetsPage] requires a [companyId] to fetch and display the assets
/// associated with the specified company.
///
/// The [companyId] is a required parameter.
///
/// Example usage:
/// ```dart
/// AssetsPage(companyId: '12345');
/// ```
/// {@endtemplate}
class AssetsPage extends StatefulWidget {
  /// The unique identifier of the company.
  final String companyId;

  /// {@macro assets_page}
  const AssetsPage({
    super.key,
    required this.companyId,
  });

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends ViewState<AssetsPage, AssetsViewmodel> {
  @override
  void initState() {
    super.initState();
    viewModel.loadTree(widget.companyId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetsViewmodel, AssetsState>(
      bloc: viewModel,
      builder: (context, state) {
        return switch (state) {
          AssetsStateLoaded(:final nodes) => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('Assets Page'),
              ),
              body: Column(
                children: [
                  SearchHeader(
                    onSearchName: viewModel.filterByName,
                    onSearchSensorType: viewModel.filterBySensorType,
                    onSearchStatus: viewModel.filterByStatus,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final node = nodes[index];
                        return ExpansionTitleCustom(
                          node: node,
                        );
                      },
                      itemCount: nodes.length,
                    ),
                  ),
                ],
              ),
            ),
          AssetsStateError() =>
            ErrorPage(onRetry: () => viewModel.loadTree(widget.companyId)),
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
