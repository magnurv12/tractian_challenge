import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

/// {@template search_header}
/// A widget that provides a header for searching assets with various filters.
///
/// The [SearchHeader] widget allows users to search for assets by name, sensor type,
/// and sensor status. It takes three callback functions as parameters to handle the
/// search criteria changes.
///
/// - [onSearchName]: A callback function that is triggered when the search name changes.
/// - [onSearchSensorType]: A callback function that is triggered when the search sensor type changes.
/// - [onSearchStatus]: A callback function that is triggered when the search status changes.
/// {@endtemplate}
class SearchHeader extends StatefulWidget {
  /// A callback function that is triggered when the search name changes.
  final ValueChanged<String?> onSearchName;

  /// A callback function that is triggered when the search sensor type changes.
  final ValueChanged<SensorType?> onSearchSensorType;

  /// A callback function that is triggered when the search status changes.
  final ValueChanged<SensorStatus?> onSearchStatus;

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
  List<bool> isSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchField(),
          const SizedBox(height: 16.0),
          _buildFilterButtons(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Buscar Ativo ou Local',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
      onChanged: (value) {
        _debouncer.run(() {
          widget.onSearchName(value.isEmpty ? null : value);
        });
      },
    );
  }

  Widget _buildFilterButtons() {
    return Wrap(
      spacing: 8.0, // Espaço entre os botões
      children: [
        ToggleButtons(
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.grey.shade300,
          selectedBorderColor: Colors.blue,
          fillColor: Colors.blue,
          selectedColor: Colors.white,
          color: Colors.grey[700],
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              isSelected[index] = !isSelected[index];
              if (index == 0) {
                widget.onSearchSensorType(
                  isSelected[index] ? SensorType.energy : null,
                );
              } else if (index == 1) {
                widget.onSearchStatus(
                  isSelected[index] ? SensorStatus.alert : null,
                );
              }
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.bolt,
                    color: isSelected[0] ? Colors.white : Colors.grey[700],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Sensor de Energia',
                    style: TextStyle(
                      color: isSelected[0] ? Colors.white : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: isSelected[1] ? Colors.white : Colors.grey[700],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Crítico',
                    style: TextStyle(
                      color: isSelected[1] ? Colors.white : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
