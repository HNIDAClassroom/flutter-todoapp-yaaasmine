import 'package:flutter/material.dart';

import 'package:todolist_app/models/task.dart';


class TaskItem extends StatelessWidget{

const TaskItem(this.task, {super.key});

final Task task;

@override

Widget build(BuildContext context) {

return  Card(
  margin:EdgeInsets.all(16.0),
  child:Padding(
    padding: EdgeInsets.all(8.0),
    child : Column(children: [
      Row(children: [
       const Icon(Icons.task),
        const SizedBox(width: 10),
        Flexible(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            //Text('Date: ${task.date}', textAlign: TextAlign.left),
             const SizedBox(height: 5),
            Text(task.description),

          ],
        ))],)
    ],))
);

}

}