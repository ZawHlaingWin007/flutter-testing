import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String task;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const ToDoTile({
    super.key,
    required this.task,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.yellow.shade500,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black54,
                ),
                Text(
                  task,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black87,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
