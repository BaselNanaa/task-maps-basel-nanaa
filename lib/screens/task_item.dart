import 'package:flutter/material.dart';
import 'package:mapstest/Structure/TodoItemClass.dart';

class TaskItem extends StatelessWidget {
  final TodoItem item;
  final VoidCallback onToggleComplete;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskItem({
    super.key,
    required this.item,
    required this.onToggleComplete,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            GestureDetector(
              onTap: onToggleComplete,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: item.completed ? Colors.green : Colors.grey,
                    width: 1,
                  ),
                  color: item.completed ? Colors.green : Colors.transparent,
                ),
                width: 24,
                height: 24,
                margin: const EdgeInsets.all(10),
                child: Icon(
                  item.completed ? Icons.check : Icons.circle,
                  color:   item.completed ? Colors.black87 : Colors.white,
                  size: 16,
                ),
              ),
            ),
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  decoration:
                      item.completed ? TextDecoration.lineThrough : null,
                  color: item.completed ? Colors.grey : Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(0, 40),
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: onDelete,
                  child: const Text("Delete",
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(width: 3),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(0, 40),
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: onEdit,
                  child:
                      const Text("Edit", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
