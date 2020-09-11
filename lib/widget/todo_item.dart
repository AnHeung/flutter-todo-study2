import 'package:flutter/material.dart';
import 'package:todo_test2/models/todo.dart';

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;

  final GestureTapCallback onTap;

  final ValueChanged<bool> onCheckboxChanged;

  final Todo todo;

  TodoItem({Key key , this.onDismissed, this.onTap, this.onCheckboxChanged, this.todo}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('test'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          value: todo.complete,
          onChanged: onCheckboxChanged,
        ),
        title: Hero(
          tag: '${todo.id}__heroTag',
          child: Container(
            child: Text(todo.task),
          ),
        ),
        subtitle: todo.note.isNotEmpty ? Text(todo.note , maxLines: 1,overflow: TextOverflow.ellipsis,) : null,
      ),
    );
  }
}
