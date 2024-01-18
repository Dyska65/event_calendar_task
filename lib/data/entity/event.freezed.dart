// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) {
  return _EventEntity.fromJson(json);
}

/// @nodoc
mixin _$EventEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  DateTime get startDateTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  DateTime get endDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventEntityCopyWith<EventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityCopyWith<$Res> {
  factory $EventEntityCopyWith(
          EventEntity value, $Res Function(EventEntity) then) =
      _$EventEntityCopyWithImpl<$Res, EventEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      DateTime startDateTime,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      DateTime endDateTime});
}

/// @nodoc
class _$EventEntityCopyWithImpl<$Res, $Val extends EventEntity>
    implements $EventEntityCopyWith<$Res> {
  _$EventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDateTime = null,
    Object? endDateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventEntityImplCopyWith<$Res>
    implements $EventEntityCopyWith<$Res> {
  factory _$$EventEntityImplCopyWith(
          _$EventEntityImpl value, $Res Function(_$EventEntityImpl) then) =
      __$$EventEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      DateTime startDateTime,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      DateTime endDateTime});
}

/// @nodoc
class __$$EventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$EventEntityImpl>
    implements _$$EventEntityImplCopyWith<$Res> {
  __$$EventEntityImplCopyWithImpl(
      _$EventEntityImpl _value, $Res Function(_$EventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? startDateTime = null,
    Object? endDateTime = null,
  }) {
    return _then(_$EventEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventEntityImpl extends _EventEntity {
  const _$EventEntityImpl(
      {required this.id,
      required this.title,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      required this.startDateTime,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      required this.endDateTime})
      : super._();

  factory _$EventEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime startDateTime;
  @override
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  final DateTime endDateTime;

  @override
  String toString() {
    return 'EventEntity(id: $id, title: $title, startDateTime: $startDateTime, endDateTime: $endDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.endDateTime, endDateTime) ||
                other.endDateTime == endDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, startDateTime, endDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventEntityImplCopyWith<_$EventEntityImpl> get copyWith =>
      __$$EventEntityImplCopyWithImpl<_$EventEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityImplToJson(
      this,
    );
  }
}

abstract class _EventEntity extends EventEntity {
  const factory _EventEntity(
      {required final int id,
      required final String title,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      required final DateTime startDateTime,
      @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
      required final DateTime endDateTime}) = _$EventEntityImpl;
  const _EventEntity._() : super._();

  factory _EventEntity.fromJson(Map<String, dynamic> json) =
      _$EventEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  DateTime get startDateTime;
  @override
  @JsonKey(fromJson: intToDateTime, toJson: dateTimeToInt)
  DateTime get endDateTime;
  @override
  @JsonKey(ignore: true)
  _$$EventEntityImplCopyWith<_$EventEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
