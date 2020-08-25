part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class TodoLoaded extends TodoEvent{}

class TodoAdded extends TodoEvent{

  final Todo addedTodo;

  TodoAdded({this.addedTodo});

  @override
  List<Object> get props =>[addedTodo];
}

class TodoUpdate extends TodoEvent{
  final List<Todo> updateTodos;

  TodoUpdate({this.updateTodos});

  @override
  List<Object> get props =>[updateTodos];
}

class TodoDelete extends TodoEvent{

  final List<Todo> deletedTodos;

  TodoDelete({this.deletedTodos});

  @override
  List<Object> get props =>[deletedTodos];
}

class ClearComplete extends TodoEvent{}

class ToggleAllComplete extends TodoEvent{}
