import 'package:flutter/material.dart';

import 'tree_controller.dart';

/// {@template tree_view}
/// A widget that displays a tree structure using a scrollable view.
///
/// The [TreeView] widget extends [BoxScrollView] and provides a way to
/// visualize hierarchical data in a tree format. It requires a
/// [TreeController] to manage the state of the tree and a [TreeNodeBuilder]
/// to build the individual nodes.
///
/// The [TreeView] widget supports various properties inherited from
/// [BoxScrollView] such as padding, controller, primary, physics, shrinkWrap,
/// cacheExtent, semanticChildCount, dragStartBehavior, keyboardDismissBehavior,
/// restorationId, and clipBehavior.
///
/// Example usage:
/// ```dart
/// TreeView<MyData>(
///   treeController: myTreeController,
///   nodeBuilder: (context, node) {
///     return MyNodeWidget(node: node);
///   },
/// )
/// ```
///
/// See also:
///  * [TreeController], which manages the state of the tree.
///  * [TreeNodeBuilder], which is a function that builds the individual nodes.
/// {@endtemplate}
class TreeView<T extends Object> extends BoxScrollView {
  /// {@macro tree_view}
  const TreeView({
    super.key,
    required this.treeController,
    required this.nodeBuilder,
    super.padding,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
  });

  /// The controller that manages the state of the tree.
  final TreeController<T> treeController;

  /// A function that builds the individual nodes.
  final TreeNodeBuilder<T> nodeBuilder;

  @override
  Widget buildChildLayout(BuildContext context) {
    return _SliverTree<T>(
      controller: treeController,
      nodeBuilder: nodeBuilder,
    );
  }
}

/// A function that builds a widget for a tree node.
typedef TreeNodeBuilder<T extends Object> = Widget Function(
  BuildContext context,
  TreeEntry<T> entry,
);

class _SliverTree<T extends Object> extends StatefulWidget {
  const _SliverTree({
    super.key,
    required this.controller,
    required this.nodeBuilder,
  });

  final TreeController<T> controller;

  final TreeNodeBuilder<T> nodeBuilder;

  @override
  State<_SliverTree<T>> createState() => _SliverTreeState<T>();
}

class _SliverTreeState<T extends Object> extends State<_SliverTree<T>> {
  List<TreeEntry<T>> _flatTree = const [];

  void _updateFlatTree() {
    final List<TreeEntry<T>> flatTree = [];
    widget.controller.depthFirstTraversal(
      onTraverse: flatTree.add,
    );
    _flatTree = flatTree;
  }

  void _rebuild() => setState(_updateFlatTree);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_rebuild);
    _updateFlatTree();
  }

  @override
  void didUpdateWidget(covariant _SliverTree<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_rebuild);
      widget.controller.addListener(_rebuild);
      _updateFlatTree();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_rebuild);
    _flatTree = const [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TreeViewScope<T>(
      controller: widget.controller,
      child: SliverList.builder(
        itemCount: _flatTree.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.nodeBuilder(context, _flatTree[index]);
        },
      ),
    );
  }
}

/// {@template tree_view_scope}
/// A widget that provides a [TreeController] to its descendants.
///
/// The [TreeViewScope] is an [InheritedWidget] that allows its descendants
/// to access a [TreeController] instance. This is useful for managing the
/// state and behavior of a tree view widget.
///
/// The [TreeViewScope] can be accessed using the [TreeViewScope.of] or
/// [TreeViewScope.maybeOf] static methods.
///
/// Example usage:
/// ```dart
/// final treeController = TreeViewScope.of<MyTreeType>(context).controller;
/// ```
///
/// The [controller] parameter is required and must not be null.
///
/// The [updateShouldNotify] method is overridden to notify dependents
/// when the [controller] changes.
///
/// Type Parameters:
/// - `T`: The type of the objects managed by the [TreeController].
///
/// See also:
/// - [TreeController], which manages the state and behavior of the tree view.
/// {@endtemplate}
class TreeViewScope<T extends Object> extends InheritedWidget {
  /// {@macro tree_view_scope}
  const TreeViewScope({
    super.key,
    required this.controller,
    required super.child,
  });

  /// The [TreeController] instance provided by this widget.
  final TreeController<T> controller;

  /// Returns the [TreeViewScope] of the nearest ancestor [TreeViewScope] widget.
  static TreeViewScope<T>? maybeOf<T extends Object>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TreeViewScope<T>>();
  }

  /// Returns the [TreeViewScope] of the nearest ancestor [TreeViewScope] widget.
  static TreeViewScope<T> of<T extends Object>(BuildContext context) {
    final TreeViewScope<T>? scope = maybeOf<T>(context);
    assert(() {
      if (scope == null) {
        throw FlutterError(
          'TreeViewScope.of() was called with a context that does not contain '
          'a TreeViewScope widget.\n'
          'No TreeViewScope widget ancestor could be found starting from the '
          'context that was passed to TreeViewScope.of(). This can happen '
          'because you are using a widget that looks for a TreeViewScope '
          'ancestor, but no such ancestor exists.\n'
          'The context used was:\n'
          '  $context',
        );
      }
      return true;
    }());
    return scope!;
  }

  @override
  bool updateShouldNotify(covariant TreeViewScope<T> oldWidget) {
    return oldWidget.controller != controller;
  }
}
