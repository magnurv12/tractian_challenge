import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
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
  late final TreeController<TreeNode> _controller;

  TreeSearchResult<TreeNode>? filter;
  Pattern? searchPattern;

  void searchByText(String? text) {
    if (text == null || text.isEmpty) {
      clearSearch();
      return;
    }

    filter = null;
    searchPattern = RegExp(RegExp.escape(text), caseSensitive: false);
    filter = _controller.search((TreeNode node) {
      return node.name.contains(searchPattern!);
    });
    _controller.rebuild();
  }

  void searchBySensorType(SensorType? sensorType) {
    if (sensorType == null) {
      clearSearch();
      return;
    }

    filter = _controller.search((TreeNode node) {
      if (node is Component) {
        return node.sensorType == sensorType;
      }
      return false;
    });
    _controller.rebuild();
  }

  void searchByStatus(SensorStatus? status) {
    if (status == null) {
      clearSearch();
      return;
    }

    filter = _controller.search((TreeNode node) {
      if (node is Component) {
        return node.status == status;
      }
      return false;
    });
    _controller.rebuild();
  }

  void clearSearch() {
    if (filter == null) return;

    filter = null;
    searchPattern = null;
    _controller.rebuild();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssetsViewmodel, AssetsState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state case AssetsStateLoaded(:final nodes)) {
          _controller = TreeController<TreeNode>(
            roots: nodes.where((node) => filter?.hasMatch(node) ?? true),
            defaultExpansionState: true,
            childrenProvider: (node) => switch (node) {
              Asset(:final children) =>
                children.where(filter?.hasMatch ?? (_) => true),
              Location(:final children) =>
                children.where(filter?.hasMatch ?? (_) => true),
              _ => [],
            },
          );
        }
      },
      builder: (context, state) {
        return switch (state) {
          AssetsStateLoaded() => Scaffold(
              appBar: AppBar(
                title: const Text('Assets'),
              ),
              body: Column(
                children: [
                  SearchHeader(
                    onSearchName: searchByText,
                    onSearchSensorType: searchBySensorType,
                    onSearchStatus: searchByStatus,
                  ),
                  Expanded(
                    child: TreeView<TreeNode>(
                      treeController: _controller,
                      nodeBuilder: (context, entry) {
                        return TreeTile(
                          entry: entry,
                          searchPattern: searchPattern,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          AssetsStateError() =>
            ErrorPage(onRetry: () => viewModel.loadTree(widget.companyId)),
          _ => Scaffold(
              appBar: AppBar(
                title: const Text('Assets'),
              ),
              body: const Center(child: CircularProgressIndicator()),
            ),
        };
      },
    );
  }
}
