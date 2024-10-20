import 'package:dependencies/dependencies.dart';

import '../../../domain/domain.dart';

/// Sensor type model
enum SensorTypeModel {
  /// Sensor type is temperature
  @JsonValue('vibration')
  vibration,

  /// Sensor type is humidity
  @JsonValue('energy')
  energy;

  /// Convert this model to entity
  SensorType toEntity() {
    return switch (this) {
      SensorTypeModel.vibration => SensorType.vibration,
      SensorTypeModel.energy => SensorType.energy,
    };
  }
}
