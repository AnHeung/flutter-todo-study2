import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:todo_test2/models/api/example.dart';
import 'package:todo_test2/models/api/todo_content.dart';
import 'package:todo_test2/models/todo.dart';

part 'repository.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class RestClient {

  @GET("/235552db-c2b8-4422-b8b8-4934c53108ab")
  Future<List<TodoContent>> getTodos();

  @GET("/tasks")
  Future<List<Task>> getTasks();

  factory RestClient(Dio dio , {String baseUrl}) = _RestClient;

}

class ApiRepository {

  final RestClient restClient;

  const ApiRepository({this.restClient});

  Future<List<TodoContent>> getTodos()=> restClient.getTodos();

  Future<List<Task>> getTasks()=> restClient.getTasks();

}