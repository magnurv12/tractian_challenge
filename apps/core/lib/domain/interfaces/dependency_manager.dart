///
/// Utility class to manage dependencies
///
abstract class DependencyManager {
  ///
  /// Get an instance of type T from the DM
  ///
  T get<T extends Object>();

  /// Try to get an object of type T from the dependency manager. If not found,
  /// returns null.
  T? getOrNull<T extends Object>();

  /// Disposes an object of type T from the DM
  bool dispose<T extends Object>();
}
