// ignore_for_file: invalid_annotation_target

import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required int id,
    required String title,
    @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt) required DateTime startDateTime,
    @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt) required DateTime endDateTime,
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) => _$EventEntityFromJson(json);
  const EventEntity._();
  int get id2 => id;
  factory EventEntity.fromJsonString(String json) => EventEntity.fromJson(jsonDecode(json));
}

DateTime intToDateTime(int value) => DateTime.fromMicrosecondsSinceEpoch(value);
int dateTimeToInt(DateTime value) => value.microsecondsSinceEpoch;
