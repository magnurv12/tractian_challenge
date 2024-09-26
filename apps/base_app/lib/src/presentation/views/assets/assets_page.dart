import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../views.dart';

/// A page that displays the details of an asset.
///
/// The [AssetsPage] requires an [id] to identify which asset to display.
class AssetsPage extends StatefulWidget {
  ///
  /// Parameters:
  /// - `id`: The unique identifier of the asset to be displayed.
  final String id;

  /// Constructor [AssetsPage]
  const AssetsPage({
    super.key,
    required this.id,
  });

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends ViewState<AssetsPage, AssetsViewmodel> {
  @override
  void initState() {
    super.initState();
    viewModel.loadTree(widget.id);
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
              body: ListView(
                children: [
                  for (final node in nodes) _ExpansionTitle(node: node),
                ],
              ),
            ),
          AssetsStateError() =>
            ErrorPage(onRetry: () => viewModel.loadTree(widget.id)),
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

class _ExpansionTitle extends StatelessWidget {
  final TreeNode node;
  const _ExpansionTitle({
    super.key,
    required this.node,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(node.name),
      initiallyExpanded: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
      childrenPadding: const EdgeInsets.only(
        left: 24.0,
      ),
      children: switch (node) {
        Location(:final children) => [
            for (final child in children) _ExpansionTitle(node: child),
          ],
        Asset(:final children) => [
            for (final child in children) _ExpansionTitle(node: child),
          ],
        _ => [],
      },
    );
  }
}
