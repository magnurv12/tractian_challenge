import 'package:dependencies/dependencies.dart';

import '../../../domain/domain.dart';

/// Sensor status model
enum SensorStatusModel {
  /// Sensor is operating normally
  @JsonValue('operating')
  operating,

  /// Sensor is in alert state
  @JsonValue('alert')
  alert;

  /// Convert this model to entity
  SensorStatus toEntity() {
    return switch (this) {
      SensorStatusModel.operating => SensorStatus.operating,
      SensorStatusModel.alert => SensorStatus.alert,
    };
  }
}
