import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

class ExpansionTileCustom extends StatefulWidget {
  final TreeNode node;

  const ExpansionTileCustom({
    super.key,
    required this.node,
  });

  @override
  State<ExpansionTileCustom> createState() => _ExpansionTileCustomState();
}

class _ExpansionTileCustomState extends State<ExpansionTileCustom> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
