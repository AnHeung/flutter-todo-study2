import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/models/todo.dart';

part 'stats_event.dart';

part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final TodoBloc todoBloc;
  StreamSubscription subscription;

  StatsBloc({this.todoBloc}) : super(StatsLoadingInProgress()) {
    subscription = todoBloc.listen((state) => _loadStatsData());
  }

  _loadStatsData(){
    var todoState = todoBloc.state;
    if(todoState is TodoLoadSuccess){
      add(StatsUpdate(updateList: todoState.loadTodos));
    }
  }


  @override
  Stream<StatsState> mapEventToState(
    StatsEvent event,
  ) async* {
    if(event is StatsInitialize){
      _loadStatsData();
    }else if(event is StatsUpdate){
      yield* _mapToUpdate(event);
    }
  }

  Stream<StatsState> _mapToUpdate(StatsUpdate event) async* {
    int numActive = event.updateList.where((todo) => !todo.complete).toList().length;
    int numComplete = event.updateList.where((todo) => todo.complete).toList().length;
    yield StatsLoadSuccess(numActive:  numActive , numComplete:  numComplete);
  }
}
