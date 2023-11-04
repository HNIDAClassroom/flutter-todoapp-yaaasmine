import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist_app/sevices/firestore.dart';
import 'package:todolist_app/widgets/task_item.dart';
import 'package:todolist_app/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final FirestoreService firestoreService = FirestoreService();

 TasksList({Key? key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot?>(
      stream: firestoreService.getTasks(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return CircularProgressIndicator(); // Loading indicator
        }
        
        final taskLists = snapshot.data!.docs;
        List<Task> taskItems = [];

        for (int index = 0; index < taskLists.length; index++) {
          DocumentSnapshot document = taskLists[index];
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          String title = data['taskTitle'];
          String description = data['taskDesc'];
         // DateTime date = DateTime.parse(data['taskDate']);
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
           // date: date,
            category: category,
          );

          taskItems.add(task);
        }

        return ListView.builder(
          itemCount: taskItems.length,
          itemBuilder: (ctx, index) {
            return TaskItem(taskItems[index]);
          },
        );
      },
    );
  }
}
