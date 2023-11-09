import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatefulWidget {
  const TaskItem(this.task, {Key? key, required this.onDelete})
      : super(key: key);
  final Task task;
  final void Function(Task) onDelete;

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    final formattedDate = widget.task.date != null
        ? DateFormat.yMMMd().format(widget.task.date!)
        : 'No date';
    print('Date: ${widget.task.date}');
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  completed = !completed; // Toggle the task completion status
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              completed
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: completed
                                  ? Colors.green
                                  : Colors.grey, // Change icon color
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.task.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: completed
                                          ? TextDecoration.lineThrough
                                          : null, // Add strikethrough
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    widget.task.description,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      decoration: completed
                                          ? TextDecoration.lineThrough
                                          : null, // Add strikethrough
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Category: ${widget.task.category.name}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.indigo, // Customize category text color
                          ),
                        ),
                        if (widget.task.date != null)
                          Text(
                            'Date: $formattedDate',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.green, // Customize date text color
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      widget.onDelete(widget.task);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
