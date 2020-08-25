import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/models/todo.dart';

class AddEditScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) => Scaffold(
        body: Center(
          child: Text('text'),
        ),
      ),
    );
  }
}
