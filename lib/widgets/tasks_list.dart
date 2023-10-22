import 'package:flutter/material.dart';

import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/widgets/task_item.dart';
import 'package:todolist_app/widgets/tasks.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({
    super.key,
    required this.tasks,
  });

 

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: tasks.length,
itemBuilder: (ctx,index) => TaskItem(tasks[index]),
  

    );
  }
}
