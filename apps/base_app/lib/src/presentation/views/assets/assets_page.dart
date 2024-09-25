import 'package:flutter/material.dart';

/// A page that displays the details of an asset.
///
/// The [AssetsPage] requires an [id] to identify which asset to display.
class AssetsPage extends StatefulWidget {
  ///
  /// Parameters:
  /// - `id`: The unique identifier of the asset to be displayed.
  final String id;

  /// Constructor [AssetsPage]
  const AssetsPage({
    super.key,
    required this.id,
  });

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Assets Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Asets ${widget.id}',
            ),
            Text(
              'Teste',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
