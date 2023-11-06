import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist_app/sevices/firestore.dart';
import 'package:todolist_app/widgets/task_item.dart';
import 'package:todolist_app/models/task.dart';

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

            Category category;
            switch (categoryString) {
              case 'personal':
                category = Category.personal;
                break;
              case 'work':
                category = Category.work;
                break;
              case 'shopping':
                category = Category.shopping;
                break;
              default:
                category = Category.others;
            }

            Task task = Task(
              title: title,
              description: description,
              category: category,
            );

            return TaskItem(task, onDelete: onDelete);
          },
        );
      },
    );
  }
}
