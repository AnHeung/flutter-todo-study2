part of 'todo_bloc.dart';

@immutable
abstract class TodoState extends Equatable{

  const TodoState();

  @override
  List<Object> get props =>[];

}

class TodoLoadingInProgress extends TodoState {}

class TodoLoadSuccess extends TodoState{
  
  final List<Todo> loadTodos;

  const TodoLoadSuccess({this.loadTodos = const []});

  @override
  String toString() => 'TodoLoadSuccess : $loadTodos';

  @override
  List<Object> get props => [loadTodos];
}

class TodoLoadFailure extends TodoState{}


