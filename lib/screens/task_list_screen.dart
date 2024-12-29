import 'package:flutter/material.dart';
import 'package:mapstest/Structure/TodoItemClass.dart';
import 'package:mapstest/screens/EditTaskScreen.dart';
import 'package:mapstest/screens/task_item.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  String userName = 'Basel Nanaa';
  String email = 'basel.nanaa71@gmail.com';

  List<TodoItem> items = [
    TodoItem(title: "Go to market", completed: true, description: ''),
    TodoItem(title: "Going to Syria", completed: false, description: ''),
    TodoItem(title: "Do my code", completed: false, description: ''),
  ];

  void toggleComplete(int index) {
    setState(() {
      items[index].completed = !items[index].completed;
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void editItem(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditTaskScreen(
          item: items[index],
          onSave: (updatedItem) {
            setState(() {
              items[index] = updatedItem;
            });
          },
        ),
      ),
    );
  }

  void addItem(TodoItem newItem) {
    setState(() {
      items.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Salam, $userName', style: const TextStyle(color: Colors.white)),
                  Opacity(opacity: 0.5, child: Text(email, style: const TextStyle(color: Colors.white))),
                ],
              ),
            ),
            Image.asset(
              'assets/images/profile.png',
              width: 35,
              height: 35,
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          if(items.isEmpty) return Center(child: Text('No tasks added'));
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => TaskItem(
              item: items[index],
              onToggleComplete: () => toggleComplete(index),
              onDelete: () => deleteItem(index),
              onEdit: () => editItem(index),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditTaskScreen(
                onSave: (newItem) => addItem(newItem),
              ),
            ),
          );
        },
        tooltip: 'Add New Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
