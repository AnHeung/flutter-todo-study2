part of 'filter_todo_bloc.dart';

@immutable
abstract class FilterTodoEvent extends Equatable{

  @override
  List<Object> get props => [];

  const FilterTodoEvent();
}

class FilterTodoUpdate extends FilterTodoEvent{

  final List<Todo> updateTodos;

  FilterTodoUpdate({this.updateTodos});

  @override
  List<Object> get props => [updateTodos];

  @override
  String toString() =>'FilterUpdate : $updateTodos';
}

class FilterUpdate extends FilterTodoEvent{

  final VisibleFilter filter;

  const FilterUpdate({this.filter});

  @override
  List<Object> get props =>[filter];

  @override
  String toString() => 'FilterUpdated { filter: $filter }';

}

