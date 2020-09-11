import 'package:equatable/equatable.dart';
import 'package:todos_repository_core/todos_repository_core.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(this.task, {
    this.complete = false,
    String id,
    String note,
  }):this.note = note ?? '', this.id = id ?? Uuid().v4();

  Todo copyWith({bool complete ,String id, String note , String task})=> Todo(
    task ?? this.task,
    complete: complete ?? this.complete,
    note : note?? this.note,
    id : id?? this.id);

  @override
  List<Object> get props =>[complete , id, note, task];

}

