import 'package:event_calendar_task/data/entity/event.dart';
import 'package:flutter/material.dart';

class ListEvents extends StatelessWidget {
  final List<EventEntity> events;
  final Function(EventEntity) onTapDelete;
  const ListEvents({super.key, required this.events, required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        EventEntity event = events[index];
        return ListTile(
          leading: Text("${event.dateTime.hour}:${event.dateTime.minute}"),
          title: Text(event.title),
          titleAlignment: ListTileTitleAlignment.center,
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => onTapDelete(event),
          ),
        );
      },
    );
  }
}