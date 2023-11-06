import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';
import 'package:todolist_app/sevices/firestore.dart';
import 'package:todolist_app/widgets/new_task.dart';
import 'package:todolist_app/widgets/tasks_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _TasksState();
  }
}

 
class _TasksState extends State<Tasks> {
   final FirestoreService firestoreService= FirestoreService();
 
void deleteTask(Task task) async {
  try {
    print('Deleting task: ${task.title}');

    // Call the deleteTask method to remove the task from Firestore
    await firestoreService.deleteTask(task);

    print('Task deleted from Firestore');

    // Call setState to rebuild the widget and reflect the changes
    setState(() {});
  } catch (e) {
    // Handle any errors here, e.g., show an error message
    print("Error deleting task: $e");
  }
}



   void _addTask(Task task) async {
  setState(() {
  
    firestoreService.addTask(task);
    Navigator.pop(context);
  });
}

void _openAddTaskOverlay() {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => NewTask(onAddTask: _addTask),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Center(child : Text('ToDoList App'),),
        actions: [
          IconButton(
          onPressed: _openAddTaskOverlay,
          icon: Ink(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
               color: Color.fromARGB(255, 200, 137, 255),
              ),
            child : const Padding (padding : EdgeInsets.all(5),
            child: Icon(Icons.add,color: Colors.white10,),
            ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
         Expanded(child: TasksList(onDelete: deleteTask)),
          ]
        ),
      ),
    );
  }
}