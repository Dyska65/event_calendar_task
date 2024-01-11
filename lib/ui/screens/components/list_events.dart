import 'package:event_calendar_task/data/entity/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListEvents extends StatelessWidget {
  final List<EventEntity> events;
  final Function(EventEntity) onTapDelete;
  final Function(EventEntity) onTapEdit;

  const ListEvents({
    super.key,
    required this.events,
    required this.onTapDelete,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        EventEntity event = events[index];
        return ListTile(
          leading: Text(
              "${DateFormat('dd/MM/yy hh:mm').format(event.startDateTime)} - ${DateFormat('dd/MM/yy hh:mm').format(event.endDateTime)}"),
          title: Text(event.title),
          titleAlignment: ListTileTitleAlignment.center,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => onTapEdit(event),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => onTapDelete(event),
              ),
            ],
          ),
        );
      },
    );
  }
}
