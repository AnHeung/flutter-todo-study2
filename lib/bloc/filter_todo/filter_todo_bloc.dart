import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/models/todo.dart';
import 'package:todo_test2/models/visible_filter.dart';

part 'filter_todo_event.dart';
part 'filter_todo_state.dart';

class FilterTodoBloc extends Bloc<FilterTodoEvent, FilterTodoState> {

  final TodoBloc todoBloc;
  StreamSubscription subscription;


  FilterTodoBloc({this.todoBloc}) : super(todoBloc.state is TodoLoadSuccess
      ? FilterTodoLoadSuccess(
      loadTodos: (todoBloc.state as TodoLoadSuccess).loadTodos,
      filter: VisibleFilter.ALL)
      : FilterTodoLoadingInProgress()) {
    subscription = todoBloc.listen((state) {
      if (state is TodoLoadSuccess) {
        add(FilterTodoUpdate(updateTodos: state.loadTodos));
      }
    });
  }

  @override
  Stream<FilterTodoState> mapEventToState(FilterTodoEvent event,) async* {
    if (event is FilterUpdate) {
      yield* _mapEventToChangeFilter(event);
    } else if (event is FilterTodoUpdate) {
      yield* _mapEventToUpdate(event);
    }
  }

   _mapEventToChangeFilter(FilterUpdate event) {
    if (todoBloc.state is TodoLoadSuccess) {
      final updateTodos = (todoBloc.state as TodoLoadSuccess).loadTodos;

      switch (event.filter) {
        case VisibleFilter.ALL :
          break;
        case VisibleFilter.ACTIVE :
          updateTodos.where((todo) => !todo.complete).toList();
          break;
        case VisibleFilter.COMPLETE :
          updateTodos.where((todo) => todo.complete).toList();
          break;
      }
      add(FilterTodoUpdate(updateTodos: updateTodos));
    }
  }

  Stream<FilterTodoState> _mapEventToUpdate(FilterTodoUpdate event) async* {
      yield FilterTodoLoadSuccess(loadTodos: event.updateTodos , filter: VisibleFilter.ALL);
  }

  @override
  Future<Function> close() {
    subscription.cancel();
    return super.close();
  }
}
