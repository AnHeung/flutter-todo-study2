import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/filter_todo/filter_todo_bloc.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/screen/detail_screen.dart';
import 'package:todo_test2/widget/delete_snack_bar.dart';
import 'package:todo_test2/widget/loading_indicator.dart';
import 'package:todo_test2/widget/todo_item.dart';

class FilterTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterTodoBloc, FilterTodoState>(
        builder: (context, state) {
      if (state is FilterTodoLoadingInProgress) {
        return LoadingIndicator();
      } else if (state is FilterTodoLoadSuccess) {
        final todos = state.loadTodos;

        if(todos.length == 0) return _makeEmptyContainer();

        return ListView.builder(
          itemBuilder: (context, index) {
            final todo = todos[index];

            return TodoItem(
              todo: todo,
              onDismissed: (_) {
                BlocProvider.of<TodoBloc>(context)
                    .add(TodoDelete(deletedTodo: todo));
                Scaffold.of(context).showSnackBar(DeleteSnackBar(
                  todo: todo,
                  onUndo: () => BlocProvider.of<TodoBloc>(context)
                      .add(TodoAdded(addedTodo: todo)),
                ));
              },
              onTap: () async {
                final removeTodo =
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailScreen(
                              id: todo.id,
                            )));

                if (removeTodo != null) {
                  Scaffold.of(context).showSnackBar(DeleteSnackBar(
                    todo: todo,
                    onUndo: () => BlocProvider.of<TodoBloc>(context)
                        .add(TodoAdded(addedTodo: todo)),
                  ));
                }
              },
              onCheckboxChanged: (_) => BlocProvider.of<TodoBloc>(context).add(
                  TodoUpdate(
                      updateTodo: todo.copyWith(complete: !todo.complete))),
            );
          },
          itemCount: todos.length,
        );
      }
      return _makeEmptyContainer();
    });
  }

  _makeEmptyContainer(){
    return Container(
      child: Center(
        child: Text(
          '비어있다.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
