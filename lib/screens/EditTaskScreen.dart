import 'package:flutter/material.dart';
import 'package:mapstest/Structure/TodoItemClass.dart';

class AddEditTaskScreen extends StatefulWidget {
  final TodoItem? item;
  final void Function(TodoItem newItem) onSave;

  const AddEditTaskScreen({this.item, required this.onSave, super.key});

  @override
  AddEditTaskScreenState createState() => AddEditTaskScreenState();
}

class AddEditTaskScreenState extends State<AddEditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    _isEditMode = widget.item != null;
    _titleController = TextEditingController(text: widget.item?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.item?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void saveTask() {
    final newItem = TodoItem(
      title: _titleController.text,
      description: _descriptionController.text,
      completed: widget.item?.completed ?? false,
    );
    widget.onSave(newItem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
            _isEditMode ? 'Edit Task: ${widget.item!.title}' : 'Add New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Task Name'),
              const SizedBox(height: 3),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter task name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Task Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: saveTask,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(_isEditMode ? 'Save Changes' : 'Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
