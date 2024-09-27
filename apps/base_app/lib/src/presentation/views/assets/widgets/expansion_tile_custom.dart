import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

/// {@template expansion_title_custom}
/// A custom expansion tile widget that displays a tree node.
///
/// This widget is a stateful widget that takes a [TreeNode] as a required parameter.
/// It creates an instance of [_ExpansionTitleCustomState] to manage its state.
///
/// Example usage:
/// ```dart
/// ExpansionTitleCustom(
///   node: myTreeNode,
/// )
/// ```
///
/// [node]: The tree node to be displayed in the expansion tile.
/// {@endtemplate}

class ExpansionTitleCustom extends StatefulWidget {
  /// The tree node to be displayed in the expansion tile.
  final TreeNode node;

  ///{@macro expansion_title_custom}
  const ExpansionTitleCustom({
    super.key,
    required this.node,
  });

  @override
  State<ExpansionTitleCustom> createState() => _ExpansionTitleCustomState();
}

class _ExpansionTitleCustomState extends State<ExpansionTitleCustom> {
  bool _isExpanded = false;
  bool _isVisible = false;
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpansionTitleCustom oldWidget) {
    if (oldWidget != widget) {
      _checkVisibility();
      super.didUpdateWidget(oldWidget);
    }
  }

  void _checkVisibility() {
    final renderObject = _key.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero);
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      child: Column(
        key: _key,
        children: [
          ListTile(
            title: Text(widget.node.name),
            trailing: switch (widget.node) {
              Component(:final sensorType, :final status) =>
                _buildSensorIcon(sensorType, status),
              _ => const SizedBox.shrink(),
            },
            leading: switch (widget.node) {
              Location(:final children) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    children.isEmpty
                        ? const SizedBox.shrink()
                        : Icon(
                            _isExpanded ? Icons.expand_less : Icons.expand_more,
                          ),
                    Image.asset('assets/images/location.png'),
                  ],
                ),
              Asset(:final children) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (children.isNotEmpty)
                      Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                    Image.asset('assets/images/asset.png'),
                  ],
                ),
              Component() => Image.asset('assets/images/component.png'),
              _ => const SizedBox.shrink(),
            },
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
                          return ExpansionTitleCustom(
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
                          return ExpansionTitleCustom(
                            node: node,
                          );
                        },
                      ),
                    _ => const SizedBox.shrink(),
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildSensorIcon(SensorType sensorType, SensorStatus status) {
    IconData icon;
    Color iconColor;

    switch (sensorType) {
      case SensorType.energy:
        icon = Icons.bolt;
        break;
      case SensorType.vibration:
        icon = Icons.circle;
        break;
    }

    switch (status) {
      case SensorStatus.operating:
        iconColor = Colors.green;
        break;
      case SensorStatus.alert:
        iconColor = Colors.red;
        break;
    }

    return Icon(icon, color: iconColor);
  }
}
