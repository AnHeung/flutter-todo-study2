part of 'filter_todo_bloc.dart';

@immutable
abstract class FilterTodoState extends Equatable{

  @override
  List<Object> get props => [];

  const FilterTodoState();
}

class FilterTodoLoadingInProgress extends FilterTodoState {}

class FilterTodoLoadSuccess extends FilterTodoState {

  final List<Todo> loadTodos;

  final VisibleFilter filter;

  const FilterTodoLoadSuccess({this.loadTodos, this.filter});

  @override
  List<Object> get props => [loadTodos,filter];

  @override
  String toString() =>"FilterTodoLoadSuccess todos : $loadTodos current Filter : $filter";
}

class FilterTodoLoadFailure extends FilterTodoState{}
