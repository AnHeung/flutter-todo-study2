import 'package:flutter/material.dart';
import 'package:todo_test2/models/todo.dart';

class DeleteSnackBar extends SnackBar {
  DeleteSnackBar({@required Todo todo, @required VoidCallback onUndo})
      : super(
            content: Text(
              todo.task,
              maxLines: 1,
            ),
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              label: 'undo',
              onPressed: onUndo,
            ));
}
