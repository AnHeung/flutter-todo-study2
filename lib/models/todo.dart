import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(this.task, {
    this.complete,
    String id,
    String note,
  }):this.note = note ?? '', this.id = id ?? 'id';

  Todo copyWith({bool complete ,String id, String note , String task})=> Todo(
    task ?? this.task,
    complete: complete ?? this.complete,
    note : note?? this.note,
    id : id?? this.id);

  @override
  List<Object> get props =>[complete , id, note, task];

}

