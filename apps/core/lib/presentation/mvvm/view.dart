import '../utils.dart';
import 'mvvm.dart';

/// A mixin to inject a [ViewModel] into a page/widget
///
/// See also:
///
///  * [ViewState], which disposes the [ViewModel] when the widget is disposed.
mixin ViewMixin<VM extends ViewModel> {
  /// Get the injected [ViewModel]
  final VM viewModel = DM.get<VM>();
}
