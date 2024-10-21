import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import 'widgets.dart';

/// {@template tree_tile}
/// A widget that represents a tile in a tree structure.
///
/// The [TreeTile] widget is a stateful widget that displays a tree entry
/// and highlights a search pattern if provided.
///
/// The [entry] parameter is required and represents the tree entry to be displayed.
/// The [searchPattern] parameter is optional and can be used to highlight
/// matching text within the tree entry.
/// {@endtemplate}
class TreeTile extends StatefulWidget {
  /// {@macro tree_tile}
  const TreeTile({
    super.key,
    required this.entry,
    required this.searchPattern,
  });

  /// The tree entry to be displayed.
  final TreeEntry<TreeNode> entry;

  /// The search pattern to highlight within the tree entry.
  final Pattern? searchPattern;

  @override
  State<TreeTile> createState() => _TreeTileState();
}

class _TreeTileState extends State<TreeTile> {
  late InlineSpan titleSpan;

  TextStyle? dimStyle;
  TextStyle? highlightStyle;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setupTextStyles();
    titleSpan = buildTextSpan();
  }

  @override
  void didUpdateWidget(covariant TreeTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchPattern != widget.searchPattern ||
        oldWidget.entry.node.name != widget.entry.node.name) {
      titleSpan = buildTextSpan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TreeIndentation(
      entry: widget.entry,
      guide: IndentGuide.scopingLines(
        origin: .9,
        thickness: 1.0,
        color: Colors.black.withOpacity(.1),
        indent: 25,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Visibility.maintain(
              visible: widget.entry.hasChildren,
              child: ExpandIcon(
                key: GlobalObjectKey(widget.entry.node),
                isExpanded: widget.entry.isExpanded,
                onPressed: (_) => TreeViewScope.of<TreeNode>(context)
                  ..controller.toggleExpansion(widget.entry.node),
              ),
            ),
            _buildIcon(),
            const SizedBox(width: 8),
            Flexible(
              child: Text.rich(
                titleSpan,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            _buildSensorType(),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    const color = Color(0xFF2188FF);
    return switch (widget.entry.node) {
      Location() => const Icon(
          CoreIcons.location,
          size: 16,
          color: color,
        ),
      Asset() => const Icon(CoreIcons.asset, size: 16, color: color),
      Component() => const Icon(CoreIcons.component, size: 16, color: color),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildSensorType() {
    if (widget.entry.node case Component(:final sensorType, :final status)) {
      final color = switch (status) {
        SensorStatus.alert => Colors.red,
        SensorStatus.operating => Colors.green,
      };
      return switch (sensorType) {
        SensorType.energy => Icon(
            Icons.bolt,
            size: 20,
            color: color,
          ),
        SensorType.vibration => Icon(
            Icons.circle,
            size: 10,
            color: color,
          ),
      };
    }
    return const SizedBox.shrink();
  }

  void setupTextStyles() {
    final TextStyle style = DefaultTextStyle.of(context).style;
    final Color highlightColor = Theme.of(context).colorScheme.primary;
    highlightStyle = style.copyWith(
      color: highlightColor,
      decorationColor: highlightColor,
      decoration: TextDecoration.underline,
    );
    dimStyle = style;
  }

  InlineSpan buildTextSpan() {
    final String title = widget.entry.node.name;

    if (widget.searchPattern == null) {
      return TextSpan(text: title);
    }

    final List<InlineSpan> spans = <InlineSpan>[];
    bool hasAnyMatches = false;

    title.splitMapJoin(
      widget.searchPattern!,
      onMatch: (Match match) {
        hasAnyMatches = true;
        spans.add(TextSpan(text: match.group(0)!, style: highlightStyle));
        return '';
      },
      onNonMatch: (String text) {
        spans.add(TextSpan(text: text));
        return '';
      },
    );

    if (hasAnyMatches) {
      return TextSpan(children: spans);
    }

    return TextSpan(text: title, style: dimStyle);
  }
}
