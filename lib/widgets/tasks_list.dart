import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/sevices/firestore.dart';
import 'package:todolist_app/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();
  final void Function(Task) onDelete;

  TasksList({Key? key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot?>(
      stream: firestoreService.getTasks(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return CircularProgressIndicator(); // Loading indicator
        }

        final taskLists = snapshot.data!.docs;

        return ListView.builder(
          itemCount: taskLists.length,
          itemBuilder: (ctx, index) {
            DocumentSnapshot document = taskLists[index];
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            String title = data['taskTitle'];
            String description = data['taskDesc'];
            String categoryString = data['taskCategory'];
            Timestamp dateTimestamp = data['taskDate'];

          

Category category;
if (categoryString != null) {
  category = Category.values
      .firstWhere((cat) => cat.toString() == 'Category.$categoryString', orElse: () => Category.others);
} else {
  category = Category.others;
}

            // Convert the Firestore Timestamp back to DateTime
            DateTime? date = dateTimestamp != null
                ? (dateTimestamp as Timestamp).toDate()
                : null;

            Task task = Task(
              title: title,
              description: description,
              category: category,
              date: date, // Use the retrieved date from Firestore
            );

            return TaskItem(task, onDelete: onDelete);
          },
        );
      },
    );
  }
}
