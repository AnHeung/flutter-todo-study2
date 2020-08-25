import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/app.dart';
import 'package:todo_test2/repository/repository.dart';
import 'package:todo_test2/util/simple_bloc_observer.dart';

void main() {
  runBlocObserver();
  runApp(App());
}

runBlocObserver(){
  Bloc.observer = SimpleBlocObserver();
}

configApi(){
  final client = RestClient(Dio()
    ..options.headers["Demo-Header"] = "demo");
}


