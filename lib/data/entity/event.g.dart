// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventEntityImpl _$$EventEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventEntityImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      startDateTime: intToDateTime(json['startDateTime'] as int),
      endDateTime: intToDateTime(json['endDateTime'] as int),
    );

Map<String, dynamic> _$$EventEntityImplToJson(_$EventEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startDateTime': dateTimeToInt(instance.startDateTime),
      'endDateTime': dateTimeToInt(instance.endDateTime),
    };
