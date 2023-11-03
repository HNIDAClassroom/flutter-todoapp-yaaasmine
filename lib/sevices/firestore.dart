import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist_app/models/task.dart';

class FirestoreService {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');


Future<void> addTask(Task task) {
  return FirebaseFirestore.instance.collection('tasks').add(
    {
      'taskTitle': task.title.toString(),
      'taskDesc': task.description.toString(),
      'taskCategory': task.category.toString(),
    },
  );

}
Stream<QuerySnapshot> getTasks() {
  final taskStream = tasks.snapshots();
  return taskStream;
}
}