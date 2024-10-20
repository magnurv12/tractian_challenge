// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_node_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreeNodeModelImpl _$$TreeNodeModelImplFromJson(Map<String, dynamic> json) =>
    _$TreeNodeModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      parentId: json['parentId'] as String?,
      locationId: json['locationId'] as String?,
      sensorId: json['sensorId'] as String?,
      sensorType:
          $enumDecodeNullable(_$SensorTypeModelEnumMap, json['sensorType']),
      status: $enumDecodeNullable(_$SensorStatusModelEnumMap, json['status']),
    );

Map<String, dynamic> _$$TreeNodeModelImplToJson(_$TreeNodeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'locationId': instance.locationId,
      'sensorId': instance.sensorId,
      'sensorType': _$SensorTypeModelEnumMap[instance.sensorType],
      'status': _$SensorStatusModelEnumMap[instance.status],
    };

const _$SensorTypeModelEnumMap = {
  SensorTypeModel.vibration: 'vibration',
  SensorTypeModel.energy: 'energy',
};

const _$SensorStatusModelEnumMap = {
  SensorStatusModel.operating: 'operating',
  SensorStatusModel.alert: 'alert',
};
