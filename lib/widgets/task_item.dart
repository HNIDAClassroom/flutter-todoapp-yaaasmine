import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';
import 'package:uid/uid.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {Key? key, required this.onDelete}) : super(key: key);
  final Task task;
  final void Function(Task) onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Move items to the ends
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.assignment), // Corrected the icon
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(task.description),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Category : ${task.category.name}',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
           IconButton(
  icon: Icon(Icons.delete), // Delete icon
  onPressed: () {
    // Call the deleteTask function with the corresponding Task
    onDelete(task);
  },
),

          ],
        ),
      ),
    );
  }
}
