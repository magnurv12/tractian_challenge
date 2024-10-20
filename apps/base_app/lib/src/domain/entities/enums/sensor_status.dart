/// Represents the status of a sensor in the system.
///
/// The [SensorStatus] enum has the following values:
/// - [SensorStatus.operating]: Indicates that the sensor is operating normally.
/// - [SensorStatus.alert]: Indicates that the sensor is in an alert state.
enum SensorStatus {
  /// Indicates that the sensor is operating normally.
  operating,

  /// Indicates that the sensor is in an alert state.
  alert,
}