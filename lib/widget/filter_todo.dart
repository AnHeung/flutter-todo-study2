import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/filter_todo/filter_todo_bloc.dart';

class FilterTodo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterTodoBloc , FilterTodoState>(
      builder: (context, state)=>Scaffold(
        body: Center(
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}