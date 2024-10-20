import 'package:flutter/foundation.dart';

/// The root level of the tree.
const int treeRootLevel = 0;

/// A function type that provides the children of a given node.
///
/// Takes a node of type `T` and returns an iterable of its children.
typedef ChildrenProvider<T> = Iterable<T> Function(T node);

/// A function type that visits a node.///
/// Takes a node of type `T` and performs an operation on it.
typedef Visitor<T> = void Function(T node);

/// A function type that evaluates a predicate on a value.ol///
/// Takes a value of type `T` and returns `true` if the value satisfies the predicate, otherwise `false`.
typedef ValuePredicate<T> = bool Function(T value);

/// {@template tree_controller}
/// A controller for managing a tree structure of objects.
///
/// The [TreeController] class is a generic controller that extends [ChangeNotifier]
/// and is used to manage a tree structure of objects of type [T]. It provides
/// functionality to handle the roots of the tree, a provider for the children of
/// each node, and an optional provider for the parent of each node. Additionally,
/// it allows setting a default expansion state for the tree nodes.
///
/// The type parameter [T] must extend [Object].
///
/// The [TreeController] constructor requires the following parameters:
/// - [roots]: An iterable of root objects of type [T].
/// - [childrenProvider]: A function that provides the children of a given node.
///
/// Optional parameters:
/// - [parentProvider]: A function that provides the parent of a given node.
/// - [defaultExpansionState]: A boolean indicating the default expansion state
///   of the tree nodes. Defaults to `false`.
/// {@endtemplate}
class TreeController<T extends Object> with ChangeNotifier {
  /// {@macro tree_controller}
  TreeController({
    required Iterable<T> roots,
    required this.childrenProvider,
    this.defaultExpansionState = false,
  }) : _roots = roots;

  /// The roots of the tree.
  Iterable<T> get roots => _roots;
  Iterable<T> _roots;
  set roots(Iterable<T> nodes) {
    if (nodes == _roots) return;
    _roots = nodes;
    rebuild();
  }

  /// The function that provides the children of a given node.
  final ChildrenProvider<T> childrenProvider;

  /// The default expansion state of the tree nodes.
  final bool defaultExpansionState;

  /// The nodes that have been toggled.
  late final Set<T> toggledNodes = <T>{};

  /// Returns the expansion state of a given node.
  bool getExpansionState(T node) {
    return toggledNodes.contains(node) ^ defaultExpansionState;
  }

  /// Sets the expansion state of a given node.
  void setExpansionState(T node, bool expanded) {
    expanded ^ defaultExpansionState
        ? toggledNodes.add(node)
        : toggledNodes.remove(node);
  }

  /// Rebuilds the tree view.
  void rebuild() => notifyListeners();

  void _collapse(T node) => setExpansionState(node, false);
  void _expand(T node) => setExpansionState(node, true);

  /// Toggles the expansion state of a given node.
  void toggleExpansion(T node) {
    setExpansionState(node, !getExpansionState(node));
    rebuild();
  }

  void _applyCascadingAction(Iterable<T> nodes, Visitor<T> action) {
    for (final T node in nodes) {
      action(node);
      _applyCascadingAction(childrenProvider(node), action);
    }
  }

  /// Expands the given nodes and all their descendants.
  void expandCascading(Iterable<T> nodes) {
    if (nodes.isEmpty) return;
    _applyCascadingAction(nodes, _expand);
    rebuild();
  }

  /// Collapses the given nodes and all their descendants.
  void collapseCascading(Iterable<T> nodes) {
    if (nodes.isEmpty) return;
    _applyCascadingAction(nodes, _collapse);
    rebuild();
  }

  /// Expands all nodes in the tree.
  void expandAll() => expandCascading(roots);

  /// Collapses all nodes in the tree.
  void collapseAll() => collapseCascading(roots);

  /// Searches the tree for nodes that satisfy the given predicate.
  TreeSearchResult<T> search(ValuePredicate<T> predicate) {
    final Map<T, TreeSearchMatch> allMatches = <T, TreeSearchMatch>{};

    (int subtreeNodeCount, int subtreeMatchCount) traverse(Iterable<T> nodes) {
      int totalNodeCount = 0;
      int totalMatchCount = 0;

      for (final T child in nodes) {
        final bool isDirectMatch = predicate(child);
        if (isDirectMatch) {
          totalMatchCount++;
          allMatches[child] = const TreeSearchMatch();
        }

        final (int nodes, int matches) = traverse(childrenProvider(child));
        totalNodeCount += nodes + 1;
        totalMatchCount += matches;

        if (matches > 0 || isDirectMatch) {
          allMatches[child] = TreeSearchMatch(
            isDirectMatch: isDirectMatch,
            subtreeNodeCount: nodes,
            subtreeMatchCount: matches,
          );

          // Add all descendant matches if the current node is a direct match
          if (isDirectMatch) {
            void addDescendants(T node) {
              for (final T descendant in childrenProvider(node)) {
                allMatches[descendant] = const TreeSearchMatch(
                  isDirectMatch: false,
                  subtreeNodeCount: 0,
                  subtreeMatchCount: 0,
                );
                addDescendants(descendant);
              }
            }

            addDescendants(child);
          }
        }
      }
      return (totalNodeCount, totalMatchCount);
    }

    final (int totalNodeCount, int totalMatchCount) = traverse(roots);
    return TreeSearchResult<T>(
      matches: allMatches,
      totalNodeCount: totalNodeCount,
      totalMatchCount: totalMatchCount,
    );
  }

  /// Traverses the tree in a depth-first manner.
  void depthFirstTraversal({
    required Visitor<TreeEntry<T>> onTraverse,
    ValuePredicate<TreeEntry<T>>? descendCondition,
    TreeEntry<T>? rootEntry,
  }) {
    final ValuePredicate<TreeEntry<T>> shouldDescend =
        descendCondition ?? defaultDescendCondition;

    int treeIndex = 0;

    void createTreeEntriesRecursively({
      required TreeEntry<T>? parent,
      required Iterable<T> nodes,
      required int level,
    }) {
      TreeEntry<T>? entry;

      for (final T node in nodes) {
        final Iterable<T> children = childrenProvider(node);
        entry = TreeEntry<T>(
          parent: parent,
          node: node,
          index: treeIndex++,
          isExpanded: getExpansionState(node),
          level: level,
          hasChildren: children.isNotEmpty,
        );

        onTraverse(entry);

        if (shouldDescend(entry) && entry.hasChildren) {
          createTreeEntriesRecursively(
            parent: entry,
            nodes: children,
            level: level + 1,
          );
        }
      }

      entry?._hasNextSibling = false;
    }

    if (rootEntry != null) {
      createTreeEntriesRecursively(
        parent: rootEntry,
        nodes: childrenProvider(rootEntry.node),
        level: rootEntry.level + 1,
      );
    } else {
      createTreeEntriesRecursively(
        parent: null,
        nodes: roots,
        level: treeRootLevel,
      );
    }
  }

  /// The default condition for descending into a tree node.
  @visibleForTesting
  bool defaultDescendCondition(TreeEntry<T> entry) => entry.isExpanded;

  @override
  void dispose() {
    _roots = const Iterable.empty();
    toggledNodes.clear();
    super.dispose();
  }
}

/// {@template tree_search_result}
/// A class representing the result of a tree search operation.
///
/// This class holds the matches found during the search, as well as the total
/// number of nodes and matches.
///
/// Type parameter:
/// - `T`: The type of the nodes in the tree.
///
/// Properties:
/// - `matches`: A map of nodes to their corresponding search matches.
/// - `totalNodeCount`: The total number of nodes in the tree.
/// - `totalMatchCount`: The total number of matches found in the search.
///
/// Methods:
/// - `hasMatch(T node)`: Checks if a given node has a match in the search results.
///
/// This class also includes diagnostic properties for debugging purposes.
/// {@endtemplate}
class TreeSearchResult<T extends Object> with Diagnosticable {
  /// {@macro tree_search_result}
  const TreeSearchResult({
    required this.matches,
    this.totalNodeCount = 0,
    this.totalMatchCount = 0,
  });

  /// A map of nodes to their corresponding search matches.
  final Map<T, TreeSearchMatch> matches;

  /// The total number of nodes in the tree.
  final int totalNodeCount;

  /// The total number of matches found in the search.
  final int totalMatchCount;

  /// Checks if a given node has a match in the search results.
  bool hasMatch(T node) => matches.containsKey(node);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty.lazy('matches', () => matches))
      ..add(IntProperty('total node count', totalNodeCount))
      ..add(IntProperty('total match count', totalMatchCount));
  }
}

/// {@template tree_search_match}
/// A class representing the result of a tree search match.
///
/// This class is used to store information about whether a node in a tree
/// is a direct match, as well as the count of nodes and matches in the subtree.
///
/// The [TreeSearchMatch] class includes:
/// - [isDirectMatch]: A boolean indicating if the node is a direct match.
/// - [subtreeNodeCount]: An integer representing the count of nodes in the subtree.
/// - [subtreeMatchCount]: An integer representing the count of matches in the subtree.
///
/// The class also overrides the [debugFillProperties] method to add custom
/// diagnostic properties, and provides implementations for [hashCode] and
/// [operator ==] for equality comparison.
/// {@endtemplate}
class TreeSearchMatch with Diagnosticable {
  /// {@macro tree_search_match}
  const TreeSearchMatch({
    this.isDirectMatch = true,
    this.subtreeNodeCount = 0,
    this.subtreeMatchCount = 0,
  });

  /// A boolean indicating if the node is a direct match.
  final bool isDirectMatch;

  /// The count of nodes in the subtree.
  final int subtreeNodeCount;

  /// The count of matches in the subtree.
  final int subtreeMatchCount;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('direct match', isDirectMatch))
      ..add(IntProperty('subtree node count', subtreeNodeCount))
      ..add(IntProperty('subtree match count', subtreeMatchCount));
  }

  @override
  int get hashCode => Object.hash(
        isDirectMatch,
        subtreeNodeCount,
        subtreeMatchCount,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TreeSearchMatch &&
        other.runtimeType == runtimeType &&
        other.isDirectMatch == isDirectMatch &&
        other.subtreeNodeCount == subtreeNodeCount &&
        other.subtreeMatchCount == subtreeMatchCount;
  }
}

/// {@template tree_entry}
/// A class representing an entry in a tree structure.
///
/// The [TreeEntry] class is used to manage nodes within a tree, providing
/// information about the node's parent, its position within the tree, and
/// its state (e.g., whether it is expanded or has children).
///
/// The type parameter [T] represents the type of the node.
///
/// Properties:
/// - [parent]: The parent entry of this node. It can be null if this node is the root.
/// - [node]: The actual data or node represented by this entry.
/// - [index]: The position of this node within its parent's children.
/// - [level]: The depth level of this node within the tree.
/// - [isExpanded]: A boolean indicating whether this node is expanded.
/// - [hasChildren]: A boolean indicating whether this node has children.
/// - [hasNextSibling]: A boolean indicating whether this node has a next sibling.
/// - [skipIndentAndPaint]: A boolean indicating whether to skip indenting and painting for this node.
/// {@endtemplate}
class TreeEntry<T extends Object> {
  /// {@macro tree_entry}
  TreeEntry({
    required this.parent,
    required this.node,
    required this.index,
    required this.level,
    required this.isExpanded,
    required this.hasChildren,
    bool hasNextSibling = true,
  }) : _hasNextSibling = hasNextSibling;

  /// The parent entry of this node.
  final TreeEntry<T>? parent;

  /// The actual data or node represented by this entry.
  final T node;

  /// The position of this node within its parent's children.
  final int index;

  /// The depth level of this node within the tree.
  final int level;

  /// A boolean indicating whether this node is expanded.
  final bool isExpanded;

  /// A boolean indicating whether this node has children.
  final bool hasChildren;

  /// A boolean indicating whether this node has a next sibling.
  bool get hasNextSibling => _hasNextSibling;

  /// A boolean indicating whether to skip indenting and painting for this node.
  bool _hasNextSibling;

  /// A boolean indicating whether to skip indenting and painting for this node.
  bool get skipIndentAndPaint => level <= treeRootLevel;
}
