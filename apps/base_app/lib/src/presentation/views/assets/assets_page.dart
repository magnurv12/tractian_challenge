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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionTile(
              title: Text('Production Area - Raw Material'),
              children: <Widget>[
                ExpansionTile(
                  title: Text('Charcoal Storage Sector'),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text('Conveyor Belt Assembly'),
                      children: <Widget>[
                        ListTile(title: Text('Motor TC01 Coal Unloading AF02')),
                        ListTile(title: Text('Motor RT Coal AF01')),
                      ],
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text('Machinery House'),
                  children: <Widget>[
                    ListTile(title: Text('MOTORS H12D - Stage 1')),
                    ListTile(title: Text('MOTORS H12D - Stage 2')),
                    ListTile(title: Text('MOTORS H12D - Stage 3')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
