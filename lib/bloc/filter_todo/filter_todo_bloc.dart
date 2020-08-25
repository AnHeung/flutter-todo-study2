import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';

part 'filter_todo_event.dart';
part 'filter_todo_state.dart';

class FilterTodoBloc extends Bloc<FilterTodoEvent, FilterTodoState> {

  final TodoBloc todoBloc;
  StreamSubscription subscription;


  FilterTodoBloc({this.todoBloc}) : super(FilterTodoInitial()){

      subscription = todoBloc.listen((state){
        if(state is TodoLoadSuccess){
          print("test");
        }
      });
  }

  @override
  Stream<FilterTodoState> mapEventToState(
    FilterTodoEvent event,
  ) async* {
  }
}
