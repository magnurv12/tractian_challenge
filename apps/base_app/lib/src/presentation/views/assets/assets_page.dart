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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ExpansionTile(
            title: const Text('Production Area - Raw Material'),
            controlAffinity: ListTileControlAffinity.leading,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
            leading: Image.asset(
              'assets/images/location.png',
              width: 24,
              height: 24,
            ),
            initiallyExpanded: true,
            childrenPadding: const EdgeInsets.only(
              left: 24.0,
            ),
            expandedAlignment: Alignment.topCenter,
            children: const [
              ExpansionTile(
                title: Text('Charcoal Storage Sector'),
                initiallyExpanded: true,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(
                  left: 24.0,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                children: [
                  ExpansionTile(
                    title: Text('Conveyor Belt Assembly'),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    children: [
                      ListTile(title: Text('Motor TC01 Coal Unloading AF02')),
                      ListTile(title: Text('Motor RT Coal AF01')),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Machinery House'),
                initiallyExpanded: true,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                childrenPadding: EdgeInsets.only(
                  left: 24.0,
                ),
                children: [
                  ListTile(title: Text('MOTORS H12D - Stage 1')),
                  ListTile(title: Text('MOTORS H12D - Stage 2')),
                  ListTile(title: Text('MOTORS H12D - Stage 3')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class _ExpansionTitle extends StatelessWidget {
  const _ExpansionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}