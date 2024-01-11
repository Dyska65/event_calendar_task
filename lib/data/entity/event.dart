import 'dart:convert';

class EventEntity {
  final int id;
  final String title;
  final DateTime startDateTime;
  final DateTime endDateTime;

  EventEntity({
    required this.id,
    required this.title,
    required this.startDateTime,
    required this.endDateTime,
  });

  factory EventEntity.fromMap(Map<String, dynamic> json) {
    return EventEntity(
      id: json["id"],
      title: json["title"],
      startDateTime: DateTime.fromMicrosecondsSinceEpoch(json["startDateTime"]),
      endDateTime: DateTime.fromMicrosecondsSinceEpoch(json["endDateTime"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "startDateTime": startDateTime.microsecondsSinceEpoch,
        "endDateTime": endDateTime.microsecondsSinceEpoch,
      };

  EventEntity copyWith({
    int? id,
    String? title,
    DateTime? startDateTime,
    DateTime? endDateTime,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventEntity.fromJson(String source) =>
      EventEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Event(id: $id, title: $title, startDateTime: $startDateTime, endDateTime: $endDateTime)';
}
