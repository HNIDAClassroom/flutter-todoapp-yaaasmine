import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});
  final void Function(Task task) onAddTask;
  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  Category _selectedCategory = Category.personal;

  final _titleController = TextEditingController();
  var _enteredTitle = '';

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddTask(Task(
        title: _titleController.text,
        date: DateTime(2023, 10, 16, 14, 30),
        category: _selectedCategory,
        description: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Task title'),
            ),
          ),
          Row(
            children: [
              DropdownButton<Category>(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem<Category>(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _submitTaskData, // Call the _submitTaskData function
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
