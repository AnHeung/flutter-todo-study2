import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
    if (event is TodoLoaded) {
      yield* _mapToTodoLoaded();
    } else if (event is TodoUpdate) {
      yield* _mapToTodoUpdate(event);
    } else if (event is TodoDelete) {
      yield* _mapTodoDelete(event);
    } else if (event is TodoAdded) {
      yield* _mapTodoAdded(event);
    } else if (event is ToggleAll) {
      yield* _mapToggleAll();
    } else if (event is ClearComplete) {
      yield* _mapClearComplete();
    }
  }

  Stream<TodoState> _mapToTodoLoaded() async* {
    var todos = await repository.getTodos();
//    yield TodoLoadSuccess(loadTodos: todos.map((content) => Todo(content.createdAt ,complete: false , id: content.id, note: content.avatar)).toList());
    yield TodoLoadSuccess(
        loadTodos: todos
            .map((content) => Todo(content.id,
                complete: content.isComplete,
                id: content.id,
                note: content.note))
            .toList());
  }

  Stream<TodoState> _mapToTodoUpdate(TodoUpdate updateEvent) async* {
    if (state is TodoLoadSuccess) {
      final List<Todo> updateList = (state as TodoLoadSuccess)
          .loadTodos
          .map((todo) => todo.id == updateEvent.updateTodo.id
              ? updateEvent.updateTodo
              : todo)
          .toList();
      yield TodoLoadSuccess(loadTodos: updateList);
    }
  }

  Stream<TodoState> _mapTodoDelete(TodoDelete deleteEvent) async* {
    if (state is TodoLoadSuccess)
      yield TodoLoadSuccess(
          loadTodos: (state as TodoLoadSuccess)
              .loadTodos
              .where((todo) => todo.id != deleteEvent.deletedTodo.id)
              .toList());
  }

  Stream<TodoState> _mapToggleAll() async* {
    if (state is TodoLoadSuccess) {

      final List<Todo> loadTodoList = (state as TodoLoadSuccess).loadTodos;
      final bool allComplete = loadTodoList.every((todo)=>todo.complete);
      List<Todo> updateList;

      if(allComplete){
        updateList =  loadTodoList.map((todo) => todo.copyWith(complete: false)).toList();
      }else {
        updateList  = loadTodoList.map((todo) => todo.copyWith(complete: true)).toList();
      }
      yield TodoLoadSuccess(loadTodos: updateList);
    }
  }

  Stream<TodoState> _mapTodoAdded(TodoAdded addedEvent) async* {
    if (state is TodoLoadSuccess)
      yield TodoLoadSuccess(
          loadTodos: List.from((state as TodoLoadSuccess).loadTodos)
            ..add(addedEvent.addedTodo));
  }

  Stream<TodoState> _mapClearComplete() async* {
    if (state is TodoLoadSuccess)
      yield TodoLoadSuccess(
          loadTodos: (state as TodoLoadSuccess)
              .loadTodos
              .where((todo) => !todo.complete)
              .toList());
  }
}
