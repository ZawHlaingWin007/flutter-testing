import 'package:flutter/material.dart';
import 'package:new_flutter_app/util/main_button.dart';

class TaskDialog extends StatelessWidget {
  final dynamic controller;
  final VoidCallback onSave;
  final VoidCallback onCancle;

  const TaskDialog({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 150,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'New Task',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MainButton(text: 'Save', onPressed: onSave),
                  const SizedBox(
                    width: 10,
                  ),
                  MainButton(text: 'Cancle', onPressed: onCancle),
                ],
              ),
            ]),
      ),
    );
  }
}
