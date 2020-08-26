// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoContent _$TodoContentFromJson(Map<String, dynamic> json) {
  return TodoContent(
    id: json['id'] as String,
    task: json['task'] as String,
    note: json['note'] as String,
    isComplete: json['isComplete'] as bool,
  );
}

Map<String, dynamic> _$TodoContentToJson(TodoContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'note': instance.note,
      'isComplete': instance.isComplete,
    };
