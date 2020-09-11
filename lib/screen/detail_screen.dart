import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/models/todo.dart';
import 'package:todo_test2/screen/add_edit_screen.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  DetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        final Todo todo = (state as TodoLoadSuccess)
            .loadTodos
            .firstWhere((todo) => todo.id == id, orElse: () => null);

        return Scaffold(
          appBar: AppBar(
            title: Text('Detail'),
            actions: [
              IconButton(
                tooltip: '삭제하기',
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<TodoBloc>(context)
                      .add(TodoDelete(deletedTodo: todo));
                  Navigator.pop(context, todo);
                },
              )
            ],
          ),
          body: todo == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Checkbox(
                              value: todo.complete,
                              onChanged: (_) =>
                                  BlocProvider.of<TodoBloc>(context).add(
                                      TodoUpdate(
                                          updateTodo: todo.copyWith(
                                              complete: !todo.complete))),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                    tag: '${todo.id}__Hero_Tag',
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.only(
                                          top: 8.0, bottom: 16.0),
                                      child: Text(
                                        '${todo.task}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    )),
                                Text(
                                  todo.note,
                                  style: Theme.of(context).textTheme.subtitle1,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddEditScreen(
                        isEditing: true,
                        onSaveCallback: (note, task) {
                          BlocProvider.of<TodoBloc>(context).add(TodoUpdate(updateTodo: Todo(task , note: note, id: id)));
                          Navigator.pop(context);
                        },
                        todo: todo,
                      )))
            },
          ),
        );
      },
    );
  }
}
