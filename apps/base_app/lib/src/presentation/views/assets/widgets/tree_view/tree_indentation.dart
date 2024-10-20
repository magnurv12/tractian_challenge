import 'dart:math' as math show min;

import 'package:flutter/material.dart';

import 'tree_controller.dart';


/// {@template tree_indentation}
/// A widget that provides indentation for tree structures.
///
/// The [TreeIndentation] widget is used to indent child widgets based on the
/// level of the tree entry. It uses an [IndentGuide] to determine the amount
/// of indentation and how to render the indentation.
///
/// The [TreeIndentation] widget requires a [child] widget and a [TreeEntry]
/// object. An optional [guide] can be provided to customize the indentation
/// behavior. If no guide is provided, the [DefaultIndentGuide] will be used.
///
/// The [DefaultIndentGuide] is an [InheritedTheme] that provides a default
/// [IndentGuide] to its descendants. It can be used to wrap a subtree with a
/// specific indentation guide.
///
/// The [IndentGuide] class defines the properties and methods for customizing
/// the indentation. It includes properties such as [indent], [padding], and
/// [maxLevel]. The [wrap] method is used to wrap a child widget with the
/// specified indentation.
///
/// The [AbstractLineGuide] class extends [IndentGuide] and provides additional
/// properties and methods for drawing lines as part of the indentation. It
/// includes properties such as [color], [thickness], [origin], [strokeCap],
/// [strokeJoin], and [pathModifier]. The [createPainter] method is used to
/// create a custom painter for drawing the lines.
///
/// The [ScopingLinesGuide] class extends [AbstractLineGuide] and provides a
/// specific implementation for drawing scoping lines. It overrides the
/// [createPainter] method to return a [_ScopingLinesPainter] object.
///
/// The [_ScopingLinesPainter] class is a custom painter that draws the scoping
/// lines based on the properties of the [ScopingLinesGuide]. It calculates the
/// offset for each level and draws vertical lines from the top to the bottom
/// of the canvas.
///
/// Example usage:
///
/// ```dart
/// TreeIndentation(
///   entry: treeEntry,
///   child: Text('Indented Text'),
/// )
/// ```
/// {@endtemplate}
class TreeIndentation extends StatelessWidget {
  /// {@macro tree_indentation}
  const TreeIndentation({
    super.key,
    required this.child,
    required this.entry,
    this.guide,
  });

  /// The child widget to be indented.
  final Widget child;

  /// The tree entry object that contains the level of the indentation.
  final TreeEntry<Object> entry;

  /// The indentation guide to be used for customizing the indentation.
  final IndentGuide? guide;

  @override
  Widget build(BuildContext context) {
    if (entry.skipIndentAndPaint) {
      return child;
    }

    final IndentGuide effectiveGuide = guide ?? DefaultIndentGuide.of(context);
    return effectiveGuide.wrap(context, child, entry);
  }
}

/// {@template default_indent_guide}
/// A widget that provides an [IndentGuide] to its descendants.
///
/// This widget is an [InheritedTheme] that allows its descendants to access
/// the provided [IndentGuide] using the [DefaultIndentGuide.of] method.
///
/// The [DefaultIndentGuide] widget should be used to wrap a subtree where
/// the [IndentGuide] is needed. The [guide] parameter is required and specifies
/// the [IndentGuide] to be provided to the subtree.
///
/// Example usage:
/// ```dart
/// DefaultIndentGuide(
///   guide: myIndentGuide,
///   child: MyWidget(),
/// );
/// ```
///
/// To retrieve the [IndentGuide] in a descendant widget:
/// ```dart
/// IndentGuide guide = DefaultIndentGuide.of(context);
/// ```
///
/// The [updateShouldNotify] method ensures that the widget updates its
/// descendants when the [guide] changes.
///
/// The [wrap] method is used to wrap a given widget with the [DefaultIndentGuide].
///
/// See also:
///  * [InheritedTheme], which is the base class for this widget.
///  * [IndentGuide], which is the type of the guide provided by this widget.
/// {@endtemplate}
class DefaultIndentGuide extends InheritedTheme {
  /// {@macro default_indent_guide}
  const DefaultIndentGuide({
    super.key,
    required super.child,
    required this.guide,
  });

  /// The [IndentGuide] to be provided to the descendants.
  final IndentGuide guide;

  /// Retrieves the [IndentGuide] from the given [BuildContext].
  static IndentGuide of(BuildContext context) {
    final DefaultIndentGuide? instance =
        context.dependOnInheritedWidgetOfExactType<DefaultIndentGuide>();

    return instance?.guide ?? const ScopingLinesGuide();
  }

  @override
  bool updateShouldNotify(DefaultIndentGuide oldWidget) {
    return oldWidget.guide != guide;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DefaultIndentGuide(guide: guide, child: child);
  }
}

const int _largestPositiveInteger = -1 >>> 1;

/// {@template indent_guide}
/// This function takes a list of integers and returns a new list containing
/// only the even numbers from the original list.
///
/// The function iterates through each element in the input list, checks if
/// the element is even, and if so, adds it to the result list.
///
/// - Parameter numbers: A list of integers to filter.
/// - Returns: A new list containing only the even integers from the input list.
/// {@endtemplate}
class IndentGuide {
  /// Creates an [IndentGuide] with the given parameters.
  const IndentGuide({
    this.indent = 40.0,
    this.padding = EdgeInsets.zero,
    this.maxLevel = _largestPositiveInteger,
  })  : assert(indent >= 0.0),
        assert(maxLevel >= 0);

  /// The amount of indentation for each level.
  const factory IndentGuide.scopingLines({
    double indent,
    EdgeInsetsGeometry padding,
    Color color,
    double thickness,
    double origin,
    StrokeCap strokeCap,
    StrokeJoin strokeJoin,
    PathModifier? pathModifier,
  }) = ScopingLinesGuide;

  /// The amount of indentation for each level.
  final double indent;

  /// The padding to be applied to the child widget.
  final int maxLevel;

  /// The maximum level of indentation.
  final EdgeInsetsGeometry padding;

  int _constrainLevel(int level) => math.min(level, maxLevel);

  /// Wraps the given child widget with the specified indentation.
  Widget wrap(BuildContext context, Widget child, TreeEntry<Object> entry) {
    return Padding(
      padding: padding.add(
        EdgeInsetsDirectional.only(
          start: _constrainLevel(entry.level) * indent,
        ),
      ),
      child: child,
    );
  }
}

/// A function that modifies a [Path] object.
typedef PathModifier = Path Function(Path path);

/// {@template abstract_line_guide}
/// An abstract class that extends [IndentGuide] to provide a customizable
/// line guide for tree views.
///
/// The [AbstractLineGuide] class allows you to define the appearance and
/// behavior of indentation lines in a tree view. It provides properties
/// for customizing the color, thickness, origin, stroke cap, stroke join,
/// and path modifier of the lines.
///
/// The class also includes methods for creating a custom painter, creating
/// a paint object, calculating the offset of a level, and wrapping a widget
/// with a repaint boundary and custom paint.
/// {@endtemplate}
abstract class AbstractLineGuide extends IndentGuide {
  /// {@macro abstract_line_guide}
  const AbstractLineGuide({
    super.indent,
    super.padding,
    super.maxLevel,
    this.color = Colors.grey,
    this.thickness = 2.0,
    this.origin = 0.5,
    this.strokeCap = StrokeCap.butt,
    this.strokeJoin = StrokeJoin.miter,
    this.pathModifier,
  })  : assert(thickness >= 0.0),
        assert(
          0.0 <= origin && origin <= 1.0,
          '`origin` must be a value between `0.0` and `1.0`.',
        ),
        originOffset = indent - (indent * origin);

  /// The color of the lines.
  final Color color;
  /// The thickness of the lines.
  final double thickness;
  /// The starting point of the tree indentation.
  final double origin;

  /// The offset from the origin point.
  final double originOffset;

  /// The style of the stroke ends.
  final StrokeCap strokeCap;

  /// The style of the joints between strokes.
  final StrokeJoin strokeJoin;

  /// An optional modifier for the path.
  final PathModifier? pathModifier;

  /// Creates a custom painter for drawing the lines.
  CustomPainter createPainter(BuildContext context, TreeEntry<Object> entry);

  /// Creates a paint object with the specified properties.
  Paint createPaint() => Paint()
    ..color = color
    ..strokeWidth = thickness
    ..strokeCap = strokeCap
    ..strokeJoin = strokeJoin
    ..style = PaintingStyle.stroke;


  /// Calculates the offset for a given level.
  double offsetOfLevel(int level) => (level * indent) - originOffset;

  @override
  Widget wrap(BuildContext context, Widget child, TreeEntry<Object> entry) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: createPainter(context, entry),
        child: super.wrap(context, child, entry),
      ),
    );
  }

  void _drawPath(Canvas canvas, Path path) {
    canvas.drawPath(
      pathModifier?.call(path) ?? path,
      createPaint(),
    );
  }
}

/// {@template scoping_lines_guide}
/// A guide for drawing scoping lines in a tree view widget.
///
/// The `ScopingLinesGuide` class extends the `AbstractLineGuide` and provides
/// a custom painter for rendering scoping lines based on the tree entry level
/// and text direction.
///
/// The constructor accepts various parameters for customizing the appearance
/// and behavior of the scoping lines, including:
/// - `indent`: The indentation level for the lines.
/// - `padding`: The padding around the lines.
/// - `maxLevel`: The maximum level of the tree to draw lines for.
/// - `color`: The color of the lines.
/// - `thickness`: The thickness of the lines.
/// - `origin`: The origin point for the lines.
/// - `strokeCap`: The stroke cap style for the lines.
/// - `strokeJoin`: The stroke join style for the lines.
/// - `pathModifier`: A modifier for the path of the lines.
///
/// The `createPainter` method returns a `_ScopingLinesPainter` instance, which
/// is responsible for the actual drawing of the lines based on the provided
/// guide, node level, and text direction.
/// {@endtemplate}
class ScopingLinesGuide extends AbstractLineGuide {
  /// Creates a `ScopingLinesGuide` with the given parameters.
  const ScopingLinesGuide({
    super.indent,
    super.padding,
    super.maxLevel,
    super.color,
    super.thickness,
    super.origin,
    super.strokeCap,
    super.strokeJoin,
    super.pathModifier,
  });

  @override
  CustomPainter createPainter(BuildContext context, TreeEntry<Object> entry) {
    return _ScopingLinesPainter(
      guide: this,
      nodeLevel: entry.level,
      textDirection: Directionality.maybeOf(context),
    );
  }
}

class _ScopingLinesPainter extends CustomPainter {
  _ScopingLinesPainter({
    required this.guide,
    required this.nodeLevel,
    required this.textDirection,
  });

  final ScopingLinesGuide guide;
  final int nodeLevel;
  final TextDirection? textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    late double Function(int level) calculateOffset;

    if (textDirection == TextDirection.rtl) {
      calculateOffset = (int level) => size.width - guide.offsetOfLevel(level);
    } else {
      calculateOffset = guide.offsetOfLevel;
    }

    final Path path = Path();

    for (int level = 1; level <= guide._constrainLevel(nodeLevel); level++) {
      final double x = calculateOffset(level);
      path.moveTo(x, size.height);
      path.lineTo(x, 0);
    }

    guide._drawPath(canvas, path);
  }

  @override
  bool shouldRepaint(covariant _ScopingLinesPainter oldDelegate) =>
      oldDelegate.guide != guide ||
      oldDelegate.nodeLevel != nodeLevel ||
      oldDelegate.textDirection != textDirection;
}
