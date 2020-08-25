
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'todo_content.g.dart';

@JsonSerializable()
class TodoContent {
  String id;
  String task;
  String note;
  bool isComplete;

  TodoContent({
      this.id, 
      this.task, 
      this.note, 
      this.isComplete});

  factory TodoContent.fromJson(Map<String, dynamic> json)=> _$TodoContentFromJson(json);

  Map<String,dynamic> toJson()=> _$TodoContentToJson(this);

}