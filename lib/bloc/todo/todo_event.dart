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
  final Todo updateTodo;

  TodoUpdate({this.updateTodo});

  @override
  List<Object> get props =>[updateTodo];
}

class TodoDelete extends TodoEvent{

  final Todo deletedTodo;

  TodoDelete({this.deletedTodo});

  @override
  List<Object> get props =>[deletedTodo];
}

class ClearComplete extends TodoEvent{}

class ToggleAll extends TodoEvent{}
