import 'dart:convert';

class EventEntity {
  final int id;
  final String title;
  final DateTime dateTime;

  EventEntity({
    required this.id,
    required this.title,
    required this.dateTime,
  });

  factory EventEntity.fromMap(Map<String, dynamic> json) {
    return EventEntity(
      id: json["id"],
      title: json["title"],
      dateTime: DateTime.fromMicrosecondsSinceEpoch(json["dateTime"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "dateTime": dateTime.microsecondsSinceEpoch,
      };

  EventEntity copyWith({
    int? id,
    String? title,
    DateTime? dateTime,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventEntity.fromJson(String source) =>
      EventEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Event(id: $id, title: $title, dateTime: $dateTime)';
}
