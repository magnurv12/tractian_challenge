import 'dart:async';
import 'dart:ui';

/// {@template debouncer}
/// The [Debouncer] class is designed to manage the execution of a function
/// by introducing a delay. This is particularly useful in scenarios where
/// frequent function calls need to be controlled, such as in search input
/// fields where you want to wait for the user to stop typing before performing
/// a search operation.
///
/// The class provides a simple interface with a single method, [run], which
/// accepts a callback function to be executed after the specified delay.
/// If [run] is called again before the delay has passed, the previous call
/// is cancelled and the delay restarts.
///
/// Example:
///
/// ```dart
/// final debouncer = Debouncer(milliseconds: 500);
///
/// void onSearchChanged(String query) {
///   debouncer.run(() {
///     // Perform search operation
///   });
/// }
/// ```
///
/// This ensures that the search operation is only performed once the user
/// has stopped typing for the specified delay duration.
/// {@endtemplate}
class Debouncer {
  /// The duration of the delay in milliseconds.
  final int milliseconds;

  /// The callback function to be executed after the delay.
  VoidCallback? action;
  Timer? _timer;

  /// {@macro debouncer}
  Debouncer({required this.milliseconds});

  /// The [run] method accepts a callback function to be executed after the delay.
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
