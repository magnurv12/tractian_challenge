import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

///{@template search_header}
/// A [StatefulWidget] that represents a search header with a callback for search query changes.
///
/// This widget provides a header section that includes a search functionality. When the search query changes,
/// the provided [SearchQueryCallback] is called.
///
/// {@macro search_query_callback}
///
/// Example usage:
/// ```dart
/// SearchHeader(
///   onSearchQueryChanged: (query) {
///     // Handle search query change
///   },
/// )
/// ```
///
/// See also:
/// - [SearchQueryCallback], for the type definition of the callback.
/// {@endtemplate}
class SearchHeader extends StatefulWidget {
  /// The callback function that handles search query changes.
  final ValueChanged<String?> onSearchName;

  /// The callback function that handles search query changes.
  final ValueChanged<SensorType?> onSearchSensorType;

  /// The callback function that handles search query changes.
  final ValueChanged<SensorStatus?> onSearchStatus;

  /// Creates a [SearchHeader].
  /// {@macro search_header}
  const SearchHeader({
    required this.onSearchName,
    required this.onSearchSensorType,
    required this.onSearchStatus,
    super.key,
  });

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final _debouncer = Debouncer(milliseconds: 500);

  bool energySelected = false;
  bool alertSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Buscar Ativo ou Local',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              _debouncer.run(() {
                if (value.isEmpty) {
                  widget.onSearchName(null);
                  return;
                }
                widget.onSearchName(value);
              });
            },
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    energySelected = !energySelected;
                  });
                  if (!energySelected) {
                    widget.onSearchSensorType(null);
                    return;
                  }

                  widget.onSearchSensorType(SensorType.energy);
                },
                icon: Icon(
                  Icons.bolt,
                  color: energySelected ? Colors.white : Colors.grey[700],
                ),
                label: Text(
                  'Sensor de Energia',
                  style: TextStyle(
                    color: energySelected ? Colors.white : Colors.grey[700],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: energySelected ? Colors.blue : Colors.white,
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    alertSelected = !alertSelected;
                  });
                  if (!alertSelected) {
                    widget.onSearchStatus(null);
                    return;
                  }
                  widget.onSearchStatus(SensorStatus.alert);
                },
                icon: Icon(
                  Icons.error_outline,
                  color: alertSelected ? Colors.white : Colors.grey[700],
                ),
                label: Text(
                  'Crítico',
                  style: TextStyle(
                    color: alertSelected ? Colors.white : Colors.grey[700],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  side: BorderSide(color: Colors.grey.shade300),
                  backgroundColor: alertSelected ? Colors.blue : Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
