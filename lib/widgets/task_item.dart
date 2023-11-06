import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {Key? key, required this.onDelete}) : super(key: key);
  final Task task;
  final void Function(Task) onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.task,
                          color: Colors.indigo, // Customize icon color
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0, // Increase font size
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              task.description,
                              style: TextStyle(
                                color: Colors.grey, // Use a gray text color
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10), // Increase spacing
                    Text(
                      'Category: ${task.category.name}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.indigo, // Customize category text color
                      ),
                    ),
                    if (task.date != null) // Display the date if it's not null
                      Text(
                        'Date: ${task.date}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.green, // Customize date text color
                        ),
                      ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red), // Customize delete icon color
                  onPressed: () {
                    onDelete(task);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
