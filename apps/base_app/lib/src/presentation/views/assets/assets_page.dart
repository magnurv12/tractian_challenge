import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../shared/shared.dart';
import 'assets_state.dart';
import 'assets_viewmodel.dart';

/// A page that displays the details of an asset.
///
/// The [AssetsPage] requires an [id] to identify which asset to display.
class AssetsPage extends StatefulWidget {
  final String id;

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
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  final node = nodes[index];
                  return _ExpansionTitle(
                    node: node,
                  );
                },
                itemCount: nodes.length,
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
    required this.node,
  });

  @override
  State<_ExpansionTitle> createState() => _ExpansionTitleState();
}

class _ExpansionTitleState extends State<_ExpansionTitle> {
  bool _isExpanded = false;
  bool _isVisible = false;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _ExpansionTitle oldWidget) {
    if (oldWidget != widget) {
      _checkVisibility();
      super.didUpdateWidget(oldWidget);
    }
  }

  void _checkVisibility() {
    final renderObject = _key.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero); // Posição na tela
      final screenHeight = MediaQuery.of(context).size.height;

      final isVisible =
          offset.dy < screenHeight && offset.dy + renderObject.size.height > 0;

      if (_isVisible != isVisible) {
        setState(() {
          _isVisible = isVisible;
          _isExpanded = _isVisible;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Recalcula a visibilidade após o frame ser renderizado
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());

    return Column(
      key: _key,
      children: [
        ListTile(
          title: Text(widget.node.name),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
        ),
        _isExpanded
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: switch (widget.node) {
                  Location(:final children) => ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: children.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final node = children[index];
                        return _ExpansionTitle(
                          node: node,
                        );
                      },
                    ),
                  Asset(:final children) => ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: children.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final node = children[index];
                        return _ExpansionTitle(
                          node: node,
                        );
                      },
                    ),
                  _ => const SizedBox.shrink(),
                },
                // Se não for visível, não renderiza os filhos
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
