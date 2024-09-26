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
              body: ListView.builder(
                itemCount: nodes.length,
                itemBuilder: (context, index) {
                  final node = nodes[index];
                  return _ExpansionTitle(
                    node: node,
                  );
                },
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

class _ExpansionTitle extends StatefulWidget {
  final TreeNode node;
  const _ExpansionTitle({
    super.key,
    required this.node,
  });

  @override
  State<_ExpansionTitle> createState() => _ExpansionTitleState();
}

class _ExpansionTitleState extends State<_ExpansionTitle> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.node.name),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child:
              _isExpanded || (widget.node is Location || widget.node is Asset)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: switch (widget.node) {
                        Location(:final children) => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: children.length,
                            itemBuilder: (context, index) {
                              final node = children[index];
                              return _ExpansionTitle(
                                node: node,
                              );
                            },
                          ),
                        Asset(:final children) => ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: children.length,
                            itemBuilder: (context, index) {
                              final node = children[index];
                              return _ExpansionTitle(
                                node: node,
                              );
                            },
                          ),
                        _ => const SizedBox.shrink(),
                      },
                    )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
