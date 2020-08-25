import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_test2/models/todo.dart';
import 'package:todo_test2/repository/repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final ApiRepository repository;

  TodoBloc({this.repository}) : super(TodoLoadingInProgress());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if(event is TodoLoaded){
      yield* test();
    }
  }


  Stream<TodoState> test() async*{
    var todos = await repository.getTodos();
    yield TodoLoadSuccess(loadTodos: todos.map((content) => Todo(content.task ,complete: content.isComplete , id: content.id, note: content.note)));
  }
}
