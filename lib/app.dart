import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_test2/bloc/filter_todo/filter_todo_bloc.dart';
import 'package:todo_test2/bloc/stats/stats_bloc.dart';
import 'package:todo_test2/bloc/tab/tab_cubit.dart';
import 'package:todo_test2/bloc/todo/todo_bloc.dart';
import 'package:todo_test2/constants/routes.dart';
import 'package:todo_test2/models/todo.dart';
import 'package:todo_test2/repository/repository.dart';
import 'package:todo_test2/screen/add_edit_screen.dart';
import 'package:todo_test2/screen/home_screen.dart';
import 'package:todo_test2/screen/splash_screen.dart';
import 'package:todo_test2/widget/filter_todo.dart';
import 'package:todo_test2/widget/stats.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_){
        final RestClient restClient = RestClient(Dio()..options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000));
        return ApiRepository(restClient:restClient);
      },
      child: BlocProvider(
        create: (context)=> TodoBloc(repository: context.repository<ApiRepository>())..add(TodoLoaded()),
        child: MaterialApp(
          title: 'todo test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            Routes.home: (context)=> MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_)=>TabCubit(),
                ),
                BlocProvider(
                  create: (_)=>FilterTodoBloc(todoBloc: BlocProvider.of<TodoBloc>(context)),
                ),
                BlocProvider(
                  create: (_)=>StatsBloc(todoBloc: BlocProvider.of<TodoBloc>(context))..add(StatsInitialize()),
                ),
              ],
              child: HomeScreen(),
            ),
            Routes.addScreen: (context)=> AddEditScreen(isEditing: false, onSaveCallback: (note,task){
              BlocProvider.of<TodoBloc>(context).add(TodoAdded(addedTodo: Todo(task , note: note)));
            }),
          },
          onGenerateRoute:(_)=>SplashScreen.route(),
        ),
      ),
    );
  }
}
